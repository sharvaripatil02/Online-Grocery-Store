$('#cart').click(function(){
		var quantity=$('#quantity').val();
		if(quantity!=''){
		$.post('cart.jsp',{quantity:quantity},
		function(data){
			$('#statuse').html(data);
		});
		}
		else{
			$('#statuse').html('');
		}
});