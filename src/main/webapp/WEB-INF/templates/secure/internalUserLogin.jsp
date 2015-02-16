
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
											<h3 class="box-title">Internal Login</h3>
										</div>

									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<div class="row pad">
											<div class="col-md-6">
												<div class="box box-solid">
													<div class="box-header">
														<i class="fa fa-text-width"></i>
														<h3 class="box-title">Select User</h3>
													</div>
													<!-- /.box-header -->
													<form action="internalUserLogin" method="post">
														<div class="box-body">
															<div class="modal-body">
																<div class="form-group">
																	<div class="input-group">
																		<span class="input-group-addon">UserName :</span> <input
																			id="username" name="username" type="text"
																			class="form-control" placeholder="User Name" />

																	</div>
																</div>
															</div>
														</div>
														<div class="box-footer" style="padding-bottom: 43px;">

															<button type="submit" class="btn btn-primary pull-left">
																<i class="fa fa-envelope"></i> Login
															</button>
														</div>
													</form>

												</div>
												<!-- /.box -->
											</div>
											<!-- ./col -->
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
	<!-- including footer -->
	<%@ include file="footer.html"%>
</body>
</html>
