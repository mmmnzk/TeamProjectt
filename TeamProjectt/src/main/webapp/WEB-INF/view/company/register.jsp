<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="/TeamProjectt/resources/jquery.min.js"></script>

<%@ include file="../include/mainPage2.jsp"%>
<body class="flex bg-gradient-primary">


<div class="container">
   <div class="card bg-white border-0 shadow-lg my-5" style="display:flex;" align="center">
      <h4>기업평가</h4>
      <h5>${company.c_name}</h5>
   </div>

   <div class="card o-hidden border-0 shadow-lg my-5 mb-3">
       <div class="container mb-3 mt-3">
         <div class="row">
            <h2>Insert</h2>
          </div>
            <div class="panel-body mb-3 mt-3">
            <form role="form" action="/TeamProjectt/company/register" method="post">
            <input type="hidden" value="${company.cno}" name="cno">
               <div class="col-sm-3 mt-3 ">
                <div class="form-group">
                    <label for="writer">writer:</label><input type="text" name="writer"class="form-control" value="홍길동" readonly>
                 </div>
             </div>
             <div class=" col-sm-6 mb-3 mt-3">
                 <label for="title">title:</label>
                 <input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
             </div>
             <div class="mb-3 mt-3">
                 <label for="content">content:</label>
                 <textarea class="form-control" rows="15" id="content" name="content" placeholder="Enter content"></textarea>
             </div>
             <div class="button mb-3 ">
              <button type="submit" class="btn btn-sm btn-success">Submit</button>
            <button type="reset"  class="btn btn-sm btn-secondary">Reset</button>
             </div>
             </form>
         </div>
       </div>
   </div>
</div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>

</html>