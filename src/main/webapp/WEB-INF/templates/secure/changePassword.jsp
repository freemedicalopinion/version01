<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<script type="text/javascript">
	function checkForm(form) {
		$('#newPassword-error').hide();
		$('#password-error').hide();
		if (form.password.value == "") {
			$('#password-error')
					.html(
							'<i class="fa fa-times-circle-o"></i>Error: Existing password cannot be blank!');
			$('#password-error').show();
			form.password.focus();
			return false;
		}

		if (form.newPassword.value != ""
				&& form.newPassword.value == form.repeatNewPassword.value) {
			if (form.newPassword.value.length < 6) {
				$('#newPassword-error')
						.html(
								'<i class="fa fa-times-circle-o"></i> Error: Password must contain at least six characters!');
				$('#newPassword-error').show();
				form.newPassword.focus();
				return false;
			}
			if (form.newPassword.value == form.password.value) {
				$('#newPassword-error')
						.html(
								'<i class="fa fa-times-circle-o"></i> Error: Password must be different from old password!');
				$('#newPassword-error').show();
				form.newPassword.focus();
				return false;
			}
			re = /[0-9]/;
			if (!re.test(form.newPassword.value)) {
				$('#newPassword-error')
						.html(
								'<i class="fa fa-times-circle-o"></i> Error: password must contain at least one number (0-9)!');
				$('#newPassword-error').show();
				form.newPassword.focus();
				return false;
			}
			re = /[a-z]/;
			if (!re.test(form.newPassword.value)) {
				$('#newPassword-error')
						.html(
								'<i class="fa fa-times-circle-o"></i> Error: password must contain at least one lowercase letter (a-z)!');
				$('#newPassword-error').show();
				form.newPassword.focus();
				return false;
			}
			re = /[A-Z]/;
			if (!re.test(form.newPassword.value)) {
				form.newPassword.focus();
				return false;
			}
		} else {
			$('#newPassword-error')
					.html(
							'<i class="fa fa-times-circle-o"></i> Error: Please check that you have entered and confirmed your password!');
			$('#newPassword-error').show();
			form.newPassword.focus();
			return false;
		}

		return true;
	}
</script>
</head>
<body class="skin-blue">
	<!-- including header -->
	<%@ include file="header.html"%>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- including menu -->
		<%@ include file="menu.html"%>
		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Dashboard <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>
			<!-- ./wrapper -->
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-6">

						<div class="alert alert-danger alert-dismissable">
							<i class="fa fa-ban"></i>
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">&times;</button>
							${error}
						</div>
						<div class="alert alert-success alert-dismissable">
							<i class="fa fa-check"></i>
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">&times;</button>
							${success}
						</div>
						<!-- general form elements -->
						<div class="box box-primary">

							<div class="box-header">
								<h3 class="box-title">Quick Example</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form role="form" action="changePassword" method="post"
								onsubmit="return checkForm(this);">
								<div class="box-body">
									<div class="form-group">

										<label for="password">Existing Password</label> <input
											type="password" class="form-control" id="password"
											name="password" placeholder="Existing Password">
										<div class="has-error control-label"
											style="color: red; display: none" id="password-error"></div>
									</div>
									<div class="form-group">
										<label for="newPassword">New Password</label> <input
											type="password" class="form-control" id="newPassword"
											name="newPassword" placeholder="New Password">
										<div class="has-error control-label"
											style="color: red; display: none" id="newPassword-error"></div>
									</div>
									<div class="form-group">
										<label for="repeatNewPassword">Confirm New Password</label> <input
											type="password" class="form-control" id="repeatNewPassword"
											name="repeatNewPassword" placeholder="Confirm New Password">
										<div class="has-error control-label"
											style="color: red; display: none"
											id="repeatNewPassword-error"></div>
									</div>
								</div>
								<!-- /.box-body -->

								<div class="box-footer">
									<button type="submit" class="btn btn-primary">Change
										Password</button>
								</div>
							</form>
						</div>
						<!-- /.box -->
					</div>
				</div>


			</section>
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->

	<!-- add new calendar event modal -->

	<!-- including footer -->
	<%@ include file="footer.html"%>


</body>
</html>