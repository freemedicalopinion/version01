<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>Login/Registration</title>
<!-- metas -->
<meta charset="utf-8">
<meta name="language" content="en-us" />

<meta name="robots" content="index,follow" />
<meta name="author" content="http://www.freemedicalopinion.com">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<!--/ metas -->
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
			<div class="grid-col grid-col-4">
				<!-- categories -->
				<section class="widget widget-appointment">
					<div class="widget-title">Don't have a Account? Signup Now</div>
					<form:form method="post" commandName="user" action="registerPatient">
						<c:if test="${not empty registrationsuccess}">
							<div class="row" style="color: green;">${registrationsuccess}</div>
						</c:if>
						<c:if test="${not empty registrationerror}">
							<div class="row" style="color: red;">${registrationerror}</div>
						</c:if>
						<div class="row">
							<form:label path="fname"></form:label>
							<input type="text" name='fname' placeholder="First Name" required>
							<i class="fa fa-user"></i>
						</div>
						<div class="row">
							<form:label path="lname"></form:label>
							<input type="text" name='lname' placeholder="Last Name" required>
							<i class="fa fa-user"></i>
						</div>
						<div class="row">
							<form:label path="username"></form:label>
							<input type="email" name="username" placeholder="Email Address"
								required> <i class="fa fa-envelope"></i>
						</div>
						<div class="row">
							<form:label path="password"></form:label>
							<input type="password" name="password" placeholder="Password"
								required> <i class="fa fa-asterisk"></i>
						</div>
						<div class="row">
							<input type="password" placeholder="Retype Password" required>
							<i class="fa fa-asterisk"></i>
						</div>
						<button class="button button-primary" style="margin-top: 11px;">Sign
							up</button>
						<a style="margin-left: 34px;" href="${pageContext.request.contextPath}/resendEmailVerificationPage">Resend Email Verification Code</a>
					</form:form>
				</section>
				<!--/ categories -->
			</div>
			<div class="grid-col grid-col-4">
				<!-- categories -->
				<section class="widget widget-appointment">
					<div class="widget-title">Don't have a Account? Request One</div>
					<form:form method="post" modelAttribute="user" action="requestRegistration">
					
						<select name="roles[0]">
							<option value="doctor">Doctor</option>
							<option value="hospital">Hospital</option>
							<option value="corporate">Corporate</option>
						</select>
						<div class="row">
							<label for="fname"></label> <input type="text" name="fname"
								placeholder="First Name" required=""> <i
								class="fa fa-user"></i>
						</div>
						<div class="row">
							<label for="lname"></label> <input type="text" name="lname"
								placeholder="Last Name" required=""> <i
								class="fa fa-user"></i>
						</div>
						<div class="row">
							<label for="username"></label> <input type="email"
								name="username" placeholder="Email Address" required="">
							<i class="fa fa-envelope"></i>
						</div>
						
						<div class="row">
							<input type="text" placeholder="contact" name="contact[0]"
								required=""> <i class="fa fa-asterisk"></i>
						</div>
						<button class="button button-primary" style="margin-top: 11px;">Send
							Request</button>

					</form:form>
				</section>
				<!--/ categories -->
			</div>
			<div class="grid-col grid-col-4">
				<!-- testimonial -->
				<section class="widget widget-appointment">
					<div class="widget-title">Login</div>
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
							<input type="text" name='username' placeholder="Email" required>
							<i class="fa fa-envelope"></i>
						</div>


						<div class="row">
							<input type="password" name='password' placeholder="Password"
								required> <i class="fa fa-asterisk"></i> <input
								type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</div>

						<button class="button button-primary" style="margin-top: 11px;">Sign
							In</button>
						<a style="margin-left: 34px;" href="${pageContext.request.contextPath}/forgotPassword">Forgot your password?</a>
					</form>
				</section>
				<!--/ testimonial -->
			</div>
		</div>
		</main>
		<!--/ page content -->
		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
</body>
</html>