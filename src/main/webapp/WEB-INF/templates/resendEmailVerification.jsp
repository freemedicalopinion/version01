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
					<div class="widget-title">Forgot Password?</div>
					<form method="post" action="resendEmailVerification">
						<div class="row">
							<input type="email" name="email" id="email"
								placeholder="Email Address" required> <i
								class="fa fa-envelope"></i>
						</div>
						<button class="button button-primary" style="margin-top: 11px;">
							Re Send Email Verification Code</button>
					</form>
				</section>
				<!--/ categories -->
			</div>
		</div>
		</main>
		<!--/ page content -->
		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
</body>
</html>