<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
											<h3 class="box-title">Work Experience</h3>
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#add-education"><i class="fa fa-pencil"></i>
											Add Work Experience</a>
										<!-- Navigation - folders-->
										<%@ include file="docProfileMenu.html"%>
									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<div class="row pad">
											<ul class="timeline">
												<c:forEach items="${docExperience}" var="docEx">
													<!-- timeline time label -->
													<li class="time-label"><span class="bg-red">${docEx.startingYear}-${docEx.endYear}
													</span></li>
													<!-- /.timeline-label -->
													<!-- timeline item -->
													<li><i class="fa fa-envelope bg-blue"></i>
														<div class="timeline-item">

															<h3 class="timeline-header">
																<a href="#">${docEx.hospital}</a>
															</h3>
															<div class="timeline-body">
																${docEx.city}<br>${docEx.country}
															</div>
															<div class='timeline-footer'>
																<a class="btn btn-primary btn-xs" data-toggle="modal"
																	data-target="#edit-experience-${docEx.id}">Edit</a> <a
																	class="btn btn-danger btn-xs"
																	onclick="document.getElementById('form-${docEx.id}').submit();">Delete
																</a>
															</div>
															<form action="deleteWorkExperience" method="post"
																id="form-${docEx.id}">
																<input type="hidden" value="${docEx.id}" name="id" />
															</form>
														</div></li>
													<!-- END timeline item -->
												</c:forEach>
												<c:if
													test="${docExperience!=null && fn:length(docExperience) gt 0 }">
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
						<i class="fa fa-envelope-o"></i> Add New Work Experience
					</h4>
				</div>
				<form:form method="post" modelAttribute="experience"
					action="addWorkExperience">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Hospital :</span> <input
									name="hospital" type="text" class="form-control"
									placeholder="hospital">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Starting Year :</span> <input
									name="startingYear" type="text" class="form-control"
									placeholder="Ex 2000">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">End Year</span> <input
									name="endYear" type="text" class="form-control"
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
							<i class="fa fa-envelope"></i> Add Experience
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<c:forEach items="${docExperience}" var="docex">
		<!-- Add Education MODAL -->
		<div class="modal fade" id="edit-experience-${docex.id}" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">
							<i class="fa fa-envelope-o"></i> Edit Experience
						</h4>
					</div>
					<form:form method="post" modelAttribute="education"
						action="editWorkExperience">
						<div class="modal-body">
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docex.hospital!=null}">
										<span class="input-group-addon">Hospital :</span>
										<input name="hospital" type="text" class="form-control"
											placeholder="Hospital" value="${docex.hospital}">
									</c:if>
									<c:if test="${docex.hospital==null}">
										<span class="input-group-addon">Hospital :</span>
										<input name="hospital" type="text" class="form-control"
											placeholder="Hospital">
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docex.startingYear!=null}">
										<span class="input-group-addon">Starting Year :</span>
										<input name="startingYear" type="text" class="form-control"
											placeholder="Ex 2000" value="${docex.startingYear}">
									</c:if>
									<c:if test="${docex.startingYear==null}">
										<span class="input-group-addon">Starting Year :</span>
										<input name="startingYear" type="text" class="form-control"
											placeholder="Ex 2000">
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docex.endYear!=null}">
										<span class="input-group-addon">End Year:</span>
										<input name="endYear" type="text" class="form-control"
											placeholder="Ex 2004" value=${docex.endYear }>
									</c:if>
									<c:if test="${docex.endYear==null}">
										<span class="input-group-addon">End Year:</span>
										<input name="endYear" type="text" class="form-control"
											placeholder="Ex 2004">
									</c:if>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<c:if test="${docex.city!=null}">
										<span class="input-group-addon">city:</span>
										<input name="city" type="text" class="form-control"
											placeholder="Ex Noida" value="${docex.city }">
									</c:if>
									<c:if test="${docex.city==null}">
										<span class="input-group-addon">city:</span>
										<input name="city" type="text" class="form-control"
											placeholder="Ex Noida">
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docex.country!=null}">
										<span class="input-group-addon">Country:</span>
										<input name="country" type="text" class="form-control"
											placeholder="Ex India" value="${docex.country }">
									</c:if>
									<c:if test="${docex.country==null}">
										<span class="input-group-addon">Country:</span>
										<input name="country" type="text" class="form-control"
											placeholder="Ex India">
									</c:if>
								</div>
							</div>

							<input type="hidden" value="${docex.id}" name="id">
						</div>
						<div class="modal-footer clearfix">

							<button type="button" class="btn btn-danger" data-dismiss="modal">
								<i class="fa fa-times"></i> Discard
							</button>

							<button type="submit" class="btn btn-primary pull-left">
								<i class="fa fa-envelope"></i> Edit Experience
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

