$(document).ready(function(){
	
	$("body").on("click","#newTweet", function(event){
		event.preventDefault();
		var msgContent = $("#tweetContent").val();
		var url = "mensajes/";
		var data = JSON.stringify({contenido:msgContent});
		$.ajax({
			type:'POST',
			contentType: 'application/json',
			headers: {Accept: 'application/json'},
			url: url,
			data: data,
			success: function() {},
			complete: function() {
				fillMsgList();
			}
		});
	});
	
	$(document).ready(function(){
		fillMsgList();
	});
	
	function fillMsgList(){
		var url = "tweets/";
		$.ajax({
			type:'GET',
			headers: {Accept: 'application/json'},
			url: url,
			data: {},
			success: function(data) {
				var pasteHTML = "";
				$.each(data, function(i, val){
					
					pasteHTML += "<li class=' tweet radio'>";
					pasteHTML += "<div class='card'style='max-width: 32rem;'>";
					pasteHTML += "<div class='card-block' style='width:200px !important'>";
					pasteHTML += "<h4 class='card-title'>" + val.autor.userData.user + "</h4>";
					pasteHTML += "<p class='card-text'>" + val.contenido + "</p>";

					pasteHTML += "<a href='#' class='card-link'>button1</a>"
					pasteHTML += "<a href='#' class='card-link'>button2</a>"
					pasteHTML += "</div>";

					pasteHTML += "</div>";	
					pasteHTML += "</li>";
				
				});
				$("#tablonMsg").html(pasteHTML);
			}
		});
	}
	
});

