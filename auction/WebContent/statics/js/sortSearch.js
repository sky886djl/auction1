function bordercolorIn(obj) {
	obj.style.border = '3px solid #D91615'
}

function bordercolorOut(obj) {
	obj.style.border = '3px solid #EAEAEA'
}

function bordercolorIn1(obj) {
	obj.style.border = '3px solid #19AA6B'
}

function bordercolorOut1(obj) {
	obj.style.border = '3px solid #EAEAEA'
}

function bordercolorIn2(obj) {
	obj.style.border = '3px solid #77778C'
}

function bordercolorOut2(obj) {
	obj.style.border = '3px solid #EAEAEA'
}
function findElementById(o) {
	return document.getElementById(o);
}

function myonmouseover(o){
	findElementById(o).style.color='#D91615';
}

function myonmouseout(o){
	findElementById(o).style.color='#656565';
}

function link() {
	location.href = "product/sort/"+type+'/'+state+'/'+timeArea+'/'+price+'/'+bidNum+'/'+pricelow_pricehigh+'/'+startTime_endTime;
}
window.onload = function() {
	choose11("type" + type);
	choose22("state" + state);
	choose33("time" + timeArea);
	if(startTime_endTime!='0'){
		var dates=startTime_endTime.split("_");
		$('#timebox1').datebox('setValue', parsedate(new Date(dates[0])));
		$('#timebox2').datebox('setValue', parsedate(new Date(dates[1])));
	} 
	
	if (timeArea != 0) {
		$('#timebox1').datebox('setValue', parsedate(new Date()));
		$('#timebox2').datebox('setValue', parsedate(getNextDays(timeArea)));
	} 

	//选中价格相关选项
	var defau=true;
	if(pricelow_pricehigh!='0'){
		var pris=pricelow_pricehigh.split('_');
		findElementById('price1').value=pris[0];
		findElementById('price2').value=pris[1];
		defau=false;
	}
	if(price!=0){
		var priceSort=findElementById('price');
		var numSort=findElementById('bidnum');
		if(price==1){
			priceSort.style.color = "#D91615";
			priceSort.innerHTML = "价格↑";
		} else if(price==2){
			priceSort.style.color = "#D91615";
			priceSort.innerHTML = "价格↓";
		}
		defau=false;
	}
		
	if(bidNum!=0){	
		if(bidNum==1){
			numSort.style.color = "#D91615";
			numSort.innerHTML = "出价次数↑";
		} else if(bidNum==2){
			numSort.style.color = "#D91615";
			numSort.innerHTML = "出价次数↓";
		}
		defau=false;
	}
	
	if(defau)
		choose44('a4');
		
	
	//加载总页数
	var temp=totalRecords/pageSize;
	if(temp>parseInt(temp))
		totalPage=parseInt(temp)+1;
	else
		totalPage=parseInt(temp);
	findElementById("totalPages").innerHTML=totalPage;
	if(totalRecords>0)
		goPage(1);
}

//html 选中某个筛选项
function choose(oa) {
	var o = findElementById(oa);
	o.style.color = "#FFFFFF";
	o.style.background = "#D91615";
}
//html 取消选中
function unchoose(oa,bgcolor) {
	var o = findElementById(oa);
	o.style.color = "#656565";
	o.style.background = bgcolor;
}

/*
 * --类型开始--
 */
function unchooseAllType() {
	for (var i = 1; i <= 8; i++) {
		unchoose("type" + i,"#FFFFFF");
	}
	unchoose('type0',"#F6F6F6");
}
function choose1(obj) {
	choose11(obj);
	link();
}

function choose11(obj) {
	unchooseAllType();
	choose(obj);
	type = obj.split("type")[1];
}
/*
 * --类型结束--
 */

/*
 * --状态开始--
 */
function unchoosAllState() {
	unchoose("state11","#FFFFFF");
	unchoose("state12","#FFFFFF");
	unchoose("state4","#FFFFFF");
	unchoose('state0',"#F6F6F6");
}
function choose2(obj) {
	choose22(obj);
	link();
}

function choose22(obj) {
	unchoosAllState();
	choose(obj);
	state = obj.split("state")[1];
}
/*
 * --状态结束--
 */


/*
 * 开拍时间 
 */

function parsedate(date) {
	var year = date.getFullYear();
	var month = date.getMonth() + 1; // 月份+1
	var day = date.getDate();
	return year+"-"+month+"-"+day;
}

function getNextDays(days) {
	var today = new Date();
	today.setDate(parseInt(today.getDate())+parseInt(days));
	return today;
}

function unchoosAllTime() {
	unchoose("time3","#FFFFFF");
	unchoose("time7","#FFFFFF");
	unchoose("time30","#FFFFFF");
	unchoose('time0',"#F6F6F6");
}
function choose3(obj) {
	startTime_endTime='0';
	choose33(obj);
	link();
}
function choose33(obj) {
	unchoosAllTime();
	choose(obj);
	timeArea=obj.split('time')[1];
	
}

function start_end() {
	var s1 = $("#timebox1").datebox("getValue");
	var s2 = $("#timebox2").datebox("getValue");
	if (s1 < s2) {
		startTime_endTime=s1+"_"+s2;
		timeArea=0;
	} else {
		$("#timebox1").datebox('setValue', '');
		$("#timebox2").datebox('setValue', '');
		return;
	}
	link();
}



function priceSortChange1() {
	unchoose('a4',"#FFFFFF");
	var priceSort = findElementById('price');
	var content = priceSort.innerHTML;
	priceSort.style.color = "#D91615";
	if (content.indexOf('↔') != -1 || content.indexOf('↓') != -1) {
		priceSort.innerHTML = "价格↑";
		price=1;//价格升序
	} else {
		priceSort.innerHTML = "价格↓";
		price=2;//价格降序
	}
}
function priceSortChange() {
	priceSortChange1();
	link();
}

function bidNumSortChange1() {
	unchoose('a4',"#FFFFFF");
	var bidSort = findElementById('bidnum');
	var content = bidSort.innerHTML;
	bidSort.style.color = "#D91615";
	if (content.indexOf('↔') != -1 || content.indexOf('↓') != -1) {
		bidSort.innerHTML = "出价次数↑";
		bidNum=1;//出价次数升序
	} else {
		bidNum=2;//降序
		bidSort.innerHTML = "出价次数↓";
	}
}
function bidNumSortChange() {
	bidNumSortChange1();
	link();
}
function choose4(obj) {//不限
	choose44(obj);
	link();
}
function choose44(obj){
	var bidSort = findElementById('bidnum');
	bidSort.innerHTML = "出价次数↔";
	bidSort.style.color = "#656565";
	var priceSort = findElementById('price');
	priceSort.innerHTML = "价格↔";
	priceSort.style.color = "#656565";
	findElementById('price1').value = '';
	findElementById('price2').value = '';
	price = 0;
	pricelow_pricehigh='0';
	bidNum=0;
	choose(obj);
}
function checkPrice(){
	var price1=findElementById('price1').value;
	var price2=findElementById('price2').value;
	if(parseInt(price1)>parseInt(price2)){
		findElementById('price1').value='';
		findElementById('price2').value='';
		return;
	}
	pricelow_pricehigh=price1+'_'+price2;
	link();
}
$.extend($.fn.validatebox.defaults.rules, {
	equaldDate : {
		validator : function(value, param) {
			var start = $(param[0]).datebox('getValue'); // 获取开始时间
			return value > start; // 有效范围为当前时间大于开始时间
		},
		message : '结束日期应大于开始日期!' // 匹配失败消息
	}
});

window.onscroll=function() {
	var height=document.documentElement.scrollTop||document.body.scrollTop;
	var priceguild=findElementById('priceguild');
	if(height>434){
		priceguild.style.position='fixed';
		priceguild.style.top="0px";
	} else {
		priceguild.style.position='relative';
	}
}

//分页
var pageSize=12;// 每页显示行数
var currentPage=1;// 当前页
var totalPage=0;// 总页数
function goPage(pno){
    var end=0;
	var start=(pno-1)*pageSize;
	if(pno*pageSize<=totalRecords){
		end=pno*pageSize;
	} else {
		end=totalRecords;
	}
	for(var i=0;i<totalRecords;i++){  
        if(i>=start && i<end){
            findElementById('element_'+i).style.display = "block";    
        }else{
        	 findElementById('element_'+i).style.display = "none";
        }
    }
}

function first() {
	if(totalPage>0){
		goPage(1);
		findElementById('pageNo').innerHTML=1;
	}
}

function last(){
	if(totalPage>0){
		goPage(totalPage);
		findElementById('pageNo').innerHTML=totalPage;
	}
}

function upPage(current) {
	var currentPage=parseInt(current.innerHTML);
	if(currentPage==1){// 第一页没有上一页
		return;
	} 
	current.innerHTML=currentPage-1;
	goPage(current.innerHTML);
}

function downPage(current) {
	var currentPage=parseInt(current.innerHTML);
	if(currentPage==totalPage){// 最后一页没有下一页
		return;
	} 
	current.innerHTML=currentPage+1;
	goPage(current.innerHTML);
}

function jumpToPage() {
	var pageno=findElementById('jumpToPage').value;
	if(pageno<1||pageno>totalPage){
		findElementById('jumpToPage').value='';
		return;
	}
	findElementById('pageNo').innerHTML=pageno;
	goPage(pageno);
}
