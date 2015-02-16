<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>Login/Registration</title>
<!-- metas -->
<meta charset="utf-8">
<meta name="author"
	content="http://themeforest.net/user/CreativeWS/portfolio">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<!--/ metas -->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/login.css">


</head>
<body>
	<div class="page">
		<!-- including header -->
		<%@ include file="searchTitle.html"%>
		<!-- Page title -->
		<section class="page-title">
			<div class="grid-row clearfix">
				<h1>Login/Registration</h1>
			</div>
		</section>
		<!--/ Page title -->
		<!-- page content -->
		<main class="page-content">
		<div class="grid-row">
			<div class="form-wrap">
				<div class="tabs">
					<h3 class="signup-tab">
						<a class="active" href="#signup-tab-content">Sign Up</a>
					</h3>
					<h3 class="login-tab">
						<a href="#login-tab-content">Login</a>
					</h3>



				</div>
				<!--.tabs-->

				<div class="tabs-content">
					<div id="signup-tab-content" class="active">
						<div id="tab-9" class="wpb_tab">
							<div class="wpb_text_column wpb_content_element ">
								<div class="grid-col grid-col-4">
									<!-- categories -->
									<section class="widget widget-appointment">

										<form:form method="post" modelAttribute="user"
											action="requestRegistration" class="quick-search-visible">
											<div class="clearfix"></div>
											<hr>
											<div class="accounttype">
												<input type="radio" value="None" id="radioOne"
													name="account" checked /> <label for="radioOne"
													class="radio" chec>Personal</label> <input type="radio"
													value="None" id="radioTwo" name="account" /> <label
													for="radioTwo" class="radio">Company</label>
											</div>
											<hr>
											<select name="roles[0]">
												<option value="doctor">Doctor</option>
												<option value="hospital">Hospital</option>
												<option value="corporate">Corporate</option>
											</select>
											<div class="row">
												<input type="text" name="fname" placeholder="First Name"
													required=""> <i class="fa fa-user"></i>
											</div>
											<div class="row">
												<input type="text" name="lname" placeholder="Last Name"
													required=""> <i class="fa fa-user"></i>
											</div>
											<div class="row">
												<input type="email" name="username"
													placeholder="Email Address" required=""> <i
													class="fa fa-envelope"></i>
											</div>

											<div class="row">
												<input type="text" placeholder="contact" name="contact[0]"
													required=""> <i class="fa fa-asterisk"></i>
											</div>
											<button class="button button-primary"
												style="margin-top: 11px;">Send Request</button>

										</form:form>
									</section>
									<!--/ categories -->
								</div>
							</div>
						</div>
						<!--.login-form-->
						<div class="help-text">
							<p>Don't have account ? Signup Now</p>
							<div class="vc_text_separator"></div>
							<p>Or Sign up with:</p>
							<div class="widget-title">
								<p>
									<a href="#" class="media tw">Twitter</a><a href="#"
										class="media fb">Facebook</a>
								</p>
							</div>
							<div class="clearfix"></div>
						</div>

						<!--.help-text-->
					</div>
					<!--.signup-tab-content-->

					<div id="login-tab-content">
						<div id="tab-7" class="wpb_tab">
							<div class="wpb_text_column wpb_content_element ">
								<div class="grid-col grid-col-4">
									<!-- testimonial -->
									<section class="widget widget-appointment">
										<div class="widget-title">
											<p>
												<a href="#" class="media tw">Twitter</a><a href="#"
													class="media fb">Facebook</a>
											</p>
										</div>
										<br />
										<div class="vc_text_separator clearfix"></div>
										<form name='loginForm'
											action='${pageContext.request.contextPath}/j_spring_security_check'
											method='post'>
											<c:if test="${not empty msg}">
												<div class="row" style="color: green;">${msg}</div>
											</c:if>
											<c:if test="${not empty error}">
												<div class="row" style="color: red;">${error}</div>
											</c:if>
											<div class="row">
												<input type="text" name='username' placeholder="Email"
													required> <i class="fa fa-envelope"></i>
											</div>


											<div class="row">
												<input type="password" name='password'
													placeholder="Password" required> <i
													class="fa fa-asterisk"></i> <input type="hidden"
													name="${_csrf.parameterName}" value="${_csrf.token}" />
											</div>

											<button class="button button-primary"
												style="margin-top: 11px;">Sign In</button>
											<a style="margin-left: 34px;"
												href="${pageContext.request.contextPath}/forgotPassword">Forgot
												your password?</a>
										</form>
									</section>
									<!--/ testimonial -->
								</div>
							</div>
						</div>
						<!--.login-form-->
						<div class="help-text">
							<p>Login for you & others help</p>
						</div>
						<!--.help-text-->
					</div>
					<!--.login-tab-content-->
				</div>
				<!--.tabs-content-->
			</div>
			<!--.form-wrap-->
		</div>
		</main>
		<!--/ page content -->
		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>

	<script>
		$(document).ready(function($) {
			tab = $('.tabs h3 a');

			tab.on('click', function(event) {
				event.preventDefault();
				tab.removeClass('active');
				$(this).addClass('active');

				tab_content = $(this).attr('href');
				$('div[id$="tab-content"]').removeClass('active');
				$(tab_content).addClass('active');
			});
		});
	</script>
</body>
</html>