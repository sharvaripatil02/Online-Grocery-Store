function onlyNumbers(evt)
{
var e = event || evt; 
var charCode = e.which || e.keyCode;

if (charCode > 31 && (charCode < 48 || charCode > 57))
    return false;

return true;

}
 function onlyAlphabets(evt) {

var e = event || evt;
var charCode = e.which || e.keyCode;

if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
    return false;

return true;

}
 function AlphaNumeric(evt) {

var e = event || evt;
var charCode = e.which || e.keyCode;

if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && (charCode < 48 || charCode > 57))
    return false;

return true;

}

 function AlphaNumericSp(evt) {

var e = event || evt;
var charCode = e.which || e.keyCode;

if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && (charCode < 48 || charCode > 57))
    return false;

return true;

}
 function PasswordChk(evt) {

var e = event || evt;
var charCode = e.which || e.keyCode;

if (charCode < 33 || charCode > 126)
    return false;

return true;

}

function myFunction() {
    var a = document.getElementById("check").checked;
	var b = $('input[name=check_card]:checked').length > 0;
	var c = $('input[name=check_add]:checked').length > 0;
	var d = document.getElementById("cvv_saved").value;
	var d_len = d.length;
	var e = document.getElementById("card").value;
	var e_len = e.length;
	var f = document.getElementById("exp_dt").value;
	var f_len = f.length;
	var g = document.getElementById("cvv").value;
	var g_len = g.length;
	var h = document.getElementById("AL1").value;
	var h_len = h.length;
	var i = document.getElementById("AL2").value;
	var i_len = i.length;
	var j = document.getElementById("City").value;
	var j_len = j.length;
	var k = document.getElementById("Zip").value;
	var k_len = k.length;
	if((c==true && b==true && d!='' && d_len==3) ||
(e!='' && f!='' && g!='' && c==true && e_len==16 && f_len==6 && g_len==3) ||
(b==true && h!='' && i!='' && j!='' && k!='' &&  k_len==5) ||
(e!='' && f!='' && g!='' && h!='' && i!='' && j!='' && k!='' && e_len==16 && f_len==6 && g_len==3 && k_len==5 ) || 
(e!='' && f!='' && g!='' && h!='' && i!='' && j!='' && k!='' && a==true && d_len==3 && e_len==16 && f_len==6 && g_len==3 && k_len==5 ) ||
(e!='' && f!='' && g!='' && a==true && c==true && e_len==16 && f_len==6 && g_len==3)||
(a==true && e!='' && f!='' && g!='' && c==true && e_len==16 && f_len==6 && g_len==3) ||
(e!='' && f!='' && g!='' && c==true && e_len==16 && f_len==6 && g_len==3)
){
	
	if ((e!='' && f!='' && g!='' && b==true)|| (h!='' && i!='' && j!='' && k!='' && c==true))
	{
		$('#error').html("Please check CVV,CARD_NO,EXP_DATE,ZIP or Select correct options");	
	if((e!='' && f!='' && g!='' && b==true && c==true)|| (h!='' && i!='' && j!='' && k!='' && c==true)){
		$('#error').html("Please check CVV,CARD_NO,EXP_DATE,ZIP or Select correct options");	
	if ((a==true && b==true && c==true && d!='' && e!='' && f!='' && g!='' && h!='' && i!='' && j!='' && k!=''  )) 
	{
		$('#error').html("Please check CVV,CARD_NO,EXP_DATE,ZIP or Select correct options");	
		if((b==true && c==true && d!='' && e!='' && f!='' && g!='' && h!='' && i!='' && j!='' && k!=''))
	$('#error').html("Please check CVV,CARD_NO,EXP_DATE,ZIP or Select correct options");	
	}
	}
	}
	else document.forms.order.submit();
}
else $('#error').html("Please check CVV,CARD_NO,EXP_DATE,ZIP or Select correct options");
}


 function myPrice(evt) {

var e = event || evt;
var charCode = e.which || e.keyCode;

if (charCode > 31 && (charCode < 46 || charCode > 57) || charCode==47)
    return false;

return true;

}

 function onlyAlphabetssp(evt) {

var e = event || evt;
var charCode = e.which || e.keyCode;

if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
    return false;

return true;

}

 function img(evt) {

var e = event || evt;
var charCode = e.which || e.keyCode;

if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && (charCode < 46 || charCode > 57))
    return false;

return true;

}

