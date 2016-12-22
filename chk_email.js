$('#EmailID').keyup(function()
{
	var EmailID = $('#EmailID').val();
	$('#statuse').html('<span><div><img src="loading.gif"></div></span>');
	if (EmailID!=''){
		$.post('check_email.jsp',{EmailID:EmailID},
		function(data){
			$('#statuse').html(data);
		});
	}
	else{
		$('#statuse').html('');
	}
});




 