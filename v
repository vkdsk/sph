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
iframe.width = "1280";
iframe.height = "80";
const header = document.querySelector('#adaptable-page-header-wrapper');
header.parentNode.insertBefore(iframe, header.nextSibling);
