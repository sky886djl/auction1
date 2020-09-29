
function find(o){
	return document.getElementById(o);
}

function contentChange(obj){
	var length=obj.value.length;
	if(length>1000){
		return;
	}
	find('textarea-length').innerText=length;
}

function checkTitle() {
	if(find('articletitle').value.length==0){
		find('titlespan').innerHTML='文章标题不能为空';
		return false;
	}
	find('titlespan').innerHTML='';
	return true;
}

function checkArticleType(){
	if(find('articletype').value=='3'){
		find('articletypespan').innerHTML='请选择文章类型';
		return false;
	}
	find('articletypespan').innerHTML='';
	return true;
}

function checkContent() {
	if(find('articleContent').value.length==0){
		find('contentspan').innerHTML='文章内容不能为空';
		return false;
	}
	find('contentspan').innerHTML='';
	return true;	
}

function checkAll(){
	return checkTitle()&&checkArticleType()&&checkContent();
}




