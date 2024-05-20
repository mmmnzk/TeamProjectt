console.log("Reply New Button -> Modal window Load.......");

$(function(){
	
//	var modal = $(".modal");
//	
//	var modalInputReply = modal.find("input[name='reply']");
//	var modalInputReplyer = modal.find("input[name='replyer']");
//	var modalInputReplyerDate = modal.find("input[name='replyerDate']");
//
//	var modalModBtn = $("#modalModBtn");
//	var modalRemoveBtn = $("#modalRemoveBtn");
//	var modalRegisterBtn = $("#modalRegisterBtn");
	
//	$("#addReplyBtn").on("click", function(e){
//		
//		modal.find("input").val("");
//		modalInputReplyerDate.closest("div").hide();
//		modal.find("button[id !='modalCloseBtn']").hide();
//		
//		modalRegisterBtn.show();
//		
//		$(".modal").modal("show");
//	});
	
//	$("#modalCloseBtn").on("click", function(e){
//	
//		modal.modal('hide');
//	});
//	
	
//	var bnoValue = '<c:out value="${board.bno}"/>';

	var div1 = $(".div_reply");

	var inputReply = div1.find("textarea[name='reply']");
	var inputReplyer = div1.find("input[name='replyer']");
	var inputNickName = div1.find("input[name='replyer_nickname']");
	
	var bnoValue = $("#operForm").find("#bno").val();
	var replyUL = $(".chat");
	var pageUI = $(".panel-footer");
	
	$("#addReplyBtn").on("click",function(e){
		
		var reply = {
						reply:inputReply.val(),
						replyer:inputReplyer.val(),
						nickname:inputNickName.val(),
						bno:bnoValue
					};
					
		replyService.add(reply, function(result){
			
			alert(result);
			
//			modal.find("input").val("");
//			modal.modal("hide");
			
//			showList(1);
			replyList.showList(1, bnoValue, replyUL, pageUI);
			
		});
	});
	
});