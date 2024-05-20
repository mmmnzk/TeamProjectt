<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="cl_user_info">
<!--             로그인 하지 않은 상태 -->
				<c:if test = "${member == null }">
				 <span class="fs-4">Login</span>
		         <hr>
		         	<div class="d-flex justify-content-center flex-column">
<!-- 				        <p>ID : <input type="text" name="ID" size="15" required></p> -->
<!-- 				        <p>PW : <input type="password" name="psw" size="15" placeholder="비밀번호" required></p> -->
						<form id="login_form" method="post">
							<div class="login_wrap">
								<div class="id_wrap">
									<div class="id_input_box">
										<input class="id_input" name="memberId">
									</div>
								</div>
								<div class="pw_wrap">
									<div class="pw_input_box">
										<input class="pw_iput" name="memberPw">
									</div>
								</div>
								<c:if test = "${result == 0 }">
									<div class = "login_warn">사용자의 ID 또는 비밀번호가 잘못 입력되었습니다.</div>
								</c:if>
								<div class="login_button_wrap">
									<input type="button" class="login_button btn btn-success btn-sm" value="Log in">
						       		<button type="button" class="btn btn-info btn-sm fs-6" style="height:30px;">
						       			<a href="../member/join" class="text-decoration-none text-light">Sign up</a>
						       		</button>
								</div>
							</div>
						</form>
			        </div>
			        <hr>
		        </c:if>
		        <!-- 로그인 한 상태 -->
		        <c:if test="${ member != null }">
		        <span class="fs-4">member</span>
		         <hr>
		        	<div class = "login_success_area">
		        		<span>닉네임 : ${member.memberNick}</span>
		        		<span>모의전 금액 : <fmt:formatNumber value="${member.money}" pattern="\#,###,###"/></span>
		        	</div>
			   		<hr>
			   		<div class="btn btn-danger btn-sm"><a href="/member/logout.do">로그아웃</a></div>
		        </c:if>
            </div>

</body>
</html>