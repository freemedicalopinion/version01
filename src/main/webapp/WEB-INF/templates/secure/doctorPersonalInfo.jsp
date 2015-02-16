<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>

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
				<!-- MAILBOX BEGIN -->
				<div class="mailbox row">
					<div class="col-xs-12">
						<div class="box box-solid">
							<div class="box-body">
								<div class="row">
									<div class="col-md-3 col-sm-4">
										<!-- BOXES are complex enough to move the .box-header around.
                                                 This is an example of having the box header within the box body -->
										<div class="box-header">
											<i class="fa fa-inbox"></i>
											<h3 class="box-title">Personal Info</h3>
										</div>
										<div>
											<img
												src="${pageContext.request.contextPath}/static/images/profile/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.profilePicture}"
												style="width: 150px; margin-left: 57px; margin-bottom: 18px; margin-top: 16px;">
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-warning" data-toggle="modal"
											data-target="#change-profile-picture"><i
											class="fa fa-pencil"></i> Change Profile Picture</a>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#change-password"><i class="fa fa-pencil"></i>
											Change Password</a>
										<!-- Navigation - folders-->
									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<div class="row pad">
										<div class="col-md-8">
													<div class="box box-primary">
														<div class="box-header">
															<i class="fa fa-text-width"></i>
															<h3 class="box-title"><a href="#" style="margin-left: 25px;">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.fname}
																${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.lname}</a></h3>
																<ul class="nav nav-tabs">
															<li class="pull-right"><a href="#"
																class="text-muted" data-toggle="modal"
																data-target="#edit-profile"><i class="fa fa-edit"></i></a></li>
														</ul>
														</div>
														<!-- /.box-header -->
														<div class="box-body">
															${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}<br>
															${user.gender }<br>
															${user.city }<br>
															${user.mobile }<br>
															${user.websiteURL }<br>
															${user.social.facebook }<br>
															${user.social.linkdin }<br>
															${user.social.twitter }<br>
															${user.social.google }<br>
														</div>
														<!-- /.box-body -->
														
													</div>
													<!-- /.box -->
												</div>
										</div>
										<!-- /.col (RIGHT) -->
									</div>
									<!-- /.row -->
								</div>
								<!-- /.box-body -->

							</div>
							<!-- /.box -->
						</div>
						<!-- /.col (MAIN) -->
					</div>
				</div>
				<!-- MAILBOX END -->
			</section>
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->

	<!-- Add Education MODAL -->
	<div class="modal fade" id="change-password" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Change Password
					</h4>
				</div>
				<form action="changePassword" method="post">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Existing Password :</span> <input
									name="password" type="password" class="form-control"
									placeholder="Existing Password" ID="password">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">New Password :</span> <input
									name="newPassword" type="password" class="form-control"
									placeholder="New Password" id="newPassword">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Confirm New Password:</span> <input
									name="repeatNewPassword" type="password" class="form-control"
									placeholder="Confirm New Password" id="repeatNewPassword">
							</div>
						</div>

					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Change Password
						</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- add new calendar event modal -->

	<!-- Add Education MODAL -->
	<div class="modal fade" id="change-profile-picture" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Change Profile Picture
					</h4>
				</div>
				<form:form method="post" modelAttribute="imageModel"
					enctype="multipart/form-data" action="manageProfilePicture">
					<div class="modal-body">

						<div class="form-group"
							style="width: 100%; height: 100%; margin-bottom: 133px;">
							<div style="width: 50%; float: left; margin-top: 53px;">
								<div class="btn btn-success btn-file">
									<i class="fa fa-paperclip"></i> Profile Picture <input
										type="file" name="bigImage" id="bigImage"
										onchange="showImage(this);">
								</div>
							</div>
							<div style="float: left; width: 50%;">
								<img
									src="${pageContext.request.contextPath}/static/images/profile/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.profilePicture}"
									style="width: 150px;" id="bigImagePreview">
							</div>
						</div>
					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Change Profile Picuture
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Add Education MODAL -->
	<div class="modal fade" id="edit-profile" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Edit profile
					</h4>
				</div>
				<form:form method="post" modelAttribute="smoDoctor"
					action="addDoctorPersonalInfo">
					<div class="modal-body">
						<div class="form-group">
							<label>Gender</label> <select class="form-control"
								name="gender" id="gender">
								<option>Male</option>
								<option>Female</option>
							</select>
							
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">City:</span> <input name="city"
									type="text" class="form-control"
									placeholder="city" value=" ${user.city }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Mobile:</span> <input name="mobile"
									type="text" class="form-control"
									placeholder="mobile" ID="password" value=" ${user.mobile }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Website:</span> <input name="websiteURL"
									type="text" class="form-control"
									placeholder="mobile" ID="password" value=" ${user.websiteURL }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Facebook:</span> <input name="social.facebook"
									type="text" class="form-control"
									placeholder="mobile" ID="password" value=" ${user.social.facebook }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Linkdin:</span> <input name="social.linkdin"
									type="text" class="form-control"
									placeholder="mobile" ID="password" value=" ${user.social.linkdin }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Twitter:</span> <input name="social.twitter"
									type="text" class="form-control"
									placeholder="mobile" ID="password" value=" ${user.social.twitter }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Google +:</span> <input name="social.google"
									type="text" class="form-control"
									placeholder="mobile" ID="password" value=" ${user.social.google }">
							</div>
						</div>

					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Action
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- add new calendar event modal -->

	<!-- including footer -->
	<%@ include file="footer.html"%>

	<script>
		function showImage(input) {
			var img = document.getElementById('bigImage');
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#bigImagePreview').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
		$('#gender').val("${user.gender}");
		if($('#gender').val()== null){
			$('#gender').val("Male");
		}
	</script>
</body>
</html>
