<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<style>
</style>
<script>
var time = new Object();
time[10000] = "12:00 AM";
time[10030] = "12:30 AM";
time[10100] = "01:00 AM";
time[10130] = "01:30 AM";
time[10200] = "02:00 AM";
time[10230] = "02:30 AM";
time[10300] = "03:00 AM";
time[10330] = "03:30 AM";
time[10400] = "04:00 AM";
time[10430] = "04:30 AM";
time[10500] = "05:00 AM";
time[10530] = "05:30 AM";
time[10600] = "06:00 AM";
time[10630] = "06:30 AM";
time[10700] = "07:00 AM";
time[10730] = "07:30 AM";
time[10800] = "08:00 AM";
time[10830] = "08:30 AM";
time[10900] = "09:00 AM";
time[10930] = "09:30 AM";
time[11000] = "10:00 AM";
time[11030] = "10:30 AM";
time[11100] = "11:00 AM";
time[11130] = "11:30 AM";
time[20000] = "12:00 PM";
time[20030] = "12:30 PM";
time[20100] = "01:00 PM";
time[20030] = "01:30 PM";
time[20200] = "02:00 PM";
time[20230] = "02:30 PM";
time[20300] = "03:00 PM";
time[20330] = "03:30 PM";
time[20400] = "04:00 PM";
time[20430] = "04:30 PM";
time[20500] = "05:00 PM";
time[20530] = "05:30 PM";
time[20600] = "06:00 PM";
time[20630] = "06:30 PM";
time[20700] = "07:00 PM";
time[20730] = "07:30 PM";
time[20800] = "08:00 PM";
time[20830] = "08:30 PM";
time[20900] = "09:00 PM";
time[20930] = "09:30 PM";
time[21000] = "10:00 PM";
time[21030] = "10:30 PM";
time[21100] = "11:00 PM";
time[21130] = "11:30 PM";

</script>
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
					Practice <small>Control panel</small>
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
											<h3 class="box-title">Practice Summary</h3>
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#add-education"><i class="fa fa-pencil"></i>
											Add Practice</a>
										<!-- Navigation - folders-->

									</div>
								</div>
								<!-- START TYPOGRAPHY -->
								<h2 class="page-header">Hospitals</h2>
								<div class="row">
									<c:forEach items="${doc.hospitals }" var="hospital">
										<c:set var="hospitalId" value="${hospital.hospitalId}" />

										<c:set var="hospitalObj" value="${hospitalMap[hospitalId]}" />
										<div class="col-md-12">
											<div class="box box-solid">
												<div class="box-header">
													<i class="fa fa-text-width"></i>
													<h3 class="box-title">${hospitalObj.name}</h3>
													<ul class="nav nav-tabs">
														<li class="pull-right"><a href="#" class="text-muted"><i
																class="fa fa-trash-o"></i></a></li>
														<li class="pull-right"><a href="#" class="text-muted"
															onclick="update('${hospital.hospitalId}');"><i
																class="fa fa-edit"></i></a></li>
													</ul>
												</div>
												<!-- /.box-header -->
												<div class="box-body">
													<h3 style="margin-top: 0px;">${hospitalObj.contact.city}</h3>
													<p class="">${hospitalObj.contact.address}
														${hospitalObj.contact.city}(${hospitalObj.contact.state})
													</p>
													<div id="view-${hospital.hospitalId}">
														<h4>Availablity</h4>
														<div class="box-body table-responsive no-padding">
															<table class="table table-bordered table-hover">
																<tbody>
																	<tr>
																		<th width="14.27%"><b>Sunday</b></th>
																		<th width="14.27%"><b>Monday</b></th>
																		<th width="14.27%"><b>Tuesday</b></th>
																		<th width="14.27%"><b>Wednesday</b></th>
																		<th width="14.27%"><b>Thursday</b></th>
																		<th width="14.27%"><b>Friday</b></th>
																		<th width="14.27%"><b>Saturday</b></th>
																	</tr>

																	<c:forEach items="${hospital.timings}" var="timeObj">

																		<tr>
																			<td><c:if test="${timeObj.day == 'Sun' }">
																					<script>document.write(time[${timeObj.startingTime }])</script>-<script>document.write(time[${timeObj.endingTime }])</script>
																				</c:if></td>
																			<td><c:if test="${timeObj.day == 'Mon' }">
																					<script>document.write(time[${timeObj.startingTime }])</script>-<script>document.write(time[${timeObj.endingTime }])</script>
																				</c:if></td>
																			<td><c:if test="${timeObj.day == 'Tues' }">
																					<script>document.write(time[${timeObj.startingTime }])</script>-<script>document.write(time[${timeObj.endingTime }])</script>
																				</c:if></td>
																			<td><c:if test="${timeObj.day == 'Wed' }">
																					<script>document.write(time[${timeObj.startingTime }])</script>-<script>document.write(time[${timeObj.endingTime }])</script>
																				</c:if></td>
																			<td><c:if test="${timeObj.day == 'Thus' }">
																					<script>document.write(time[${timeObj.startingTime }])</script>-<script>document.write(time[${timeObj.endingTime }])</script>
																				</c:if></td>
																			<td><c:if test="${timeObj.day == 'Fri' }">
																					<script>document.write(time[${timeObj.startingTime }])</script>-<script>document.write(time[${timeObj.endingTime }])</script>
																				</c:if></td>
																			<td><c:if test="${timeObj.day == 'Sat' }">
																					<script>document.write(time[${timeObj.startingTime }])</script>-<script>document.write(time[${timeObj.endingTime }])</script>
																				</c:if></td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
													<form:form method="post" modelAttribute="appointment"
														action="addPractice">
														<input type="hidden" value="${hospital.hospitalId}"
															name="hospitalId" />
														<div id="update-${hospital.hospitalId}"
															style="display: none;">
															<h4>Update Consultation Timings</h4>

															<div class="box-body table-responsive no-padding">

																<table width="100%"
																	class="table table-bordered table-hover">
																	<tbody>
																		<tr>
																			<th width="20%">Day</th>
																			<th width="40%">Opening Time</th>
																			<th width="40%">Closing Time</th>
																			<th width="20%">Action</th>
																		</tr>


																	</tbody>
																</table>

															</div>


															<div class="box-footer">
																<button type="submit" class="btn btn-primary">
																	<i class="fa fa-check"></i> Save
																</button>
																<button type="button" class="btn btn-danger"
																	onClick="window.location.reload()">
																	<i class="fa fa-times"></i> Discard
																</button>
															</div>
														</div>
													</form:form>
												</div>
											</div>
											<!-- /.box -->
										</div>
										<!-- /.row -->
									</c:forEach>
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
						<i class="fa fa-envelope-o"></i> Add New Practice
					</h4>
				</div>
				<form:form method="post" modelAttribute="appointment"
					action="addPractice">
					<div class="modal-body" style="padding-bottom: 0px;">

						<div class="form-group">
							<div class="input-group">
								<select name="hospitalId" id="hospitalId" class="form-control">
									<c:forEach var="hospital" items="${hospitalMap}">
										<option value="${hospital.key }">${hospital.value.name
											}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="box-body table-responsive no-padding">
							<table id="selectedTiming">

							</table>
						</div>
						<h4>Add Consultation Timings</h4>

						<div class="box-body table-responsive no-padding">

							<table>
								<tr>
									<th>Day</th>
									<th>Starting Time</th>
									<th>Ending Time</th>
									<th></th>
								</tr>
								<tr>
									<td><select class="form-control" id="day-timing">

											<option value="Mon">Mon</option>
											<option value="Tues">Tues</option>
											<option value="Wed">Wed</option>
											<option value="Thus">Thus</option>
											<option value="Fri">Fri</option>
											<option value="Sat">Sat</option>
											<option value="Sun">Sun</option>
									</select></td>
									<td><select id="startingTime"
										onchange="endingTimeFunction();" class="form-control">
									</select></td>
									<td><select id="endingTime" class="form-control">
									</select></td>
									<td><a class="btn btn-block btn-primary"
										onclick="addTiming();">&nbsp; Add&nbsp;&nbsp;</a></td>
								</tr>
							</table>

						</div>

					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Add Practice
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

	<script>
		$(".td").each(function(index) {
			if ($(this).text().replace(/\s/g, "") == "12:0AMto12:0AM") {
				$(this).html('- - -');
			}
		});

		var availableTags = [ {
			key : "1111111",
			value : "NAME 1"
		}, {
			key : "222222",
			value : "NAME 2"
		}, {
			key : "333333",
			value : "NAME 3"
		}, {
			key : "4",
			value : "NAME 4"
		}, {
			key : "5",
			value : "NAME 5"
		} ];

		$("#hospital").autocomplete({
			minLength : 2,
			source : availableTags,
			messages : {
				noResults : '',
				results : function() {
				}
			},
			focus : function(event, ui) {
				$("#hospital").val(ui.item.value);
				$("#hospitalId").val(ui.item.key);
				return false;
			},
			select : function(event, ui) {
				$("#hospital").val(ui.item.value);
				$("#hospitalId").val(ui.item.key);

				return false;
			}
		});

		$(".clone").on(
				'click',
				function() {

					//put jquery this context into a var

					var $btn = $(this);

					//use .closest() to navigate from the buttno to the closest row and clone it
					var $clonedRow = $btn.closest('td').prev().children(
							".clonetable").children(".tbody").children(".tr")
							.clone();
					//finally append new row to end of table
					$btn.closest('td').prev().children(".clonetable").children(
							".tbody").append($clonedRow[0]);
				});

		function update(id) {
			$('#update-' + id).show();
			$('#view-' + id).hide();
		}
		$(document.body).on('click', '.removeTr', function() {

			var $btn = $(this);
			var $clonedRow = $btn.closest('tr');
			var $tbody = $btn.closest('tbody');
			if ($tbody.children().length > 1) {
				$clonedRow.remove();
			}
		});

		
		function getStartingTime() {
			var options = "";
			for (key in time) {
				options += "<option value='"+key+"'>" + time[key] + "</option>";
			}
			$('#startingTime').append(options);
		}

		getStartingTime();

		function endingTimeFunction() {
			var startingTime = $('#startingTime').val();
			$('#endingTime').empty();
			var varother = "";
			var options = "";
			for (key in time) {
				if (key > startingTime) {
					options += "<option value='"+key+"'>" + time[key]
							+ "</option>";
				} else {
					varother += "<option value='"+key+"'>" + time[key]
							+ " Next Day</option>";
				}

			}
			options += varother;
			$('#endingTime').append(options);

		}
		endingTimeFunction();
		var addCount = 0;

		function addTiming() {
			var day = $('#day-timing').val();
			var start = $('#startingTime').val();
			var end = $('#endingTime').val();
			var html = "<tr><td>"
					+ "<input type='hidden' value='"+day+"' name='timings["+addCount+"].day'>"
					+ "<input type='hidden' value='"+start+"' name='timings["+addCount+"].startingTime'>"
					+ "<input type='hidden' value='"+end+"' name='timings["+addCount+"].endingTime'>"
					+ $('#day-timing').find(":selected").text() + "</td>"
					+ "<td>" + $('#startingTime').find(":selected").text()
					+ "</td>" + "<td>"
					+ $('#endingTime').find(":selected").text() + "</td>";
			$('#selectedTiming').append(html);
			addCount++;
		}
	</script>
</body>
</html>

