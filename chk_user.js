$('#username').keyup(function()
{
	
	var username = $('#username').val();
	$('#status').html('<span><div><img src="loading.gif"></div></span>');
	if (username!=''){
		$.post('check_user.jsp',{username:username},
		function(data){
			$('#status').html(data);
		});
	}
	else{
		$('#status').html('');
	}
});
