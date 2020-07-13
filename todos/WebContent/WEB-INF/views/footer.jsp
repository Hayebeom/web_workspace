<%@ page language="java" pageEncoding="UTF-8"%>
	<!-- 회원등록 모달창 -->
	<div class="modal" id="modal-register-form">
		<div class="modal-dialog">
			<form method="post" action="register.hta">
	 			<div class="modal-content">
	   				<div class="modal-header">
	     				<h4 class="modal-title">회원가입 입력폼</h4>
	     				<button type="button" class="close" data-dismiss="modal">&times;</button>
	   				</div>
	   				<div class="modal-body">
		   				<div class="row" id="success-msg-row" style="display: none;">
		   					<div class="col-12">
		   						<div class="alert alert-success">
		   							<strong>성공</strong> 회원가입이 완료되었습니다
		   						</div>
		   					</div>
		   				</div>
		   				<div class="row" id="fail-msg-row" style="display: none;">
		   					<div class="col-12">
		   						<div class="alert alert-danger">
		   							<strong>실패</strong> 회원가입이 완료되지 않았습니다
		   						</div>
		   					</div>
		   				</div>
	     				<div class="row">
	     					<div class="col-12">
	     						<div class="card">
	     							<div class="card-body">
	     								<div class="form-group">
	     									<label>이름</label>
	     									<input type="text" class="form-control" name="name" />
	     								</div>
	     								<div class="form-group">
	     									<label>아이디</label>
	     									<input type="text" class="form-control" name="id" />
	     								</div>
	     								<div class="form-group">
	     									<label>비밀번호</label>
	     									<input type="password" class="form-control" name="pwd" />
	     								</div>
	     								<div class="form-group">
	     									<label>이메일</label>
	     									<input type="text" class="form-control" name="email" />
	     								</div>
	     							</div>
	     						</div>
	     					</div>
	     				</div>
	   				</div>
	   				<div class="modal-footer">
	     				<button type="button" class="btn btn-outline-success btn-sm" onclick="registerUser()">회원가입</button>
	     				<button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal">닫기</button>
	   				</div>
	 			</div>
 			</form>
		</div>
	</div>
	<!-- 로그인 모달창 -->
	<div class="modal" id="modal-login-form">
		<div class="modal-dialog">
			<form method="post" action="login.hta">
	 			<div class="modal-content">
	   				<div class="modal-header">
	     				<h4 class="modal-title">로그인 입력폼</h4>
	     				<button type="button" class="close" data-dismiss="modal">&times;</button>
	   				</div>
	   				<div class="modal-body">
	   	<!--
			footer.jsp
			로그인 모달창에 에러메시지를 나타내는 태그를 추가
			<div class="row" id="login-fail-msg-row" style="display:none;"> 에러메시지 표시 </div>
			footer.jsp 로그인 버튼의 타입을 button으로 변경
			로그인 버튼에 click이벤트 발생시 loginUser() 실행
			function loginUser() 정의
		 -->
   						<div class="row" id="login-fail-msg-row" style="display: none;">
		   					<div class="col-12">
		   						<div class="alert alert-danger">
		   							<strong>실패</strong> 로그인이 완료되지 않았습니다
		   						</div>
		   					</div>
	   					</div>

	     				<div class="row">
	     					<div class="col-12">
	     						<div class="card">
	     							<div class="card-body">
	     								<div class="form-group">
	     									<label>아이디</label>
	     									<input type="text" class="form-control" name="userid" />
	     								</div>
	     								<div class="form-group">
	     									<label>비밀번호</label>
	     									<input type="password" class="form-control" name="userpwd" />
	     								</div>
	     							</div>
	     						</div>
	     					</div>
	     				</div>
	   				</div>
	   				<div class="modal-footer">
	     				<button type="button" class="btn btn-outline-success btn-sm" onclick="loginUser()">로그인</button>
	     				<button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal">닫기</button>
	   				</div>
	 			</div>
 			</form>
		</div>
	</div>
	<!-- Footer  -->
	<div class="row">
		<div class="col-12">
			<div class="bg-dark text-white p-3">
				<div>회사 : 중앙HTA학원</div>
				<div>주소 : 서울특별시 종로구 율곡로10길 105 디아망빌딩 4층 401호</div>
				<div>전화 : 070-1234-5678</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function openRegisterformModal(event) {
			event.preventDefault();
			$("#modal-register-form").modal('show');
		}
		
		function registerUser() {
			var userName = document.querySelector("input[name=name]").value;
			var userId = document.querySelector("input[name=id]").value;
			var userPwd = document.querySelector("input[name=pwd]").value;
			var userEmail = document.querySelector("input[name=email]").value;
			
			var data = "name=" + userName + "&id=" + userId + "&pwd=" + userPwd  + "&email=" + userEmail;			

			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var text = xhr.responseText;
					var resData = JSON.parse(text); 
					
					if (resData.result) {
						document.getElementById("success-msg-row").style.display = "block";
						document.getElementById("fail-msg-row").style.display = "none";
					} else {
						document.getElementById("success-msg-row").style.display = "none";
						document.getElementById("fail-msg-row").style.display = "block";
					}
				}
			}
			xhr.open("post", "/register.hta");
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send(data);
		}
		
		function openLoginformModal(event) {
			event.preventDefault();
			$("#modal-login-form").modal('show');
		}

		function loginUser() {
			// 아이디와 비밀번호를 조회
			var userId = document.querySelector("input[name=userid]").value;
			var userPwd = document.querySelector("input[name=userpwd]").value;
			// 서버로 전달할 데이터형태로 만듬
			var data = "userid=" + userId + "&userpwd=" + userPwd;
			
			// AJAX 코딩 절차 수행
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var text = xhr.responseText;
					var resData = JSON.parse(text);

					// 응답절차가 false면 에러메시지 표시
					// 				true면 브라우저의 주소창을 home.jsp로 변경
					if (resData.result) {
						location.href = "home.hta";
					} else {
						document.getElementById("login-fail-msg-row").style.display = "block";
					}
					
				}
			}
			
			xhr.open("post", "/login.hta");
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send(data);
		}
		
	</script>