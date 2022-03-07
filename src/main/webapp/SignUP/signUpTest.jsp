<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<!-- ���̹� �α��� -->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
	
	
	
<!doctype html>
<html lang="en">
  <head>
  	<title>Join us</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">

	</head>
	<body>
	<section class="ftco-section">
		<div class="container">
			
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrap d-md-flex">
						<div class="text-wrap p-4 p-lg-5 d-flex img" style="background-image: url(images/bg2.jpg);">
							<div class="text w-100">
								<h2 class="mb-4">Welcome to 27.8Hz</h2>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
							</div>
			      </div>
						<div class="login-wrap p-4 p-md-5">
			      	<div class="row justify-content-center py-md-5">
			      		<div class="col-lg-9">
			      			<div class="social-wrap">
				      			<h3 class="mb-3 text-center">Thanks for Join us</h3>
				      			<p class="social-media d-flex justify-content-center">
											<a href="#" class="nvicon"><span ><img src="images/naver.png"></span></a>
											<a href="#" class="kkicon"><span ><img src="images/kakao.png"></span></a>
										</p>
										<p class="or">
				          		<span>or</span>
				          	</p>
			          	</div>
									<form action="#" class="signup-form">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="id">�̸���</label>
													<input type="text" class="form-control" name="id" id="input_id" >
													<font id="checkId" size="2"></font>
							      				</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="name">�̸�</label>
													<input type="text" class="form-control">
							      				</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="password">��й�ȣ</label>
													<input type="password" class="form-control">
												</div>
											</div>
									
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="address">�ּ�</label>
													<input type="text" class="form-control">
							      				</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="carnumber">������ȣ</label>
													<input type="text" class="form-control">
												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="user_num">����ó</label>
													<input type="text" class="form-control" id="user_num">
													<font id="checkTel" size="2"></font>
												</div>
											</div>
											
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="pro_num">��ȣ�� ����ó</label>
													<input type="text" class="form-control">
												</div>
											</div>

											<div class="col-md-12 my-4">
												<div class="form-group">
						            				<div class="w-100">
							            				<label class="checkbox-wrap checkbox-primary">I agree all statements in terms of service
														  <input type="checkbox" checked>
														  <span class="checkmark"></span>
														</label>
													</div>
						            			</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
												<button type="submit" class="btn btn-primary submit p-3">Create an account</button>
												</div>
											</div>
										</div>

				          </form>
				          <div class="w-100">
										<p class="mt-4">I'm already a member! <a href="#signin">Sign In</a></p>
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
  
  <script> //��ư���� �ǽð� ���̵� �ߺ�üũ
  	$('#input_id').focusout(function(){
  		let userId = $('#input_id').val();
  		
  		$.ajax({
  				url : '../SignUpCheckCon',
  				type : 'post',
  				data : {userId : userId},
  				dataType : 'json',
  				
  				success : function(result){
  					if(result == 0 ){
  						$('#checkId').html('����� �� ���� �̸��� �Դϴ�.');
  						$("#checkId").attr('color', 'red');
  					} else if(result==1){
  						$('#checkId').html('����� �� �ִ� �̸��� �Դϴ�.');
  						$("#checkId").attr('color', 'green');
  					} else if(result==2){
  						$('#checkId').html('�̸����� �Է� �� �ּ���');
  						$("#checkId").attr('color', 'red');
  					}
  				},
  				error : function(){
  					alert("������û����");
  				}
  		})
  	})
  	
  	
  	// ����ó Ȯ��
  	$('#user_num').focusout(function(){
  		let userNum = $('#user_num').val();
  		
  		$.ajax({
  				url : '../UnumCheckCon',
  				type : 'post',
  				data : {userNum : userNum},
  				dataType : 'json',
  				
  				success : function(result){
  					if(result == 0 ){
  						$('#checkTel').html('�̹� ���Ե� ��ȭ��ȣ �Դϴ�.');
  						$("#checkTel").attr('color', 'red');
  					} else if(result==1){
  						$('#checkTel').html('��ȭ��ȣ�� �Է� �� �ּ���');
  						$("#checkTel").attr('color', 'red');
  					} else if(result==2){
  						$('#checkTel').html('��밡���� ��ȭ��ȣ �Դϴ�.');
  						$("#checkTel").attr('color', 'green');
  					} 
  				},
  				error : function(){
  					alert("������û����");
  				}
  		})
  	})
  </script>
	</body>
</html>

