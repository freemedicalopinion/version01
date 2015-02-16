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
				<!-- title row -->
				<!-- info row -->
				<div class="row mailbox">
					<div class="col-xs-12">
						<div class="box box-solid">
							<div class="box-body">
								<div class="row">
									<div class="col-md-3 col-sm-4">
										<sec:authorize access="hasRole('doctor')">
											<%@ include file="docProfileMenu.html"%>
										</sec:authorize>
										<sec:authorize access="hasRole('hospital')">
											<%@ include file="hospitalProfileMenu.html"%>
										</sec:authorize>
									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<div class="row pad"></div>
										<!-- /.row -->
										<div class="table-responsive">
											<c:if test="${aboutMe==null}">
												<a class="btn btn-block btn-primary" data-toggle="modal"
													data-target="#add-education"><i class="fa fa-pencil"></i>
													Add About Me</a>
											</c:if>

											<!-- The time line -->
											<c:if test="${aboutMe!=null}">

												<div class="col-md-8">
													<div class="box box-primary">
														<div class="box-header">
															<i class="fa fa-text-width"></i>
															<h3 class="box-title">About</h3>
															<ul class="nav nav-tabs">
																<li class="pull-right"><a href="#"
																	class="text-muted" data-toggle="modal"
																	data-target="#add-education"><i class="fa fa-edit"></i></a></li>
															</ul>
														</div>
														<!-- /.box-header -->
														<div class="box-body">
															<p class="lead">${aboutMe}</p>
														</div>

													</div>
													<!-- /.box -->
												</div>

												<!-- ./col -->
											</c:if>
										</div>
									</div>
								</div>

								<!-- /.col -->
							</div>
						</div>
					</div>
				</div>
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
						<i class="fa fa-envelope-o"></i> About Me
					</h4>
				</div>
				<form action="addAboutme" method="post">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">About Me :</span>
								<textarea name="aboutme" id="aboutme" type="text"
									class="form-control" placeholder="About Me" rows="10">
									<c:if test="${aboutMe!=null}">
									${aboutMe}
									</c:if>
								</textarea>
							</div>
						</div>


					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Add
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- /.modal-content -->
	<!-- add new calendar event modal -->

	<!-- including footer -->
	<%@ include file="footer.html"%>


</body>
</html>
