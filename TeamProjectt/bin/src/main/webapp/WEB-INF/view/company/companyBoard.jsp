
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>companyBoard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="/TeamProjectt/resources/jquery.min.js"></script>
<%@include file="../include/mainPage2.jsp"%>

</head>
<body>

<script type="text/javascript">
	$(function(){
		
		let operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/TeamProjectt/company/modify").submit();
		});
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","TeamProjectt/company/companyList")
			operForm.submit();
		});
		
// 			var bnoValue = $("#operForm").find("#bno").val();
// 			var replyUL = $(".chat");
		
// 			replyList.showList(1,bnoValue,replyUL);
		});
</script>

<div class="container">
     
   <div class="row" >
   		<div class="box col-lg-8 shadow mb-4" style="margin: 30px; width: 1290px; height: auto;">
  			<div class="card-body p-5">
  			 
  			  <div class="col-lg-12 " style="margin-bottom:20px; ">
                 회사 게시판 > <c:out value="${company.c_name }"/>
              </div>
  			 
  			 
	  			<div class="board_title" >
	                <div class="row">
	                	<div class="col-lg-12">
	                		<h3 class="title"><c:out value="${c_board.title }"/></h3>
	                	</div>
	                </div>
					<div class="row" >
						<div class="col-lg-12" >
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="user-block">
									<span class="username"><c:out value="${c_board.writer}"/></span>
									<span class="description">(<fmt:formatDate pattern="yyyy-MM-dd" value="${c_board.regdate }"/>)</span>
									<span class="description" style="justify-content:end;">조회0</span>
<%-- 									<input type='hidden' id='cno' name='cno' value=${company.cno }/> --%>
									<hr style="border: solid 2px; width:100%; ">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="content-area">
									<div class="content"  style="height:400px;">
									<c:out value="${c_board.content}"/>
									</div>
<!-- 									<button data-oper='modify' class="btn btn-default"> -->
<%-- 									<a href="/board/modify?bno=<c:out value="${board.bno }"/>">Modify</a></button> --%>
									
<!-- 									<button data-oper='remove' class="btn btn-danger"> -->
<%-- 									<a href="/board/remove?bno=<c:out value="${board.bno }"/>">Remove</a></button> --%>
									
<!-- 									<button data-oper='list' class="btn btn-info"> -->
<!-- 									<a href="/board/list">List</a> -->
<!-- 									</button> -->
									
<!-- 									<button type="submit" data-oper='modify' class="btn btn-default">Modify</button> -->
<!-- 									<button type="submit" data-oper='list' class="btn btn-info">List</button> -->
										<div>
											<button data-oper='modify' class="btn btn-sm btn-success">Modify</button>
											<button data-oper='list' class="btn btn-sm btn-secondary" >
											<a href="/TeamProjectt/company/company?cno=${company.cno }"
											style="text-decoration-line:none; color: white;">
											<input type='hidden' name='cno' value='${company.cno }'>List</button>
										</div>
										
									<form id='operForm' action="/TeamProjectt/company/modify" method="get"> <!-- get방식, 수정창 띄우는거니까 -->
										<input type='hidden' id='bno' name='bno' value='<c:out value="${c_board.bno }"/>'>
<%-- 										<input type='hidden' id='cno' name='cno' value='<c:out value="${c_board.cno }"/>'> --%>
										<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
										<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
										<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
									</form>
	<!-- 댓글조회    -->
            <div class="card mb-3" style="margin: 40px 0px;">
               <div class="card-header bg-default">
                    <i class="fa fa-comment fa">댓글</i> 
               </div><br/>
               <div class="card-body-2">
                  <ul class="list-group list-group-flush"></ul>
                      <li class="list-group-item">
                      <ul class="chat">
                        
                      </ul>
                      <div class="panel-footer"></div>
<!--              <div class="card-body clearfix bg-white"  style="justify-content:center; display: flex; "> -->
<!--             <ul class="pagination pagination-sm m-0 float-right" style="justify-content-end; "> -->
<!--                <li class="page-item"><a class="page-link" href="#">«</a></li> -->
<!--                <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!--                <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!--                <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--                <li class="page-item"><a class="page-link" href="#">»</a></li> -->
<!--             </ul> -->
<!--          </div> -->
                  </div>
             <!-- 댓글작성    -->
             <div class="div_reply" style="margin: 20px 0px;">
               <div class="card mb-2">
                  <form onsubmit="return false">
                        <div class="card-body bg-white">
                        <div class=" col-lg-12 write_reply">
                          <i class="fa fa-comment fa"></i> 댓글쓰기
                         </div>
                          
                          <div class=" col-lg-12 write_reply" style="margin-top:10px;">
                             <strong>홍길동</strong>
	                      </div>
		                      
                      	<div class="col-sm-6 mb-3 mt-3">
		                <label for="content">content:</label>
		                <textarea class="form-control" rows="5" cols="50" id="content" name="content" placeholder="Enter content"></textarea>
		            	</div>
			        	<input type="hidden" name="bno" value="${get.bno}">
	                 	<button id	='addReplyBtn' class='btn btn-dark'>등록</button>
	                 	</div>
                     </form>
               </div>
            </div>   
                  </div>
                  
            
      </div>
   </div>      
                     </div>
                     
                     
                  </div>
               </div>
            </div>
							</div>
							<!-- end panel-body -->
						</div>
						<!-- end panel-body -->
<%-- 					<%@include file="../reply/reply_modal_ui.jsp" %> --%>
					<script type="text/javascript" src="/Teamprojectt/resources/js/reply/reply_new_btn_load.js"></script>
					<script type="text/javascript" src="/Teamprojectt/resources/js/reply/reply_ajax.js"></script>
					<script type="text/javascript" src="/Teamprojectt/resources/js/reply/reply_list.js"></script>
					<script type="text/javascript" src="/Teamprojectt/resources/js/reply/reply_list_load.js"></script>
					<script type="text/javascript" src="/Teamprojectt/resources/js/reply/reply_list_click_load.js"></script>
					<script type="text/javascript" src="/Teamprojectt/resources/js/reply/reply_page_click_load.js"></script>
					
<%--             		<%@include file="../reply/reply_ajax_test.jsp" %> --%>
				</div>
					</div>
					<!-- end panel -->
<!-- 				/.row -->
				
				<p/>
				
<!-- 				./end row -->
            </div>
</div>
<%@include file="../include/modal.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>



