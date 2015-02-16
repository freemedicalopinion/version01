
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
											<h3 class="box-title">Create Specility</h3>
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#add-education"><i class="fa fa-pencil"></i>
											Create Specility</a>
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
														<th>Specility Name</th>
														<th>Description</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${alllSpecility}" var="spe">
														<tr>
															<td width="15%">${spe.id}</td>
															<td width="25%">${spe.specilityName }</td>
															<td width="40%">${spe.description }</td>
															<td width="20%"><a class="btn btn-app edit"
																data-toggle="modal" data-target="#edit-specility-modal"
																id="${spe.id}" speName="${spe.specilityName}"
																des="${spe.description}"> <i class="fa fa-edit"></i>
																	Edit
															</a> &nbsp;&nbsp;<a class="btn btn-app delete" id="${spe.id}">
																	<i class="fa fa-trash-o"></i> Delete
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

				<!-- MAILBOX END -->
			</section>
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->
	<form id="deleteSpecilityForm" action="deleteSpecility" method="post">
		<input type="hidden" name="id" id="deleteSpecilityId" />
	</form>
	<!-- Add Education MODAL -->
	<div class="modal fade" id="edit-specility-modal" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Edit Specility
					</h4>
				</div>
				<form:form method="post" modelAttribute="specility"
					action="createSpecilityPage" id="edit-specility-form">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Specility Name:</span> <input
									name="specilityName" id="specility-name" type="text" class="form-control"
									placeholder="Ex. Arthroscopy"> <input type="hidden"
									name="id"  id="specility-id"/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Description :</span>
								<textarea id="specility-description" type="text" name="description"
									class="form-control" placeholder="Description" rows="5">
								</textarea>
							</div>
						</div>

					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Edit Specility
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- Add Education MODAL -->
	<div class="modal fade" id="add-education" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Create Specility
					</h4>
				</div>
				<form:form method="post" modelAttribute="specility"
					action="createSpecilityPage">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Specility Name:</span> <input
									name="specilityName" type="text" class="form-control"
									placeholder="Ex. Arthroscopy">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Description :</span>
								<textarea id="description" type="text" name="description"
									class="form-control" placeholder="About Me" rows="5">
								</textarea>
							</div>
						</div>

					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Create Specility
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
			$('#deleteSpecilityId').val($(this).attr("id"));
			$('#deleteSpecilityForm').submit();
		});

		$(document.body).on('click', '.edit', function() {
			$('#specility-id').val($(this).attr("id"));
		$('#specility-name').val($(this).attr("speName"));
		$('#specility-description').val($(this).attr("des"));
			
		});
	</script>


</body>
</html>
