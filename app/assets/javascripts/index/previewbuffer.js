/*
 * MathJax preview with double buffering
*/
var PreviewBuffer = (function()
{
	var mathjax_running = false;
	var update_required = false;
	var raw_text = "";
	var buffer; // buffer id
	var preview; // preview element (jQuery object)

	function mathjax_callback()
	{
		mathjax_running = false;

		var buff = $('#' + buffer);

		// Swap buffers
		preview.html(buff.html());

		// Pretty print code
		PR.prettyPrint();

		if(update_required)
		{
			update_text();
		}
	}

	// Enqueue the rendering in the MathJax queue
	function update_text()
	{
		mathjax_running = true;
		update_required = false;

		// Parse BBCode
		$('#' + buffer).html(BBCodeParser.parse(PageUtil.h(raw_text)));

		// Enqueue
		MathJax.Hub.Queue(["Typeset", MathJax.Hub, buffer], [mathjax_callback]);
	}

	var ret =
	{
		// Called to update the text
		update: function(text)
		{
			raw_text = text;

			if(mathjax_running)
			{
				update_required = true;
			}
			else
			{
				update_text();
			}
		},
		set_buffers: function($preview, buffer_id)
		{
			preview = $preview;
			buffer = buffer_id;
		}
	};
	return ret;
})();

// Parse LaTeX on page
PreviewBuffer.parse_on_page = function()
{
	if(PreviewBuffer.interval)
	{
		window.MathJax.Hub.Queue(["Typeset", window.MathJax.Hub]);
		return;
	}

	function on_timeout()
	{
		if(window.MathJax && window.MathJax.isReady) // Is MathJax done loading ?
		{
			clearInterval(PreviewBuffer.interval);
			window.MathJax.Hub.Queue(["Typeset", window.MathJax.Hub]);
		}
	}

	if(!window.MathJax || !window.MathJax.isReady)
	{
		PreviewBuffer.interval = setInterval(on_timeout, 200); // Check every 200 ms
	}
};
