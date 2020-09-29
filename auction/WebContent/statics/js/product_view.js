	var clock;
	function getTimes(deadline){
        // 获取结束时间的日期
        var endTime = new Date(deadline);
        // 获取当前日期
        var nowTime = new Date();
        // 获取结束时间与当前时间的总毫秒数
        var t = endTime.getTime() - nowTime.getTime();
        // 定义4个变量 存放日期
        var d = 0;
        var h = 0;
        var m = 0;
        var s = 0;
        // 如果获取的毫秒数>0
        if(t > 0){
            // 获取相对应的天时分秒
            d = Math.floor(t/1000/60/60/24);
            h = Math.floor(t/1000/60/60%24);
            m = Math.floor(t/1000/60%60);
            s = Math.floor(t/1000%60);
        } else {
        	//拍卖结束。。
        	//刷新
        	clearInterval(clock);
        	location.reload();
        	return;
        }
        
        if(d<10)
        	d='0'+d;
        if(h<10)
        	h='0'+h;
        if(m<10)
        	m='0'+m;
        if(s<10)
        	s='0'+s;
        // 写入到页面中
        getElementById('day').innerHTML = d;
        getElementById('hour').innerHTML = h;
        getElementById('minute').innerHTML = m;
        getElementById('second').innerHTML=s;
    }
	if(status==11){
		clock=setInterval(function(){getTimes(deadline)}, 0);// 执行倒计时的函数
	}
    // 封装获取id的讲话函数
    function getElementById(id){
        return document.getElementById(id);
    }
    
    function deposit() {
    	//var input=document.createElement("input");
    	if(username==null||username.length==0){
    		if(confirm('您还未登录，是否登录？')==true)
    			location.href="user/loginUI";
    	} else if(btn.value=='出价竞拍') {// 竞价
    		if(confirm("确认要出价："+moneyVal+"吗？")==true)
    			location.href='product/bidding/'+id+'/'+moneyVal;
    	} else { // 跳转到确认提交保证金
    		location.href='product/deposit/'+id;
    	}
    }
    
    function showimg(str){
        getElementById("imgshow").src=str;
    }
    
    function altRows(id){
        if(document.getElementsByTagName){
          var table = document.getElementById(id);
           var rows = table.getElementsByTagName("tr");
            for(i = 0; i < rows.length; i++){
                if(i % 2 == 0){
                    rows[i].className = "evenrowcolor";
                }else{
                    rows[i].className = "oddrowcolor";
                }
            }
        }
        var itable = getElementById('idDatas');
    	if(itable!=null){
    		var num = itable.rows.length;// 所有记录数
    		// 总共分几页
    		if(num/pageSize > parseInt(num/pageSize)){   
    			totalPage=parseInt(num/pageSize)+1;   
    		}else{   
    			totalPage=parseInt(num/pageSize);   
    		}
    		getElementById('totalPages').innerHTML=totalPage;
    		goPage(1);
    	}
    }
    function guessyoulike(){
    	if(guessLength>0){
			var t=parseInt(guessLength/pageSize1);
			if(t*pageSize1==guessLength){
				totalPage1=t;
			} else {
				totalPage1=t+1;
			}
			if(guessLength<=pageSize1){
	    		getElementById('guessnexttext').innerHTML='---';
	    		getElementById('guessnexttext').href="javascript:void(0)";
	    	} else {
	    		nextGood();
	    	}
		} 
		
    }
    function onload(){
    	guessyoulike();
    	altRows('alternatecolor');
    	// 加载表格页数
    }
    function origin(obj) {
    	obj.style.background='#F6F6F6';
    	obj.style.color='#333333';
    	obj.style.borderTop="1px #E6E6E6 solid";
    }
    function select1() {
    	getElementById('ttop1').style.background='white';
    	getElementById('ttop1').style.color='#D91615';
    	getElementById('ttop1').style.borderTop="1px #D91615 solid";
    	getElementById('ttop1').style.borderBottom="white";
    	origin(getElementById('ttop2'));
    	origin(getElementById('ttop3'));
    }
    function select2() {
    	getElementById('ttop2').style.background='white';
    	getElementById('ttop2').style.color='#D91615';
    	getElementById('ttop2').style.borderTop="1px #D91615 solid";
    	getElementById('ttop2').style.borderLeft="none";
    	origin(getElementById('ttop1'));
    	origin(getElementById('ttop3'));
    }
    
    function select3() {
    	getElementById('ttop3').style.background='white';
    	getElementById('ttop3').style.color='#D91615';
    	getElementById('ttop3').style.borderTop="1px #D91615 solid";
    	getElementById('ttop3').style.borderLeft="none";
    	origin(getElementById('ttop1'));
    	origin(getElementById('ttop2'));
    }
    
    window.onscroll=function() {
    	var height=document.documentElement.scrollTop||document.body.scrollTop;
    	var objectintro=getElementById('objectintro');
    	var recordsA=getElementById('recordsA');
    	var commentsA=getElementById('commentsA');
    	if(height<=recordsA.offsetTop-100){
    		select1();
    	} else if(height<=commentsA.offsetTop-134) {
    		select2();
    	} else {
    		select3();
    	}
    	if(height>852){
    		getElementById('ttop0').style.zIndex="10";
    		getElementById('ttop0').style.position='fixed';
    		getElementById('ttop0').style.top="0";
    	} else {
    		getElementById('ttop0').style.position='relative';
    	}
    	
    	
    }
    
    var pageSize=8;// 每页显示行数
    var currentPage=1;// 当前页
    var totalPage=0;// 总页数
    function goPage(pno){
    	
        var itable = getElementById('idDatas');
        var num = itable.rows.length;// 所有记录数
        if(pno>totalPage){
        	currentPage=totalPage;
        } else {
        	currentPage = pno;// 当前页数
        }
        var startRow = (currentPage - 1) * pageSize+1;// 开始显示的行 31
        var endRow = currentPage * pageSize;// 结束显示的行 40
        endRow = (endRow > num)? num : endRow;
        // 遍历显示数据实现分页
        for(var i=1;i<(num+1);i++){    
            var irow = itable.rows[i-1];
            if(i>=startRow && i<=endRow){
                irow.style.display = "table-row";    
            }else{
                irow.style.display = "none";
            }
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
    
    var pageSize1=4;
    var currentPage1=1;// 当前页
    var totalPage1=0;// 总页数
    function nextGood() {
    	if(currentPage1==totalPage1){
    		currentPage1=1;
    	} else {
    		currentPage1=1+currentPage1;
    	}
    	var end=0;
    	var start=(currentPage1-1)*pageSize1;
    	if(currentPage1*pageSize1<=guessLength){
    		end=currentPage1*pageSize1;
    	} else {
    		end=guessLength;
    	}
    	for(var i=0;i<guessLength;i++){  
            if(i>=start && i<end){
                getElementById('guessyoulike_'+i).style.display = "block";    
            } else {
            	getElementById('guessyoulike_'+i).style.display = "none";
            }
        }
    	getElementById('guessnexttext').href="javascript:nextGood()";
    }
