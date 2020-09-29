function getById(str) {
    return document.getElementById(str);
}
 
var prov = getById('prov');
var city = getById('city');
var country = getById('country'); 
/*用于保存当前所选的省市区*/
var current = {
    prov: '',
    city: '',
    country: ''
};
var address=document.getElementById('address');
if(address.value.split(' ').length==3){
	var ads=address.value.split(' ');
	 var provOpt = document.createElement('option');
     provOpt.innerText = ads[0];
     provOpt.value = -1;
     prov.appendChild(provOpt);
     prov.options[1].selected=true;
     
     provOpt = document.createElement('option');
     provOpt.innerText = ads[1];
     provOpt.value = -1;
     city.appendChild(provOpt);
     city.options[1].selected=true;
     
     provOpt = document.createElement('option');
     provOpt.innerText = ads[2];
     provOpt.value = -1;
     country.appendChild(provOpt);
     country.options[1].selected=true;
}
/*自动加载省份列表*/
(function showProv() {
    var len = provice.length;
    for (var i = 0; i < len; i++) {
        var provOpt = document.createElement('option');
        provOpt.innerText = provice[i]['name'];
        provOpt.value = i;
        prov.appendChild(provOpt);
    }
})();
 
/*根据所选的省份来显示城市列表*/
function showCity(obj) {
    var val = obj.options[obj.selectedIndex].value;
    if (val != current.prov) {
        current.prov = val;
    }
    //console.log(val);
    if (val != null) {
        city.length = 1;
        var cityLen = provice[val]["city"].length;
        for (var j = 0; j < cityLen; j++) {
            var cityOpt = document.createElement('option');
            cityOpt.innerText = provice[val]["city"][j].name;
            cityOpt.value = j;
            city.appendChild(cityOpt);
        }
    }
}
 
/*根据所选的城市来显示县区列表*/
function showCountry(obj) {
    var val = obj.options[obj.selectedIndex].value;
    current.city = val;
    if (val != null) {
        country.length = 1; //清空之前的内容只留第一个默认选项
        var countryLen = provice[current.prov]["city"][val].districtAndCounty.length;
        if (countryLen == 0) {
            return;
        }
        for (var n = 0; n < countryLen; n++) {
            var countryOpt = document.createElement('option');
            countryOpt.innerText = provice[current.prov]["city"][val].districtAndCounty[n];
            countryOpt.value = n;
            country.appendChild(countryOpt);
        }
    }
}
 
/*选择县区之后的处理函数*/
function selecCountry(obj) {
    current.country = obj.options[obj.selectedIndex].value;
	address.value=provice[current.prov]['name']+' '+provice[current.prov]['city'][current.city].name+
			' '+provice[current.prov]["city"][current.city].districtAndCounty[current.country];
}
 
