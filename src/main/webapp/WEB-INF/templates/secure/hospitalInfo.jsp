<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
											<h3 class="box-title">Hospital Info</h3>
										</div>
										<div>
											<img
												src="${pageContext.request.contextPath}/static/images/profile/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.profilePicture}"
												style="width: 150px; margin-left: 57px; margin-bottom: 18px; margin-top: 16px;">
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-warning" data-toggle="modal"
											data-target="#change-profile-picture"><i
											class="fa fa-pencil"></i> Change Logo</a>
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
														<h3 class="box-title">
															<a href="#" style="margin-left: 25px;">Address </a>
														</h3>
														<ul class="nav nav-tabs">
															<li class="pull-right"><a href="#"
																class="text-muted" data-toggle="modal"
																data-target="#edit-profile"><i class="fa fa-edit"></i></a></li>
														</ul>
													</div>
													<!-- /.box-header -->
													<div class="box-body">
														<dl>
															<dt>Address</dt>
															<dd>${dbSmoHopital.contact.address }</dd>
															<dt>LandMark</dt>
															<dd>${dbSmoHopital.contact.landmark }</dd>
															<dt>City(State)</dt>
															<dd>${dbSmoHopital.contact.city } (${dbSmoHopital.contact.state })</dd>
															<dt>Country</dt>
															<dd>${dbSmoHopital.contact.country}</dd>
														</dl>

													</div>
													<!-- /.box-body -->

												</div>
												<!-- /.box -->
												<div class="box box-primary">
													<div class="box-header">
														<i class="fa fa-text-width"></i>
														<h3 class="box-title">
															<a href="#" style="margin-left: 25px;">Contact </a>
														</h3>
														<ul class="nav nav-tabs">
															<li class="pull-right"><a href="#"
																class="text-muted" data-toggle="modal"
																data-target="#edit-contact-phone"><i
																	class="fa fa-edit"></i></a></li>
														</ul>
													</div>
													<!-- /.box-header -->
													<div class="box-body">
														<dl>
															<dt>Enquiry Phone No</dt>
															<dd>${dbSmoHopital.phone.enquiryPhoneNo}</dd>
															<dt>Apppointment Phone No</dt>
															<dd>${dbSmoHopital.phone.appointmentPhoneNo}</dd>
															<dt>Emergency Phone No</dt>
															<dd>${dbSmoHopital.phone.emergencyPhoneNo}</dd>
															<dt>Billing Phone No</dt>
															<dd>${dbSmoHopital.phone.billingPhoneNo}</dd>
															<dt>Fax</dt>
															<dd>${dbSmoHopital.phone.faxNumber}</dd>
														</dl>

													</div>
													<!-- /.box-body -->

												</div>
												<!-- /.box -->
												<div class="box box-primary">
													<div class="box-header">
														<i class="fa fa-text-width"></i>
														<h3 class="box-title">
															<a href="#" style="margin-left: 25px;">URLS </a>
														</h3>
														<ul class="nav nav-tabs">
															<li class="pull-right"><a href="#"
																class="text-muted" data-toggle="modal"
																data-target="#edit-urls"><i class="fa fa-edit"></i></a></li>
														</ul>
													</div>
													<!-- /.box-header -->
													<div class="box-body">
														<dl>
															<dt>Website</dt>
															<dd>${dbSmoHopital.websiteUrl}</dd>
															<dt>Facebook</dt>
															<dd>${dbSmoHopital.social.facebook}</dd>
															<dt>Linkdin</dt>
															<dd>${dbSmoHopital.social.linkdin}</dd>
															<dt>Twitter</dt>
															<dd>${dbSmoHopital.social.twitter}</dd>
															<dt>Google +</dt>
															<dd>${dbSmoHopital.social.google}</dd>
														</dl>

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
						<i class="fa fa-envelope-o"></i> Change Logo
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
							<i class="fa fa-envelope"></i> Change Logo
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
						<i class="fa fa-envelope-o"></i> Edit Contact
					</h4>
				</div>
				<form:form method="post" modelAttribute="smoHopital"
					action="addHospitalContactInfo">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Address :</span>
								<textarea name="contact.address" type="text"
									class="form-control" placeholder="Address" rows="2">${dbSmoHopital.contact.address } 
								</textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Landmark:</span> <input
									name="contact.landmark" type="text" class="form-control"
									placeholder="Landmark" id=""
									value="${dbSmoHopital.contact.landmark }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">City:</span> <input
									name="contact.city" type="text" class="form-control"
									placeholder="city" id="" value="${dbSmoHopital.contact.city }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">State:</span> <input
									name="contact.state" type="text" class="form-control"
									placeholder="State" id=""
									value="${dbSmoHopital.contact.state }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Country:</span> <input
									name="contact.country" type="text" class="form-control"
									placeholder="Country" id=""
									value="${dbSmoHopital.contact.country }">
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

	<!-- Add Education MODAL -->
	<div class="modal fade" id="edit-contact-phone" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Edit Contact
					</h4>
				</div>
				<form:form method="post" modelAttribute="smoHopital"
					action="addHospitalPhoneInfo">
					<div class="modal-body">

						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Enquiry Phone No:</span> <input
									name="phone.enquiryPhoneNo[0]" type="text" class="form-control"
									placeholder="Enquiry Phone No" id="">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Appointment Phone No:</span> <input
									name="phone.appointmentPhoneNo[0]" type="text"
									class="form-control" placeholder="Appointment Phone No" id="">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Emergency Phone No:</span> <input
									name="phone.emergencyPhoneNo[0]" type="text"
									class="form-control" placeholder="Emergency Phone No" id="">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Billing Phone No:</span> <input
									name="phone.billingPhoneNo[0]" type="text" class="form-control"
									placeholder="Billing Phone No" id="">
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">FaxNumber:</span> <input
									name="phone.faxNumber[0]" type="text" class="form-control"
									placeholder="FaxNumber" id="">
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
<!-- Add Education MODAL -->
	<div class="modal fade" id="edit-urls" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Edit Contact
					</h4>
				</div>
				<form:form method="post" modelAttribute="smoHopital"
					action="addHospitalURLInfo">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Website:</span> <input
									name="websiteUrl" type="text" class="form-control"
									placeholder="mobile" ID=""
									value="${dbSmoHopital.websiteUrl }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Facebook:</span> <input
									name="social.facebook" type="text" class="form-control"
									placeholder="mobile" ID=""
									value="${dbSmoHopital.social.facebook} ">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Twitter:</span> <input
									name="social.twitter" type="text" class="form-control"
									placeholder="mobile" ID=""
									value="${dbSmoHopital.social.twitter}">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Linkdin:</span> <input
									name="social.linkdin" type="text" class="form-control"
									placeholder="mobile" ID=""
									value=" ${dbSmoHopital.social.linkdin}">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Google +:</span> <input
									name="social.google" type="text" class="form-control"
									placeholder="mobile" ID=""
									value="${dbSmoHopital.social.google}">
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
	<!-- /.modal -->
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
	</script>
</body>
</html>
