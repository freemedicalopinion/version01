<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
											<h3 class="box-title">Recognitions</h3>
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#add-education"><i class="fa fa-pencil"></i>
											Add Recognition</a>
										<!-- Navigation - folders-->
										<sec:authorize access="hasRole('doctor')">
											<%@ include file="docProfileMenu.html"%>
										</sec:authorize>
										<sec:authorize access="hasRole('hospital')">
											<%@ include file="hospitalProfileMenu.html"%>
										</sec:authorize>
									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-6 col-sm-4">
										<div class="row pad">
											<ul class="timeline">
												<c:forEach items="${docAwards}" var="docEx">
													<!-- timeline time label -->
													<li class="time-label"><span class="bg-red">${docEx.date
															} </span></li>
													<!-- /.timeline-label -->
													<!-- timeline item -->
													<li><i class="fa  fa-star-o bg-blue"></i>
														<div class="timeline-item">

															<h3 class="timeline-header">
																<a href="#">${docEx.awardName}</a>
															</h3>
															<div class="timeline-body">${docEx.details}</div>
															<div class='timeline-footer'>
																<a class="btn btn-primary btn-xs" data-toggle="modal"
																	data-target="#edit-awards-${docEx.id}">Edit</a> <a
																	class="btn btn-danger btn-xs"
																	onclick="document.getElementById('form-${docEx.id}').submit();">Delete
																</a>
															</div>
															<form action="deleteDoctorAward" method="post"
																id="form-${docEx.id}">
																<input type="hidden" value="${docEx.id}" name="id" />
															</form>
														</div></li>
													<!-- END timeline item -->
												</c:forEach>
												<c:if
													test="${docAwards!=null && fn:length(docAwards) gt 0 }">
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
						<i class="fa fa-envelope-o"></i> Add New Award
					</h4>
				</div>
				<form:form method="post" modelAttribute="awards"
					action="addDoctorAwards">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Award Name :</span> <input
									name="awardName" type="text" class="form-control"
									placeholder="Award Name">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Year:</span> <input name="date"
									type="text" class="form-control" placeholder="Ex 2000">
							</div>
						</div>

						<div class="form-group">
							<textarea name="details" id="details" class="form-control"
								placeholder="Detail" style="height: 120px;"></textarea>
						</div>


					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Add Award
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<c:forEach items="${docAwards}" var="docex">
		<!-- Add Education MODAL -->
		<div class="modal fade" id="edit-awards-${docex.id}" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">
							<i class="fa fa-envelope-o"></i> Edit Award
						</h4>
					</div>
					<form:form method="post" modelAttribute="awards"
						action="editDoctorAwards">
						<div class="modal-body">
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docex.awardName!=null}">
										<span class="input-group-addon">Award Name :</span>
										<input name="awardName" type="text" class="form-control"
											placeholder="Award Name" value="${docex.awardName}">
									</c:if>
									<c:if test="${docex.awardName==null}">
										<span class="input-group-addon">Award Name :</span>
										<input name="awardName" type="text" class="form-control"
											placeholder="Award Name">
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<c:if test="${docex.date!=null}">
										<span class="input-group-addon">Year :</span>
										<input name="date" type="text" class="form-control"
											placeholder="Ex 2000" value="${docex.date}">
									</c:if>
									<c:if test="${docex.date==null}">
										<span class="input-group-addon">Year :</span>
										<input name="date" type="text" class="form-control"
											placeholder="Ex 2000">
									</c:if>
								</div>
							</div>
							<c:if test="${docex.details!=null}">
								<div class="form-group">
									<textarea name="details" id="details" class="form-control"
										placeholder="Detail" style="height: 120px;">${docex.details }</textarea>
								</div>
							</c:if>
							<c:if test="${docex.details==null}">
								<div class="form-group">
									<textarea name="details" id="details" class="form-control"
										placeholder="Detail" style="height: 120px;"></textarea>
								</div>
							</c:if>

							<input type="hidden" value="${docex.id}" name="id">
						</div>
						<div class="modal-footer clearfix">

							<button type="button" class="btn btn-danger" data-dismiss="modal">
								<i class="fa fa-times"></i> Discard
							</button>

							<button type="submit" class="btn btn-primary pull-left">
								<i class="fa fa-envelope"></i> Edit Award
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

