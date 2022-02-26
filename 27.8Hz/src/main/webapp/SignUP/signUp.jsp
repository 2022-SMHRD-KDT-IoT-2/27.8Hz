<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Join, Us</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrap d-md-flex">
						<div class="text-wrap p-4 p-lg-5 d-flex img"
							style="background-image: url(images/bg.jpg);">
							<div class="text w-100">
								<h2 class="mb-4">Welcome to signup form</h2>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
						</div>
						<div class="login-wrap p-4 p-md-5">
							<div class="row justify-content-center py-md-5">
								<div class="col-lg-9">
									<div class="social-wrap">
										<h3 class="mb-3 text-center">Thanks for Join us</h3>
										<p class="social-media d-flex justify-content-center">
											<a href="#"
												class="social-icon google d-flex align-items-center justify-content-center"><span
												class="fa fa-google"></span></a> <a href="#"
												class="social-icon facebook d-flex align-items-center justify-content-center"><span
												class="fa fa-facebook"></span></a> <a href="#"
												class="social-icon twitter d-flex align-items-center justify-content-center"><span
												class="fa fa-twitter"></span></a>
										</p>
										<p class="or">
											<span>or</span>
										</p>
									</div>
									<form action="#" class="signup-form">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="id">���̵�</label> <input
														type="text" class="form-control" id="KakaoId">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="name">�̸�</label> <input
														type="text" class="form-control" id="name">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="password">��й�ȣ</label> <input
														type="password" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="address">�ּ�</label> <input
														type="text" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="carnumber">������ȣ</label> <input
														type="text" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="user_num">����ó</label> <input
														type="text" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="pro_num">��ȣ�� ����ó</label> <input
														type="text" class="form-control">
												</div>
											</div>

											<div class="col-md-12 my-4">
												<div class="form-group">
													<div class="w-100">
														<label class="checkbox-wrap checkbox-primary">I
															agree all statements in terms of service <input
															type="checkbox" checked> <span class="checkmark"></span>
														</label>
													</div>
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<button type="submit" class="btn btn-primary submit p-3">Create
														an account</button>
												</div>
											</div>
										</div>

									</form>
									<div class="w-100">
										<p class="mt-4">
											I'm already a member! <a href="#signin">Sign In</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		Kakao.init('4c3aed63b12ab2792059ca71430ad441');
		Kakao.Auth.login({
			success: function(authObj){
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(res){
						console.log(res);
						
						var email = res.kakao_account.email;
						var nick = res.kakao_account.profile.nickname;
						var KakaoId = document.querySelector("#KakaoId");
						var name = document.querySelector("#name");
						KakaoId.value = email;
						name.value = nick;
					}
				})
			}
		});
		
	</script>
</body>
</html>