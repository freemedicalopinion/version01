
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
											<h3 class="box-title">Manage Category</h3>
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#add-education"><i class="fa fa-pencil"></i>
											Create Category</a>
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
											<h3 class="box-title">Content Category and
												Sub-Categories</h3>
										</div>
										<!-- /.box-header -->
										<div class="box-body table-responsive no-padding">
											<table id="example1" class="table  table-hover">
												<thead>
													<tr>
														<th width="20%">Category Name</th>
														<th width="25%">Description</th>
														<th width="15%">Sub-Category Name</th>
														<th width="20%">Sub-Category Description</th>
														<th width="20%">Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${contentCategories}" var="cat">
														<tr>
															<td>${cat.category }</td>
															<td>${cat.decription }</td>
															<td colspan="2" class="span2">
																<table width="100%" border="0" class="table table-hover">
																	<tbody id="timesunday42504">
																		<c:forEach items="${cat.subCategory}" var="subCat">
																			<tr>
																				<td width="30%">${subCat.name }</td>
																				<td width="70%">${subCat.description }</td>
																			</tr>
																		</c:forEach>

																	</tbody>
																</table>
															</td>
															<td><a class="btn btn-app edit" data-toggle="modal"
																data-target="#edit-category" href="#" id="${cat.id }">
																	<i class="fa fa-edit"></i> Edit
															</a>&nbsp;&nbsp;<a class="btn btn-app addKeyword"
																data-toggle="modal" data-target="#add-keyword" href="#"
																alt="add keyword" categoryId="${cat.id }"
																key="${cat.keyWord}"> <i class="fa fa-edit"></i> add
																	keyword
															</a>&nbsp;&nbsp;<a class="btn btn-app"
																onclick="document.getElementById('form-${cat.id}').submit();">
																	<i class="fa fa-trash-o"></i> Delete
															</a></td>

														</tr>
														<form action="removeContentCategory" method="post"
															id="form-${cat.id}">
															<input type="hidden" value="${cat.id}" name="id" />
														</form>
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

	<!-- Add Education MODAL -->
	<div class="modal fade" id="add-education" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="title">
						<i class="fa fa-envelope-o"></i> Create Category
					</h4>
				</div>
				<form:form method="post" modelAttribute="categoryObj"
					action="addContentCategory">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Category Name:</span> <input
									name="category" type="text" class="form-control"
									placeholder="Ex. Weight Loss">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Description :</span>
								<textarea id="description" type="text" name="decription"
									class="form-control" placeholder="Decription about category"
									rows="2">
								</textarea>
							</div>
						</div>
						<div id="sub-category-page"></div>
						<a class="btn btn-block btn-primary" id="addSubCategory"
							href="javascript:void(0)"><i class="fa fa-pencil"></i> Add
							Sub Category</a>
					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Create Category
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Add Education MODAL -->
	<div class="modal fade" id="add-keyword" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="title">
						<i class="fa fa-envelope-o"></i> Add keyWord to Category
					</h4>
				</div>
				<div class="modal-body">
					<div>
						<div class="box box-primary">
							<div class="box-header">
								<h4 class="box-title">Key Words</h4>
							</div>
							<div class="box-body">
								<!-- the events -->
								<div id='external-events'></div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Add Keywords</h3>
							</div>
							<div class="box-body">

								<div class="input-group">
									<input id="new-event" type="text" class="form-control"
										placeholder="Add KeyWords">
									<div class="input-group-btn">
										<button id="add-new-event" type="button"
											class="btn btn-default btn-flat">Add</button>
									</div>
									<!-- /btn-group -->
								</div>
								<!-- /input-group -->
							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer clearfix">
					<form action="addKeyword" method="post">
						<input type="hidden" name="keyWords" id="keyWords" /> <input
							type="hidden" name="id" id="id" />
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Save
						</button>
					</form>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- Add Education MODAL -->
	<div class="modal fade" id="edit-category" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="title">
						<i class="fa fa-envelope-o"></i> Create Category
					</h4>
				</div>
				<form:form method="post" modelAttribute="categoryObj"
					action="addContentCategory">
					<input type="hidden" id="hidden-edit" name="id">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Category Name:</span> <input
									name="category" id="category" type="text" class="form-control"
									placeholder="Ex. Weight Loss">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Description :</span>
								<textarea id="description" type="text" name="decription"
									id="decription" class="form-control description"
									placeholder="Decription about category" rows="2">
								</textarea>
							</div>
						</div>
						<div id="edit-sub-category-page"></div>
						<a class="btn btn-block btn-primary" id="editaddSubCategory"
							href="javascript:void(0)"><i class="fa fa-pencil"></i> Add
							Sub Category</a>
					</div>
					<div class="modal-footer clearfix">

						<button type="button" class="btn btn-danger" data-dismiss="modal"
							id="discard-edit">
							<i class="fa fa-times"></i> Discard
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> Create Category
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- including footer -->
	<%@ include file="footer.html"%>
	<script type="text/javascript">
		/*  $('#example1').DataTable({
			responsive : true
		}); */

		var countForSubCategoryHtml = 0;
		var editCountForSubCategoryHtml = 0;
		var categoryJsonString = eval('${contentCategoriesJson}');

		$("#discard-edit").click(function() {
			editCountForSubCategoryHtml = 0;
		});

		$("#addSubCategory")
				.click(
						function() {
							var subCategoryHtml = '<div class="form-group">'
									+ '<div class="input-group"><input type="hidden" value="'+countForSubCategoryHtml+'" name="subCategory['+countForSubCategoryHtml+'].id">'
									+ '<span class="input-group-addon">Sub-Category Name:</span> '
									+ '<input name="subCategory['+countForSubCategoryHtml+'].name" type="text" class="form-control" placeholder="Ex. Gastric Bypass">'
									+ '</div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '	<div class="input-group">'
									+ '<span class="input-group-addon">Description :</span>'
									+ '<textarea id="description" type="text" name="subCategory['+countForSubCategoryHtml+'].description" class="form-control" placeholder="About Me" rows="2">'
									+ '	</textarea>' + '	</div>' + '</div>';

							$('#sub-category-page').append(subCategoryHtml);

							countForSubCategoryHtml++;
						});

		$("#editaddSubCategory")
				.click(
						function() {
							var subCategoryHtml = '<div class="form-group">'
									+ '<div class="input-group"><input type="hidden" value="'+editCountForSubCategoryHtml+'" name="subCategory['+editCountForSubCategoryHtml+'].id">'
									+ '<span class="input-group-addon">Sub-Category Name:</span> '
									+ '<input name="subCategory['+editCountForSubCategoryHtml+'].name" type="text" class="form-control" placeholder="Ex. Gastric Bypass">'
									+ '</div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '	<div class="input-group">'
									+ '<span class="input-group-addon">Description :</span>'
									+ '<textarea id="description" type="text" name="subCategory['+editCountForSubCategoryHtml+'].description" class="form-control" placeholder="About Me" rows="2">'
									+ '	</textarea>' + '	</div>' + '</div>';

							$('#edit-sub-category-page')
									.append(subCategoryHtml);

							editCountForSubCategoryHtml++;
						});

		$(".edit")
				.on(
						"click",
						function() {

							var id = $(this).attr("id");
							for (i = 0; i < categoryJsonString.length; i++) {
								if (categoryJsonString[i].id == id) {

									$('#hidden-edit').val(
											categoryJsonString[i].id);
									$('#category').val(
											categoryJsonString[i].category);
									$('.description').text(
											categoryJsonString[i].decription);

									for (j = 0; j < categoryJsonString[i].subCategory.length; j++) {
										var subCategoryHtml = '<div class="form-group">'
												+ '<div class="input-group"><input type="hidden" value="'+editCountForSubCategoryHtml+'" name="subCategory['+editCountForSubCategoryHtml+'].id">'
												+ '<span class="input-group-addon">Sub-Category Name:</span> '
												+ '<input name="subCategory['+editCountForSubCategoryHtml+'].name" type="text" class="form-control" placeholder="Ex. Gastric Bypass" value="'+categoryJsonString[i].subCategory[j].name+'">'
												+ '</div>'
												+ '</div>'
												+ '<div class="form-group">'
												+ '	<div class="input-group">'
												+ '<span class="input-group-addon">Description :</span>'
												+ '<textarea id="description" type="text" name="subCategory['+editCountForSubCategoryHtml+'].description" class="form-control" placeholder="About Me" rows="2">'
												+ categoryJsonString[i].subCategory[j].description
												+ '	</textarea>'
												+ '	</div>'
												+ '</div>';

										$('#edit-sub-category-page').append(
												subCategoryHtml);
										editCountForSubCategoryHtml++;
									}
								}
							}

						});
		/* ADDING EVENTS */
		var currColor = "#00a65a"; //Green by default

		$("#add-new-event")
				.click(
						function(e) {

							e.preventDefault();
							//Get value and make sure it is not null

							var val = $("#new-event").val();

							if (val.length == 0) {
								return;
							}
							//Create event
							var event = $("<div />");
							event.css({
								"background-color" : currColor,
								"border-color" : currColor,
								"color" : "#fff"
							}).addClass("external-event");

							event
									.html(val
											+ '&nbsp;&nbsp;&nbsp;<button type="button" class="close" onclick="deleteKeyWord(this);">×</button>');
							$('#external-events').prepend(event);
							var valuesInform = $(keyWords).val();
							if (valuesInform == "") {
								$(keyWords).val($("#new-event").val());
							} else {
								$(keyWords).val(
										valuesInform + "@@@"
												+ $("#new-event").val());
							}

							//Remove event from text input
							$("#new-event").val("");

						});

		function deleteKeyWord(event) {
			var keyword = $(event).closest('div').text().replace('×', '')
					.trim();
			if (keyword == "") {
				return;
			}
			$(event).closest('div').hide();
		}
		$('.addKeyword')
				.on(
						"click",
						function() {
							$("#id").val($(this).attr('categoryId'));
							var categoryIid = $(this).attr('categoryId');
							for (i = 0; i < categoryJsonString.length; i++) {
								if (categoryJsonString[i].id == categoryIid
										&& categoryJsonString[i].keyWord != undefined) {
									for (j = 0; j < categoryJsonString[i].keyWord.length; j++) {
										//Create event
										var event = $("<div />");
										event.css({
											"background-color" : currColor,
											"border-color" : currColor,
											"color" : "#fff"
										}).addClass("external-event");
										
										
										event
												.html(categoryJsonString[i].keyWord[j]
														+ '&nbsp;&nbsp;&nbsp;<button type="button" class="close" onclick="deleteKeyWord(this);">×</button>');
										$('#external-events').prepend(event);
										var valuesInform = $(keyWords).val();
										if (valuesInform == "") {
											$(keyWords).val(categoryJsonString[i].keyWord[j]);
										} else {
											$(keyWords).val(
													valuesInform + "@@@"
															+ categoryJsonString[i].keyWord[j]);
										}
									}

								}
							}

						});
	</script>


</body>
</html>
