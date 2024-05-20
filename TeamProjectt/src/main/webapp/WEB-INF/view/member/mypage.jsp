<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>

    <%@ include file="../include/topsidebar.jsp"  %>
<!--  nav_bar,side_bar end -->
		<div class="content_main">
       
         <div class="col-lg-8 shadow m-4 bg-body-tertiary" style="width:1200px; height:100px;">
            <div>
            	<p class="text-center mt-3 fs-4">마이 페이지</p>	
            	<p class="text-center fs-6">회원입니까? 회원?</p>
            </div>
          </div>
<!--  	title body       -->
          <div class="col-lg-8 shadow mx-4 bg-body-tertiary p-5" style="width:1200px; display : flex; justify-content: center; flex-direction : column;">
            <div class="mt-1"> 
             <h5>마이페이지</h5>
            </div>
             <hr style="width:100%;">
                 <div> 
                    <form action="updateMember.jsp" method="post">
						<div class="form-group row mb-2">
							<label class="col-sm-3 ">아이디</label>
							<div class="col-sm-3">
								<input value="${member.memberId}" class="form-control" id="memberId" name="memberId" readonly>
							</div>
						</div>
						<div class="form-group row mb-1">
							<label class="col-sm-3">비밀번호</label>
							<div class="col-sm-3">
								<input class="form-control" value="${member.memberPw}" name="memberPw" id="memberPw" type="password">
							</div>
						</div>
						<div class="form-group row mb-2">
							<label class="col-sm-3">성명</label>
							<div class="col-sm-3">
								<input value="${member.memberName}" class="form-control" name="memberName" id="memberName" readonly>
							</div>
						</div>
						<div class="form-group row mb-2">
							<label class="col-sm-3">닉네임</label>
							<div class="col-sm-3">
								<input value="${member.memberNick}" class="form-control" name="memberNick" id="memberNick" readonly>
							</div>
						</div>
						<div class="form-group row mb-2">
							<label class="col-sm-3">이메일</label>
							<div class="col-sm-4">
								<input value="${member.memberMail}" name="memberMail" id="memberMail" readonly>@ 
								<input value="${member.memberMail1}" name="memberMail1" id="memberMail1" readonly>
							</div>
						</div>
						<div class="form-group row mb-4">
							<label class="col-sm-3">우편번호</label>
							<div class="col-sm-5">
								<input name="memberAddr1" id="memberAddr1" value="${member.memberAddr1}" type="text" class="form-control" readonly>
							</div>
						</div>
						<div class="form-group row mb-4">
							<label class="col-sm-3">주소</label>
							<div class="col-sm-5">
								<input name="memberAddr2" id="memberAddr2" value="${member.memberAddr2}" type="text" class="form-control" readonly>
			
							</div>
						</div>
						<div class="form-group row mb-4">
							<label class="col-sm-3">상세주소</label>
							<div class="col-sm-5">
								<input name="memberAddr3" id="memberAddr3" value="${member.memberAddr3}" type="text" class="form-control" readonly>
							</div>
						</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="수정하기 " > 
					<button type="button" class="btn btn-primary " onclick="removeMember();" >탈퇴하기</button>
				</div>
			</div>
		</form>
                    
                 </div>
          </div>

   </div>
   <script>
   function removeMember() {
	   if(window.confirm("탈퇴하시겠습니까?")) {
		   location.href="/member/remove.jsp";
	   }
   }	
   
   </script>
       

    <div class="footer">


    </div>


	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>