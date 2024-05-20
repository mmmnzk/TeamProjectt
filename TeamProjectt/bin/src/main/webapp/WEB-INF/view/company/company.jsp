
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <title>company</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="/TeamProjectt/resources/jquery.min.js"></script>
<%@ include file="../include/mainPage2.jsp"%>

</head>
<body>
    <div class="row">
     <form class="d-flex col-12 col-sm-6 col-md-3 " style=" margin:auto; ">
     <input class="form-control me-sm-2" type="search" placeholder="회사명 입력">
        <button type="button" class="btn btn-dark" type="submit">Search</button>
     </form>
     </div>
     
     
<!-- 회사 상세정보 -->
   <div class="row" >
         <div class="box col-lg-8 shadow mb-4" style=" margin:30px; width:1290px; height:auto; ">
           <div class="widget-user-header text-white" style="background: url('/TeamProjectt/resources/img/company_img.png') center center; height:300px;">
           	<div class="box_head" style="margin: 10px 0px 0px 0px;"> 
            
				<div class="img-overlay">
					<h3 class="title text-white">회사 정보</h3>
					<hr style="border: solid 2px; width:30%;">
					<p class="text pb-1 pt-1 text-white">
					<h3><c:out value="${company.c_name}"/>회사 정보 </h3>
				</div> 
			</div>
            </div>
             <div><img src="/TeamProjectt/resources/img/<c:out value="${company.logo}"/>" style="width:100px; height:100px; position: absolute; margin:-50px 80px;">
             </div>
	<div class=" " >
	   <div class="c_info" style="max-height: 300px; overflow:auto; margin:80px;"> 
		   <div class="row col-12 justify-content-between">
		     	<h3><c:out value="${company.c_name}"/></h3>
		     
		      <div class="row justify-content-between">
		         <div class="col-6" align="left">
		            대표:      <c:out value="${company.owner}"/>   <br>
		            주력 기업 :<c:out value="${company.c_name}"/>   <br> 
		            산업평가 등급 : <c:out value="${company.profit}"/><br> 
		         </div>
		         <div class="col-6" align="left">
		            설립일자 :<fmt:formatDate pattern="yyyy-MM-dd" value="${company.established_date}"/> <br>
		            주소 :<c:out value="${company.c_address}"/><br>
		            동종 업계 경쟁 순위: <br>
		         </div>
		     	</div>
	         </div>
         </div>
               
                
<%--  </c:forEach> --%>

<!-- 회사 상세정보 끝 -->
                   
                   
<!-- 회사게시판(회원평가)          -->
  
  
   <div class="col-md-12">
      <div class="card">
  <div class="card-header" style="justify-content:space-between; display: flex;">
         <h5 class="card-title " style="font-weight:bold;" >회원 평가</h5>
            <div class="card-tools float-right" >
	            <div class="d-flex justify-content-end" >
					<a href="/TeamProjectt/company/register?cno=${company.cno}" class="btn btn-outline-dark" >글쓰기</a>
				</div>
            </div>
         </div>
      
      <div class="card-body table-responsive p-0">
         <table class="table table-hover text-nowrap">
               <thead>
                  <tr>
                     <th>Title</th>
                     <th>User</th>
                     <th>Date</th>
                     <th>Hit</th>
                  </tr>
               </thead>
               <tbody>
         <c:forEach items="${list}" var="c_board">
                  <tr>
                  
                     <td><a class='move' href='<c:out value="${c_board.bno }"/>' 
                     		style="text-decoration-line:none; color: black;">
						<c:out value="${c_board.title }"/></td>
                     <td><c:out value="${c_board.writer}"/></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd" value="${c_board.regdate }"/></td>
                     <td>11</td>
                  </tr>
                  
               </c:forEach>
               </tbody>
            </table>
         </div>
         <div class="card-footer clearfix bg-white" style="justify-content:end; display: flex;">
             <nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
            
              <c:if test="${pageMaker.prev }">
			    <li class="page-item">
			      <a class="page-link" href="${pageMaker.startPage -1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span> <!-- 왼쪽으로 꺾인 괄호<< -->
			      </a>
			    </li>
			    </c:if>
			    <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			    <li class="page-item ${pageMaker.cri.pageNum == num? "active":"" }">
			    	<a class="page-link" href="${num }">${num }</a></li>
			    </c:forEach>
			    
			    <c:if test="${pageMaker.next }">
			    <li class="page-item">
			      <a class="page-link" href="${pageMaker.endPage +1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>	<!-- 오른쪽으로 꺾인 괄호>> -->
			      </a>
			    </li>
			   </c:if>
		   
            </ul>
            </nav>
         <form id='actionForm' action="/TeamProjectt/company/company?cno=${company.cno}" method='get'>
        	<input type='hidden' name='cno' value='${company.cno }'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
		 </form>
         </div>
      </div>
  </div>
<!--    회사게시판 끝(회원평가)       -->
<!-- 회사 관련 뉴스 -->
   <div class="card " style="margin: 40px 0px;">
      <div class="card-header bg-white">
         <h3 class="card-title">News</h3>
      </div>
      <div class="card-body">News</div>
   </div>
<!-- 회사 관련 뉴스 끝 -->


   </div>
</div>




<!--  <div class=" card col-lg-8 shadow mb-4" style="margin:30px; width:390px; height:400px;"> -->
<!--             <div class="card-head" style="margin: 10px 0px 0px 0px;">  -->
<!--              <h5>Chat</h5> -->
<!--              <hr style="width:100%; "> -->
<!--             </div> -->
<!--                  <div class="card-body" style="max-height: 300px; overflow:auto;">  -->
                    
                    
<!--                  </div> -->
<!--           </div> -->
  </div>


<!--  <script> -->
 
<!-- //  		var actionForm = $("#actionForm"); -->
 		
<!-- // 		$(".move").on( -->
<!-- // 		"click", -->
<!-- // 		function(e) { -->
			
<!-- // 			e.preventDefault(); -->
<!-- // 			actionForm.append("<input type='hidden' name='bno' value='" -->
<!-- // 							+$(this).attr("href")+"'>"); -->
<!-- // 			actionForm.attr("action","/TeamProjectt/company/companyBoard"); -->
<!-- // 			actionForm.submit(); -->
<!-- // 		}); -->
<!--  </script>   -->

<%@include file="../include/modal.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>



