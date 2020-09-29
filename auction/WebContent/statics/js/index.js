function bordercolorIn(obj){
    obj.style.border='3px solid #D91615'
}

function bordercolorOut(obj){
    obj.style.border='3px solid #EAEAEA'
}

function bordercolorIn1(obj){
    obj.style.border='3px solid #19AA6B'
}

function bordercolorOut1(obj){
    obj.style.border='3px solid #EAEAEA'
}

// 猜你喜欢
function guessyoulikeIn(obj){
    obj.style.outline='2px solid #D91615';
}

function guessyoulikeIn1(obj){ 
    obj.style.outline='2px solid #19AA6B';
}
function guessyoulikeOut(obj){
    obj.style.outline='none'
}


function processIn(id){
	document.getElementById(id).setAttribute("src",'statics/images/icon/'+id+'2.png'); 
}
function processOut(id){
	document.getElementById(id).setAttribute("src",'statics/images/icon/'+id+'1.png'); 
}

/*图片滚动效果*/
var speedpic = 20;//速度数值越大速度越慢
document.getElementById("list2").innerHTML = document.getElementById("list1").innerHTML;
function Marqueepic() {
    if (document.getElementById("list2").offsetWidth
            - document.getElementById("list").scrollLeft <= 0) {
        document.getElementById("list").scrollLeft -= document
                .getElementById("list1").offsetWidth;
    } else {
        document.getElementById("list").scrollLeft++;
    }
}
var MyMarpic = setInterval(Marqueepic, speedpic);
document.getElementById("list").onmouseover = function() {
    clearInterval(MyMarpic);
}
document.getElementById("list").onmouseout = function() {
    MyMarpic = setInterval(Marqueepic, speedpic);
}

/*window.onscroll=function() {
	var height=document.documentElement.scrollTop||document.body.scrollTop;
	var news=document.getElementById('news');
	if(height>1500){
		news.style.position='relative';
		news.style.marginTop="800px";
		news.style.bottom="120px";
	}
	else if(height>700){
		news.style.zIndex="10";
		news.style.position='fixed';
		news.style.top="0";
		news.style.marginTop="0px";
	} else {
		news.style.marginTop="0px";
		news.style.position='relative';
	}
	console.log(height);
}*/
