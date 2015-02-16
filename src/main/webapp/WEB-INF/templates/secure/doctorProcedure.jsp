
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
											<h3 class="box-title">Manage Procedure</h3>
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#add-education"><i class="fa fa-pencil"></i>
											Add Procedures</a>
										<!-- Navigation - folders-->
										<sec:authorize access="hasRole('doctor')">
											<%@ include file="docProfileMenu.html"%>
										</sec:authorize>
										<sec:authorize access="hasRole('hospital')">
											<%@ include file="hospitalProfileMenu.html"%>
										</sec:authorize>
									</div>

									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<div class="row pad">
											<div class="col-sm-6"></div>
											<div class="col-sm-6 search-form">
												<form action="#" class="text-right">
													<div class="input-group">
														<input type="text" class="form-control input-sm"
															placeholder="Search">
														<div class="input-group-btn">
															<button type="submit" name="q"
																class="btn btn-sm btn-primary">
																<i class="fa fa-search"></i>
															</button>
														</div>
													</div>
												</form>
											</div>
										</div>
										<!-- /.col (RIGHT) -->
										<div class="table-responsive">
											<!-- THE MESSAGES -->
											<table class="table table-mailbox">
												<thead>
													<tr>
														<th>Procedure</th>
														<th>Description</th>
														<th>Action</th>
													</tr>
												</thead>
												<c:forEach items="${docProcedures}" var="spe">
													<tr>
														<td>${spe.procedureName }</td>
														<td>${spe.description }</td>

														<td><a href="javascript:void(0);"
															onclick="document.getElementById('specility-delete-${spe.id }').submit();"><span
																class="label label-danger">Delete</span></a></td>
													</tr>
													<form action="deletePocedures" method="post"
														id="specility-delete-${spe.id }">
														<input type="hidden" value="${spe.id}" name="id" />
													</form>
												</c:forEach>
											</table>
										</div>
										<!-- /.box-body -->
									</div>
									<!-- /.box -->
								</div>

								<!-- /.row -->
							</div>
						</div>
					</div>
				</div>

				<!-- /.box-body -->

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
						<i class="fa fa-envelope-o"></i> Add Procedure
					</h4>
				</div>
				<form method="post" action="addProcedures">
					<div class="modal-body">
						<!-- Select multiple-->
						<div class="form-group">
							<label>Select Multiple</label> <select multiple
								class="form-control" name="proceduresToAdd[]"
								id="specilitiesToAdd">
								<c:forEach items="${allProcedures}" var="spe">
									<option value="${spe.id}">${spe.procedureName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Add Procedures
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

	<!-- including footer -->
	<%@ include file="footer.html"%>
	<script>
		$(document).ready(function() {

		});
	</script>

</body>
</html>
