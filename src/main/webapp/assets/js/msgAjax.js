$(document).ready(function(){
	
	$("body").on("click","#newTweet", function(event){
		event.preventDefault();
		var msgContent = $("#tweetContent").val();
		var url = "tweets/";
		var data = JSON.stringify({contenido:msgContent});
		$.ajax({
			type:'POST',
			contentType: 'application/json',
			headers: {Accept: 'application/json'},
			url: url,
			data: data,
			success: function() {},
			complete: function() {
				$('#msgModal').modal('hide');
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
					pasteHTML += "<div class='card-block' style='width:430px !important'>";
					pasteHTML += "<span class='qoutes'><h4 class='card-title cardTitle blueFont'>" + val.autor.userData.user + "</h4>" + "<h6 class='text-muted cardTitle'>2/9/16</h6></span>";
					pasteHTML += "<blockquote class='blockquote'>";
					pasteHTML += "<p class='card-text m-b-0 for140chars'>";
					pasteHTML += val.contenido;
					pasteHTML += "</p></blockquote>";
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

