function jump(src) {
	location.href=src;
}


//		var currentLeft=document.getElementById('myelementInfo');
//		currentLeft.style.background='#FF4401';
//		currentLeft.style.color='white';
//		var url=location.href.split("main=");
//		if(url.length>1){
//			if(url[1].indexOf('html')!=-1){
//				document.getElementById('main').innerHTML="<object type='text/html' data='"+url[1]+"' width='100%' height='100%'></object>";
//				leftClick(url[1].split('.html')[0]);
//			} /*else {
//				document.getElementById('main').innerHTML="<iframe src='"+url[1]+"' width='100%' height='100%'></iframe>";
//			}*/
//			
//		} else {
//			jump('myelementInfo.html');
//		}
//		function leftClick(src) {
//			var newItem=document.getElementById(src);
//			currentLeft.style.background='#F5F8FA';
//			currentLeft.style.color='black';
//			newItem.style.background='#FF4401';
//			newItem.style.color='white';
//			currentLeft=newItem;
//		}
//		
//		function select(index) {
//			document.getElementById('titlePic').style.marginLeft=index+"px";
//		}