
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
											<h3 class="box-title">Education Summary</h3>
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#add-education"><i class="fa fa-pencil"></i>
											Add Education</a>
										<!-- Navigation - folders-->
										<%@ include file="docProfileMenu.html"%>

									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<div class="row pad">
											<ul class="timeline">
												<c:forEach items="${docEducation}" var="docEdu">
													<!-- timeline time label -->
													<li class="time-label"><span class="bg-red">${docEdu.yearOfStarting}-${docEdu.yearOfCompletion}
													</span></li>
													<!-- /.timeline-label -->
													<!-- timeline item -->
													<li><i class="fa fa-envelope bg-blue"></i>
														<div class="timeline-item">

															<h3 class="timeline-header">
																<a href="#">${docEdu.degree}</a>
															</h3>
															<div class="timeline-body">
																${docEdu.college}<br>${docEdu.city}<br>${docEdu.country}
															</div>
															<div class='timeline-footer'>
																<a class="btn btn-primary btn-xs" data-toggle="modal"
																	data-target="#edit-education-${docEdu.id}">Edit</a>
																	<a class="btn btn-danger btn-xs"  onclick="document.getElementById('form-${docEdu.id}').submit();">Delete
																	</a>
															</div>
															<form action="deleteDoctorEducation" method="post" id="form-${docEdu.id}">
																	<input type="hidden" value="${docEdu.id}" name="id" />
																</form>
														</div></li>
													<!-- END timeline item -->
												</c:forEach>
												<c:if test="${docEducation!=null && fn:length(docEducation) gt 0 }">
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
						<i class="fa fa-envelope-o"></i> Add New Education
					</h4>
				</div>
				<form:form method="post" modelAttribute="education"
					action="addDoctorEducation">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Degree :</span> <input
									name="degree" type="text" class="form-control"
									placeholder="Degree">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">College :</span> <input
									name="college" type="text" class="form-control"
									placeholder="College">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Year of Starting:</span> <input
									name="yearOfStarting" type="text" class="form-control"
									placeholder="Ex 2004">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Year of Completion:</span> <input
									name="yearOfCompletion" type="text" class="form-control"
									placeholder="Ex 2004">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">city:</span> <input name="city"
									type="text" class="form-control" placeholder="Ex Noida">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Country:</span> <input
									name="country" type="text" class="form-control"
									placeholder="Ex India">
							</div>
						</div>


					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Add Education
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<c:forEach items="${docEducation}" var="docEdu">
		<!-- Add Education MODAL -->
		<div class="modal fade" id="edit-education-${docEdu.id}" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">
							<i class="fa fa-envelope-o"></i> Edit Education
						</h4>
					</div>
					<form:form method="post" modelAttribute="education"
						action="editDoctorEducation">
						<div class="modal-body">
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docEdu.degree!=null}">
										<span class="input-group-addon">Degree :</span>
										<input name="degree" type="text" class="form-control"
											placeholder="Degree" value="${docEdu.degree}">
									</c:if>
									<c:if test="${docEdu.degree==null}">
										<span class="input-group-addon">Degree :</span>
										<input name="degree" type="text" class="form-control"
											placeholder="Degree">
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docEdu.college!=null}">
										<span class="input-group-addon">College :</span>
										<input name="college" type="text" class="form-control"
											placeholder="College" value="${docEdu.college}">
									</c:if>
									<c:if test="${docEdu.college==null}">
										<span class="input-group-addon">College :</span>
										<input name="college" type="text" class="form-control"
											placeholder="College">
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docEdu.yearOfStarting!=null}">
										<span class="input-group-addon">Year of Starting:</span>
										<input name="yearOfStarting" type="text" class="form-control"
											placeholder="Ex 2004" value=${docEdu.yearOfStarting }>
									</c:if>
									<c:if test="${docEdu.yearOfStarting==null}">
										<span class="input-group-addon">Year of Starting:</span>
										<input name="yearOfStarting" type="text" class="form-control"
											placeholder="Ex 2004">
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docEdu.yearOfCompletion!=null}">
										<span class="input-group-addon">Year of Completion:</span>
										<input name="yearOfCompletion" type="text"
											class="form-control" placeholder="Ex 2004"
											value="${ docEdu.yearOfCompletion}">
									</c:if>
									<c:if test="${docEdu.yearOfCompletion==null}">
										<span class="input-group-addon">Year of Completion:</span>
										<input name="yearOfCompletion" type="text"
											class="form-control" placeholder="Ex 2004">
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docEdu.city!=null}">
										<span class="input-group-addon">city:</span>
										<input name="city" type="text" class="form-control"
											placeholder="Ex Noida" value="${docEdu.city }">
									</c:if>
									<c:if test="${docEdu.city==null}">
										<span class="input-group-addon">city:</span>
										<input name="city" type="text" class="form-control"
											placeholder="Ex Noida">
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docEdu.country!=null}">
										<span class="input-group-addon">Country:</span>
										<input name="country" type="text" class="form-control"
											placeholder="Ex India" value="${docEdu.country }">
									</c:if>
									<c:if test="${docEdu.country==null}">
										<span class="input-group-addon">Country:</span>
										<input name="country" type="text" class="form-control"
											placeholder="Ex India">
									</c:if>
								</div>
							</div>

							<input type="hidden" value="${docEdu.id}" name="id">
						</div>
						<div class="modal-footer clearfix">

							<button type="button" class="btn btn-danger" data-dismiss="modal">
								<i class="fa fa-times"></i> Discard
							</button>

							<button type="submit" class="btn btn-primary pull-left">
								<i class="fa fa-envelope"></i> Edit Education
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
