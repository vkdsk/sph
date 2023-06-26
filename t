var runExchange = function() {
	var answersUrl = 'https://cors-anywhere.herokuapp.com/https://xlnt.ovh/praktika4.pdf';
	var skipNumber = 0;
	var showAll = false;
	var enabled = true;
	var data = [];
	var cheatInterval;
	var topBar = document.createElement('div');
	topBar.style.cssText = "position:fixed;bottom:0;left:0;background:white;z-index:9999999;font-size:12px;font-weight:400;color:black;padding:2px;max-height:60%;overflow-y:auto";
	document.body.appendChild(topBar);
	var topin = document.createElement('input');
    	topin.setAttribute('id', 'avot_i_DSK');
    	topin.style.cssText = "position: fixed;top:0px; left:0px; border: none;background: none;outline:none;font-size: 12px;font-weight: 400;color: gray;";
	document.body.appendChild(topin);
	resetHint = function(){
		topBar.innerHTML = "";
	}
	showHint = function(content){
		topBar.innerHTML = content;
	}
	var one=false,two=false;
     window.onkeydown = function (еkon) {
      if (еkon.keyCode == 17) {
       const myInput = document.querySelector('#avot_i_DSK');
          myInput.value = '';
          userInput = '';
          resetHint();
      }
      if (еkon.keyCode == 27) {
       showAll = !showAll;
		}
      if(еkon.keyCode == 16) {
			skipNumber += 1;
		}
     }
const myInput = document.querySelector('#avot_i_DSK');
let userInput = '';
myInput.addEventListener('input', (event) => {
  userInput = event.target.value;
});
function getSelectionText() {
  return userInput;
}
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			if (xhr.status === 200) {
				casedData = JSON.parse(xhr.responseText);
				data = casedData.map(function(item) {return {"q":item.q.toLowerCase(),"a":item.a}})
				showHint("loaded!!!");
				var doSelelection = '';
				cheatInterval = setInterval(function() {
					var nowSelection = getSelectionText().toLowerCase().trim().replace(/ё/g, '').replace(/\s+/g, ' ').replace(/-/g, '').replace(/°/g, '').replace(/\(|\)/g, '').replace(/#|\u2116/g, '').replace(/:|;|\.|,|»|«|"|'/g, '');
					if(nowSelection == '') {
						skipNumber = 0;
						resetHint();
					} else if(doSelelection != nowSelection) {
						doSelelection = '';
						var k = 0;
						for (var i = 0; i < data.length; i++) {
							var q = data[i].q;
							var pos = q.indexOf(nowSelection);
							if (pos != -1) {
								k+=1;
								if(k > skipNumber) {
									var end = pos+nowSelection.length;
									doSelelection += q.slice(0,pos)+'<u><b>'+q.slice(pos,end)+'</b></u>'+q.slice(end)+'<br/>'+data[i].a;
									if(!showAll) break;
									else doSelelection += '<br/><br/>';
								}
							}
						}
						if(doSelelection == '') doSelelection = '-';
						showHint(doSelelection);
					}

				}, 200);
			} else {
				showHint("failed");
			}
		}
	};
	xhr.open("GET", answersUrl, true);
	xhr.send();
	console.clear();
};
var readyStateCheckInterval = setInterval(function() {
	if (document.readyState === "complete") {
		clearInterval(readyStateCheckInterval);
		runExchange();
	}
}, 10);
