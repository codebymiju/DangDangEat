<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>DangDangEAT - Login</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

<style type="text/css">
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: "GmarketSansMedium";
}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<!-- 네아로 SDK -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<!-- 카카오 로그인 API -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var cId = getCookie("cId");
	    $("#id").val(cId); 
	     
	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	    if($("#id").val() != "") { 
// 	    	alert("쿠키 아이디 표시됨 : <" + cId + ">");
	    	$("#remember_id").prop("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	    
	    $("#remember_id").on("click", function(){ // 체크박스에 변화가 있다면,
// 	        alert("체크박스 변화");
	    	if($("#remember_id").is(":checked")) { // ID 저장하기 체크했을 때,
	            setCookie("cId", $("#id").val(), 7); // 7일 동안 쿠키 보관
	        } else { // ID 저장하기 체크 해제 시,
	            deleteCookie("cId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#id").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
	        if($("#remember_id").is(":checked")) { // ID 저장하기를 체크한 상태라면,
	            setCookie("cId", $("#id").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	    
    });
	
	// 쿠키 저장하기 
	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	
	// 쿠키 삭제
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
	 
	// 쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) { // 쿠키가 존재하면
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
				end = cookieData.length;
	            console.log("end위치  : " + end);
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}

	// 네이버 로그인 버튼 노출 영역
// 	var naver_id_login = new naver_id_login("ES7O2gXxx_lyk46AnMY5", "http://localhost:8082/dangdangeat/");
// 	var state = naver_id_login.getUniqState();
// 	naver_id_login.setButton("white", 2, 40);
// 	naver_id_login.setDomain("http://localhost:8082/dangdangeat/");
// 	naver_id_login.setState(state);
// 	naver_id_login.setPopup();
// 	naver_id_login.init_naver_id_login();

	// 카카오 로그인 
	window.Kakao.init('8dbab77ba0e3d0dac16b1404a1556ecc');

	function kakaoLogin() {
	    window.Kakao.Auth.login({
	        scope: 'account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
	        success: function(response) {
	            console.log(response) // 로그인 성공하면 받아오는 데이터
	            window.Kakao.API.request({ // 사용자 정보 가져오기 
	                url: '/v2/user/me',
	                success: (res) => {
	                    const kakao_account = res.kakao_account;
	                    console.log(kakao_account)
	                }
	            });
	            window.location.href='/dangdangeat' //리다이렉트 되는 코드
	        },
	        fail: function(error) {
	            console.log(error);
	        }
	    });
	}
	
	window.Kakao.init('8dbab77ba0e3d0dac16b1404a1556ecc');
	   function kakaoLogout() {
	       if (!Kakao.Auth.getAccessToken()) {
	          console.log('Not logged in.');
	          return;
	       }
	       Kakao.Auth.logout(function(response) {
	          alert(response +' logout');
	          window.location.href='/'
	       });
	};

</script>
</head>

<body>
	<!-- Header-->
	<!-- top.jsp -->
	<jsp:include page="../inc/top.jsp"></jsp:include>

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">로그인</h1>
									</div>
									<form class="user" action="MemberLoginPro" method="post">
										<div class="form-group">
											<input type="text" name="member_id" required="required"
												class="form-control form-control-user" id="id"
												aria-describedby="emailHelp" placeholder="Id">
										</div>
										<div class="form-group">
											<input type="password" name="member_pass" required="required"
												class="form-control form-control-user" id="pass"
												placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													name="remember_id" id="remember_id"></input> <label
													class="custom-control-label" for="remember_id">Remember
													Me</label>
											</div>
										</div>
										<input type="submit" value="Login"
											class="btn btn-primary btn-user btn-block">
									</form>
									<hr>
									<!-- 네이버 로그인 버튼 노출 영역 -->
									<div id="naver_id_login"></div>
									<!-- 카카오 로그인 버튼 노출 영역 -->
									<a id="kakao-login-btn" href="javascript:kakaoLogin()">
										<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
									</a>
									<p id="token-result"></p>
									<hr>
									<div class="text-center">
										<a class="small" href="MemberFindIdForm">Forgot Id?</a> | <a
											class="small" href="MemberFindPassForm">Forgot Password?</a>
									</div>
									<div class="text-center">
										<a class="small" href="MemberJoinForm">Create an Account!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy;
				DangDangEat 2023</p>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

</body>

</html>