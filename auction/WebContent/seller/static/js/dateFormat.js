
//时间处理

function formatDate(time) {
    var date=new Date(time);
    var year=date.getFullYear();
    var month= date.getMonth()+1<10 ? "0"+(date.getMonth()+1) : date.getMonth()+1;
    var day=date.getDate()<10 ? "0"+date.getDate() : date.getDate();
    // 拼接
    return year+"-"+month+"-"+day;
}


function formatFullDate(time) {
    var date=new Date(time);
    var hours=date.getHours()<10 ? "0"+date.getHours() : date.getHours();
    var minutes=date.getMinutes()<10 ? "0"+date.getMinutes() : date.getMinutes();
    var seconds=date.getSeconds()<10 ? "0"+date.getSeconds() : date.getSeconds();
    // 拼接
    return formatDate(time)+" "+hours+":"+minutes+":"+seconds;
}

//返回 01-12 的月份值  
function getMonth(date){ 
  var month = ""; 
  month = date.getMonth() + 1; //getMonth()得到的月份是0-11 
  if(month<10){ 
    month = "0" + month; 
  } 
  return month; 
} 
//返回01-30的日期 
function getDay(date){ 
  var day = ""; 
  day = date.getDate(); 
  if(day<10){ 
    day = "0" + day; 
  } 
  return day; 
}
//返回小时
function getHours(date){
  var hours = "";
  hours = date.getHours();
  if(hours<10){ 
    hours = "0" + hours; 
  } 
  return hours; 
}
//返回分
function getMinutes(date){
  var minute = "";
  minute = date.getMinutes();
  if(minute<10){ 
    minute = "0" + minute; 
  } 
  return minute; 
}
//返回秒
function getSeconds(date){
  var second = "";
  second = date.getSeconds();
  if(second<10){ 
    second = "0" + second; 
  } 
  return second; 
}
	function formatDate1(longdate) {
		 var datetimeType = ""; 
		  var date = new Date(parseInt(longdate)); 
		  datetimeType+= date.getFullYear();  //年 
		  datetimeType+= "-" + getMonth(date); //月  
		  datetimeType += "-" + getDay(date);  //日 
		  datetimeType+= "  " + getHours(date);  //时 
		  datetimeType+= ":" + getMinutes(date);   //分
		  datetimeType+= ":" + getSeconds(date);   //分
		  return datetimeType;
	}
	
