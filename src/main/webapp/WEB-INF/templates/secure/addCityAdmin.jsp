
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
					City <small>Control panel</small>
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
											<h3 class="box-title">Manage City</h3>
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#add-education"><i class="fa fa-pencil"></i>
											Add City</a>
										<!-- Navigation - folders-->

									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<div class="row pad"></div>
										<!-- /.col (RIGHT) -->
									</div>
									<!-- /.row -->
								</div>
								<div class="" style="margin-top: 25px;">

									<div class="box">
										<div class="box-header">
											<h3 class="box-title">Data Table With Full Features</h3>
										</div>
										<!-- /.box-header -->
										<div class="box-body table-responsive">
											<table id="example1"
												class="table table-bordered table-striped">
												<thead>
													<tr>
														<th>Id</th>
														<th>City Name</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${allCity}" var="city">
														<tr>
															<td>${city.id}</td>
															<td>${city.city }</td>
															<td><a class="btn btn-app edit" data-toggle="modal"
																data-target="#edit-city-modal" id="${city.id}"
																city="${city.city }"> <i class="fa fa-edit"></i>
																	Edit
															</a> &nbsp;&nbsp;<a class="btn btn-app delete"
																id="${city.id}"> <i class="fa fa-trash-o"></i>
																	Delete
															</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- /.box-body -->
										<!-- /.box -->
									</div>
								</div>
								<!-- /.col (MAIN) -->
							</div>
						</div>
					</div>

				</div>
				<form id="deleteCityForm" action="deleteCity" method="post">
					<input type="hidden" name="id" id="deleteCityId" />
				</form>
				<!-- MAILBOX END -->
			</section>
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->

	<div class="modal fade" id="add-education" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Add City
					</h4>
				</div>
				<form:form method="post" modelAttribute="city" action="addCity">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">City Name:</span> <input
									name="city" type="text" class="form-control"
									placeholder="Ex. Noida">
							</div>
						</div>
					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Add City
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade" id="edit-city-modal" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Edit City
					</h4>
				</div>
				<form:form method="post" modelAttribute="city" action="addCity"
					id="edit-city-form">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">City Name:</span> <input
									name="city" type="text" class="form-control"
									placeholder="Ex. Noida" id="edit-city"> <input
									name="id" type="hidden" class="form-control"
									placeholder="Ex. Noida" id="edit-id">
							</div>
						</div>
					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Edit City
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
	<script type="text/javascript">
		$('#example1').DataTable({
			responsive : true
		});
		$(document.body).on('click', '.delete', function() {
			$('#deleteCityId').val($(this).attr("id"));
			$('#deleteCityForm').submit();
		});

		$(document.body).on('click', '.edit', function() {
			$('#edit-id').val($(this).attr("id"));
			$('#edit-city').val($(this).attr("city"));
		});
	</script>


</body>
</html>
