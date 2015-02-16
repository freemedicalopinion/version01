
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<style type="text/css">
.blog-title {
	max-width: 120px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
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
					Manage Users <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">User</li>
					<li class="active">Manage Users</li>
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
										<!-- compose message btn -->


										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#compose-modal"><i class="fa fa-pencil"></i>
											Create User</a>
										<!-- Navigation - folders-->
										<div style="margin-top: 15px;">
											<ul class="nav nav-pills nav-stacked">
												<li class="header">Folders</li>
												<li class="active"><a href="manageUsers?filter=all"><i
														class="fa fa-inbox"></i> All (${usersSize})</a></li>
												<li><a href="manageUsers?filter=hospitals"><i
														class="fa fa-thumbs-up"></i> Hospitals (${hospitalSize })</a></li>
												<li><a href="manageUsers?filter=doctor"><i
														class="fa fa-thumbs-down"></i> Doctors (${doctorSize })</a></li>
												<li><a href="manageUsers?filter=patient"><i
														class="fa fa-folder"></i> Patients (${patientSize })</a></li>
												<li><a href="manageUsers?filter=admin"><i
														class="fa fa-pencil-square-o"></i> Admin (${adminSize})</a></li>

											</ul>

										</div>
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
										<!-- /.row -->
										<div class="table-responsive">


											<!-- THE MESSAGES -->
											<table class="table table-mailbox" id="blog-table">
												<c:forEach items="${users}" var="user">
													<tr>


														<c:forEach items="${user.roles}" var="role">
															<c:choose>
																<c:when test="${ role == 'hospital'}">
																	<td width="10%;"><a href="#"><p
																				class="text-green">Hospital</p></a></td>
																</c:when>
																<c:when test="${ role == 'doctor'}">
																	<td width="10%;"><a href="#"><p
																				class="text-aqua">Doctor</p></a></td>
																</c:when>
																<c:when test="${ role == 'Admin'}">
																	<td width="10%;"><a href="#"><p
																				class="text-red">Admin</p></a></td>
																</c:when>
																<c:otherwise>
																	<td width="10%;"><a href="#"><p
																				class="text-muted">Patient</p></a></td>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														<td width="30%;">${user.username }</td>
														<td width="20%;">${user.fname }</td>
														<td width="20%;">${user.lname }</td>
														<td width="15%;"><c:if
																test="${ user.accountNonLocked != true}">
																<form action="unlockUser" method="post">
																	<input type="hidden" name="id" value="${user.username}">
																	<a href="javascript:void(0);"
																		onclick="$(this).closest('form').submit();"><span
																		class="badge bg-red">Locked</span></a>
																</form>

															</c:if> <c:if test="${ user.registerationApproved != true}">
																<form action="registrationApprove" method="post">
																	<input type="hidden" name="id" value="${user.username}">
																	<a href="javascript:void(0);"
																		onclick="$(this).closest('form').submit();"><span
																		class="badge bg-red">Approval Pending</span></a>
																</form>

															</c:if> <c:if test="${ user.emailVerified != true}">
																<span class="badge bg-red">Email pending</span>
															</c:if> <c:if test="${ user.accountNonLocked == true}">
																<form action="lockUser" method="post">
																	<input type="hidden" name="id" value="${user.username}">
																	<a href="javascript:void(0);"
																		onclick="$(this).closest('form').submit();"><span
																		class="badge bg-green">Un Locked</span></a>
																</form>

															</c:if></td>
														<td class="time"><fmt:formatDate type="both"
																dateStyle="short" timeStyle="short"
																value="${user.createdDate}" /></td>
													</tr>
												</c:forEach>
											</table>

										</div>
										<!-- /.table-responsive -->
									</div>
									<!-- /.col (RIGHT) -->
								</div>
								<!-- /.row -->
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
	<!-- COMPOSE MESSAGE MODAL -->
	<div class="modal fade" id="compose-modal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Create User
					</h4>
				</div>
				<form:form method="post" modelAttribute="user"  action="addUserByAdmin">
					<div class="modal-body">
						<div class="form-group">
							<label>Role</label> <select class="form-control"
								id="blog-category-select" name="roles">
								<option value="doctor">Doctor</option>
								<option value="hospital">Hospital</option>
								<option value="patient">Patient</option>
								<option value="Admin">Admin</option>
								
							</select>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">UserName</span> <input
									name="username" type="email" class="form-control"
									placeholder="user name">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">First Name</span> <input
									name="fname" type="text" class="form-control"
									placeholder="first name">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Last Name</span> <input
									name="lname" type="text" class="form-control"
									placeholder="last name">
							</div>
						</div>

					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Create User
						</button>
					</div>
				</form:form>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</div>
	<!-- /.modal -->
	<!-- including footer -->
	<%@ include file="footer.html"%>
	<script type="text/javascript">
		
	</script>


</body>
</html>
