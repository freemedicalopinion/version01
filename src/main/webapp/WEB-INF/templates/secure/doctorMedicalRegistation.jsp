
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
											<h3 class="box-title">Medical Reg </h3>
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#add-education"><i class="fa fa-pencil"></i>
											Add Med Registration</a>
										<!-- Navigation - folders-->
										<%@ include file="docProfileMenu.html"%>

									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<div class="row pad">
											<ul class="timeline">
												<c:forEach items="${docReg}" var="docReg">
													<!-- timeline time label -->
													<li class="time-label"><span class="bg-red">${docReg.yearOfRegistration}
													</span></li>
													<!-- /.timeline-label -->
													<!-- timeline item -->
													<li><i class="fa fa-envelope bg-blue"></i>
														<div class="timeline-item">

															<h3 class="timeline-header">
																<a href="#">${docReg.registrationNo}</a>
															</h3>
															<div class="timeline-body">
																${docReg.stateMedicalCouncil}
															</div>
															<div class='timeline-footer'>
																<a class="btn btn-primary btn-xs" data-toggle="modal"
																	data-target="#edit-education-${docReg.id}">Edit</a>
																	<a class="btn btn-danger btn-xs"  onclick="document.getElementById('form-${docReg.id}').submit();">Delete
																	</a>
															</div>
															<form action="deleteDoctorReg" method="post" id="form-${docReg.id}">
																	<input type="hidden" value="${docReg.id}" name="id" />
																</form>
														</div></li>
													<!-- END timeline item -->
												</c:forEach>
												<c:if test="${docReg!=null && fn:length(docReg) gt 0 }">
													<li><i class="fa fa-clock-o"></i></li>
												</c:if>
											</ul>
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
	<div class="modal fade" id="add-education" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Add New Medical Registration
					</h4>
				</div>
				<form:form method="post" modelAttribute="education"
					action="addMedicalRegistration">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Registration :</span> <input
									name="registrationNo" type="text" class="form-control"
									placeholder="Registration No">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Registration State :</span> <input
									name="stateMedicalCouncil" type="text" class="form-control"
									placeholder="State Medical Council">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Registration Year :</span> <input
									name="yearOfRegistration" type="text" class="form-control"
									placeholder="Registration Year">
							</div>
						</div>
						
					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Add Medical Registration
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<c:forEach items="${docReg}" var="docEdu">
		<!-- Add Education MODAL -->
		<div class="modal fade" id="edit-education-${docEdu.id}" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">
							<i class="fa fa-envelope-o"></i> Edit Medical Registration
						</h4>
					</div>
					<form:form method="post" modelAttribute="education"
						action="editMedicalRegistration">
				<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Registration :</span> <input
									name="registrationNo" type="text" class="form-control"
									placeholder="Registration No" value="${docEdu.registrationNo }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Registration State :</span> <input
									name="stateMedicalCouncil" type="text" class="form-control"
									placeholder="State Medical Council" value="${docEdu.stateMedicalCouncil }">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Registration Year :</span> <input
									name="yearOfRegistration" type="text" class="form-control"
									placeholder="Registration Year" value="${docEdu.yearOfRegistration }">
							</div>
						</div>
						<input type="hidden" value="${docEdu.id }" name="id">
					</div>
						<div class="modal-footer clearfix">

							<button type="button" class="btn btn-danger" data-dismiss="modal">
								<i class="fa fa-times"></i> Discard
							</button>

							<button type="submit" class="btn btn-primary pull-left">
								<i class="fa fa-envelope"></i> Edit Medical Reg
							</button>
						</div>
					</form:form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</c:forEach>
	<!-- add new calendar event modal -->

	<!-- including footer -->
	<%@ include file="footer.html"%>
</body>
</html>
