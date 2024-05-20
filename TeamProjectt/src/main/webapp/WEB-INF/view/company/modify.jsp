<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="/TeamProjectt/resources/jquery.min.js"></script>

<%@ include file="../include/mainPage2.jsp"%>


<body class="bg-gradient-primary">

<script type="text/javascript">
	$(function(){
	
		const formObj = $("#form1");
		
		$('button').on("click",
				function(e)
				{
					e.preventDefault();
					
					const operation = $(this).data("oper");
					
					console.log(operation);
					
					if (operation === 'remove')
					{
						formObj.attr("action","/TeamProjectt/company/company/remove");
					}
					else if (operation === 'list')
					{
// 						self.location="/board/list";
						formObj.attr("action","/company/companyList").attr("method","get");
						
						var pageNumTag = $("input[name='pageNum']").clone();
						var amountTag= $("input[name='amount']").clone();
						var keywordTag= $("input[name='keyword']").clone();
						var typeTag= $("input[name='type']").clone();
						
						formObj.empty();
						
						formObj.append(pageNumTag);
						formObj.append(amountTag);
						formObj.append(keywordTag);
						formObj.append(amotypeTaguntTag);
						
						
// 						return;
						
					}
					formObj.submit();
				});
		}); 

</script>




    <div class="container">

        <div class="card  border-0 shadow-lg my-5">
            <div class="card-body p-5">
                <div class="row">
                	<div class="col-lg-12">
                		<h1 class="page-header">게시글 수정</h1>
                	</div>
<!-- 					/.col-lg-12 -->
                </div>
<!-- 				 /.row -->
				
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
<!-- 							/.panel-heading -->
<!-- 							<div class="panel-body"> -->
<!-- 							<form role="form" action="/TeamProjectt/company/modify" method="post"> -->
								
								
								
				<div class="panel-body mb-3 mt-3">
			   <form id="form1" role="form" action="/TeamProjectt/company/modify" method="post">
				   <input type="hidden" value="${c_board.bno}" name="bno">
				   <input type="hidden" value="${c_board.cno}" name="cno">
			   	<div class="col-sm-3 mt-3 ">
			    	<div class="form-group">
			        	<label for="writer">writer:</label><input type="text" name="writer"class="form-control" value=${c_board.writer} readonly>
			        </div>
			    </div>
			    <div class=" col-sm-6 mb-3 mt-3">
			        <label for="title">title:</label>
			        <input type="text" class="form-control" value="${c_board.title}"  name="title">
			    </div>
			    <div class="mb-3 mt-3">
			        <label for="content">content:</label>
			        <textarea class="form-control" rows="15"  name="content" ><c:out value="${c_board.content }"/></textarea>
			    </div>
			    <div class="button mb-3 ">
		        <button type="submit" data-oper='modify' class="btn btn-sm btn-success">Modify</button>
				<button type="submit" data-oper='remove' class="btn btn-sm btn-danger">Remove</button>
				<button type="submit" data-oper='list' class="btn btn-sm btn-secondary">List</button>
			    </div>
			    
			    
			    </form>
			</div>
			</div>				
		</div>
    </div>
    </div>
</div>
   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>