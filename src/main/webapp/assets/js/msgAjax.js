$(document).ready(function(){
	
	
	$(document).ready(function(){
		alert("hello");
		fillMsgList();
	});
	
	function fillMsgList(){
		var url = "mensajes/";
		$.ajax({
			type:'GET',
			headers: {Accept: 'application/json'},
			url: url,
			data: {},
			success: function(data) {
				var pasteHTML = "";
				$.each(data, function(i, val){
					
					pasteHTML += "<li class='card text-xs-center tweet radio'>";
					pasteHTML += "<div class='card-header'>";
					pasteHTML += "<h4 class='card-title'>@JSGO</h4>";	
					pasteHTML += "</div>";
					pasteHTML += "<div class='card-block'>";
					pasteHTML += "<p class='card-text'>hola</p>";	
					pasteHTML += "</div>";
					pasteHTML += "<div class='card-footer text-muted'>2 days ago</div>";
					pasteHTML += "</li>";
				
				});
				$("#tablonMsg").append(pasteHTML);
				alert("help");
			}
		});
	}
	
});

