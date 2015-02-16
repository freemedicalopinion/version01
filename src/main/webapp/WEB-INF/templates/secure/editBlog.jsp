
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<style>
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
					Edit Blog <small></small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li>Blog</li>
					<li class="active">Edit Blog</li>
				</ol>
			</section>
			<!-- ./wrapper -->
			<!-- Main content -->
			<section class="content">
				<!-- MAILBOX BEGIN -->
				<div class="mailbox row">
					<div class="col-xs-12">
						<div class="box box-solid">
							<div class="box-body" style="padding: 0px;">
								<!-- START TYPOGRAPHY -->
								<div class="row">
									<div class="col-md-9">
										<!-- Custom Tabs -->
										<div class="nav-tabs-custom">
											<ul class="nav nav-tabs" id="ul-tabs">
												<li class="active " id="category-tab"><a
													href="#category" data-toggle="tab">Update Category</a></li>
												<li id="title-tab"><a href="#title" data-toggle="tab">Update
														Title</a></li>
												<li id="content-tab"><a href="#content"
													data-toggle="tab">Update Content</a></li>
												<li id="images-tab"><a href="#images" data-toggle="tab">Update
														Images</a></li>
											</ul>
											<div class="tab-content" id="content-tabs">
												<div class="tab-pane active " id="category">
													<form:form method="post" modelAttribute="blogObj"
														id="category-form">
														<input type="hidden" name="id" id="id-blog" class="id"
															value="${blog.id }" />
														<div class="modal-body">
															<div class="form-group">
																<label>Category</label> <select class="form-control"
																	id="blog-category-select" name="category">
																	<!-- All Categories go here -->
																</select>
															</div>
															<div class="form-group">
																<label>Select Sub-Category</label> <select multiple
																	class="form-control" id="blog-sub-category-select"
																	name="subCategories">
																	<!-- All Sub-Categories for selected category go here -->
																</select>
															</div>

														</div>
														<div class="modal-footer clearfix"
															style="margin: 0px; padding: 10px 10px 4px 10px;">

															<button type="button"
																class="btn btn-primary pull-left blog"
																id="submit-category">
																<i class="fa fa-envelope"></i> Update Category
															</button>
														</div>
													</form:form>
												</div>
												<!-- /.tab-pane -->
												<div class="tab-pane " id="title">
													<form:form method="post" modelAttribute="blogObj"
														id="category-form">
														<input type="hidden" name="id" id="id-blog" class="id"
															value="${blog.id }" />
														<div class="modal-body">
															<div class="form-group">
																<div class="input-group">
																	<span class="input-group-addon">Title :</span> <input
																		id="title-text-input" type="text" class="form-control"
																		name="blogTitle" placeholder="Title"
																		value="${blog.blogTitle }">
																</div>
															</div>
															<div class="form-group">
																<div class="input-group">
																	<span class="input-group-addon">Sub-Title :</span> <input
																		id="subTitle-text-input" name="subTitle" type="text"
																		class="form-control" placeholder="Sub-Title"
																		value="${blog.subTitle }">
																</div>
															</div>
															<div class="form-group">
																<textarea name="summary" id="summary-text-input"
																	name="summary" class="form-control"
																	placeholder="Summary" style="height: 120px;" value="">${blog.summary }</textarea>

															</div>
														</div>
														<div class="modal-footer clearfix"
															style="margin: 0px; padding: 10px 10px 4px 10px;">



															<button type="button"
																class="btn btn-primary pull-left blog" id="submit-title">
																<i class="fa fa-envelope"></i> Update Title
															</button>
														</div>
													</form:form>
												</div>
												<!-- /.tab-pane -->
												<div class="tab-pane " id="content">
													<form:form method="post" modelAttribute="blogObj"
														id="category-form">
														<input type="hidden" name="id" id="id-blog" class="id"
															value="${blog.id }" />
														<div class="modal-body">
															<div class="form-group">
																<textarea name="content" id="content-text-input"
																	class="form-control" placeholder="Content"
																	name="content" style="height: 120px;">${blog.content }</textarea>
															</div>

														</div>
														<div class="modal-footer clearfix"
															style="margin: 0px; padding: 10px 10px 4px 10px;">



															<button type="button"
																class="btn btn-primary pull-left blog" id="save-content">
																<i class="fa fa-envelope"></i> Update Content
															</button>
														</div>
													</form:form>
												</div>

												<div class="tab-pane " id="images">
													<form:form method="post" modelAttribute="images"
														id="images-form" enctype="multipart/form-data"
														action="addImagesToBlog">
														<input type="hidden" name="contentId" class="id"
															value="${blog.id }" />
														<input type="hidden" name="ispublish" id="ispublish" />
														<div class="modal-body">
															<div class="form-group"
																style="width: 100%; height: 100%; margin-bottom: 133px;">
																<div style="width: 50%; float: left; margin-top: 53px;">
																	<div class="btn btn-success btn-file">
																		<i class="fa fa-paperclip"></i> Big Image <input
																			type="file" name="bigImage" id="bigImage"
																			onchange="showBigImage(this);">
																	</div>
																</div>
																<div style="float: left; width: 50%;">
																	<c:choose>
																		<c:when test="${blog.isDraftOfPublishedContent == true}">
																		<img
																		src="${pageContext.request.contextPath}/static/images/${blog.refrenceId}/big/${blog.bigImage}"
																		style="width: 150px;" id="bigImagePreview">
																		</c:when>

																		<c:otherwise>
																		<img
																		src="${pageContext.request.contextPath}/static/images/${blog.id}/big/${blog.bigImage}"
																		style="width: 150px;" id="bigImagePreview">
																		</c:otherwise>
																	</c:choose>
																	
																	
																</div>

															</div>
														</div>
														<div class="modal-body">
															<div class="form-group"
																style="width: 100%; height: 100%; margin-bottom: 133px;">
																<div style="width: 50%; float: left; margin-top: 53px;">
																	<div class="btn btn-success btn-file">
																		<i class="fa fa-paperclip"></i> Medium Image <input
																			type="file" name="mediumImage" id="mediumImage"
																			onchange="showMediumImage(this);">
																	</div>
																</div>
																<div style="float: left; width: 50%;">
																<c:choose>
																		<c:when test="${blog.isDraftOfPublishedContent == true}">
																		<img
																		src="${pageContext.request.contextPath}/static/images/${blog.refrenceId}/midium/${blog.mediumImage}"
																		style="width: 150px;" id="mediumImagePreview">
																		</c:when>

																		<c:otherwise>
																		<img
																		src="${pageContext.request.contextPath}/static/images/${blog.id}/midium/${blog.mediumImage}"
																		style="width: 150px;" id="mediumImagePreview">
																		</c:otherwise>
																	</c:choose>
																	
																	
																</div>
															</div>


														</div>
														<div class="modal-body">
															<div class="form-group"
																style="width: 100%; height: 100%; margin-bottom: 133px;">
																<div style="width: 50%; float: left; margin-top: 53px;">
																	<div class="btn btn-success btn-file">
																		<i class="fa fa-paperclip"></i> Thumb Image <input
																			type="file" name="thumbImage" id="thumbImage"
																			onchange="showThumbImage(this);">
																	</div>
																</div>
																<div style="float: left; width: 50%;">
																<c:choose>
																		<c:when test="${blog.isDraftOfPublishedContent == true}">
																		<img
																		src="${pageContext.request.contextPath}/static/images/${blog.refrenceId}/thumb/${blog.thumbImage}"
																		style="width: 150px;" id="thumbImagePreview">
																		</c:when>

																		<c:otherwise>
																		<img
																		src="${pageContext.request.contextPath}/static/images/${blog.id}/thumb/${blog.thumbImage}"
																		style="width: 150px;" id="thumbImagePreview">
																		</c:otherwise>
																	</c:choose>
																	
																	
																</div>
															</div>


														</div>
														<div class="modal-footer clearfix"
															style="margin: 0px; padding: 10px 10px 4px 10px;">

															<button type="button" class="btn btn-danger"
																data-dismiss="modal">
																<i class="fa fa-times"></i> Discard
															</button>

															<button type="button" class="btn btn-primary pull-left"
																id="submit-images" onclick="ispublishContent(0);">
																<i class="fa fa-envelope"></i> Update Picture And Draft
															</button>
															<button type="button" class="btn btn-primary pull-left"
																id="submit-images" onclick="ispublishContent(1);">
																<i class="fa fa-envelope"></i> Update Picture And
																Publish
															</button>

														</div>
													</form:form>
												</div>

												<!-- /.tab-pane -->
											</div>

											<!-- /.tab-content -->
										</div>
										<!-- nav-tabs-custom -->
									</div>
									<div class="col-md-3">
										<div class="box box-primary">
											<div class="box-header">
												<h4 class="box-title">Key Words</h4>
											</div>
											<div class="box-body">
												<!-- the events -->
												<div id='external-events'>
													<c:forEach items="${blog.keyWords}" var="key">
														<div class="external-event"
															style="border-color: rgb(0, 166, 90); color: rgb(255, 255, 255); background-color: rgb(0, 166, 90);">
															${key }&nbsp;&nbsp;&nbsp;
															<button type="button" class="close"
																onclick="deleteKeyWord(this);">×</button>
														</div>
													</c:forEach>

												</div>
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
									<!-- /.col -->
								</div>
								<!-- /.row -->
								<!-- /.box-body -->
								<div class="row">
									<!-- /.col -->
									<div class="col-md-3" id="category-summary"
										style="display: block">
										<div class="box box-primary">
											<div class="box-header">
												<h3 class="box-title">Category</h3>
												<ul class="nav nav-tabs">
													<li class="pull-right"><a href="#" class="text-muted"
														id="category-edit"><i class="fa fa-edit"></i></a></li>
												</ul>
											</div>
											<!-- /.box-header -->
											<div class="box-body">
												<dl>
													<dt>Category</dt>
													<dd id="category-text">${blog.category }</dd>
													<dt>Sub-Category/s</dt>
													<dd id="sub-category-text">${blog.subCategories }</dd>
												</dl>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<div class="col-md-3" id="title-summary" style="display: block">
										<div class="box box-primary">
											<div class="box-header">
												<h3 class="box-title">Header</h3>
												<ul class="nav nav-tabs">
													<li class="pull-right"><a href="#" class="text-muted"
														id="title-edit"><i class="fa fa-edit"></i></a></li>
												</ul>
											</div>
											<!-- /.box-header -->
											<div class="box-body">
												<dl>
													<dt>Title</dt>
													<dd id="title-text">${blog.blogTitle }</dd>
													<dt>Sub-Title</dt>
													<dd id="sub-title-text">${blog.subTitle}</dd>
													<dt>Summary</dt>
													<dd id="summary-text">${blog.summary }</dd>
												</dl>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
									<div class="col-md-6" id="content-summary"
										style="display: block">
										<div class="box box-primary">
											<div class="box-header">
												<h3 class="box-title">Content</h3>
												<ul class="nav nav-tabs">
													<li class="pull-right"><a href="#" class="text-muted"
														id="content-edit"><i class="fa fa-edit"></i></a></li>
												</ul>
											</div>
											<!-- /.box-header -->
											<div class="box-body">
												<dl>
													<dt>Content</dt>
													<dd id="content-text">${blog.content }</dd>
												</dl>
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
									</div>
								</div>
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
	<script>
		var blogId = " ${blog.id}";
		var categories = '${categories}';
		var categoriesJson = eval(categories);
		//all tabs id
		var categoryTab = "category-tab";
		var titleTab = "title-tab";
		var contentTab = "content-tab";
		var imagesTab = "images-tab";
		// all tab-panes id
		var categoryPane = "category";
		var titlePane = "title";
		var contentPane = "content";
		var imagesPane = "images";

		//adding option to category select box
		addCategories();
		var dataarray;
		function addCategories() {
			for (i = 0; i < categoriesJson.length; i++) {
				$('#blog-category-select')
						.append(
								'<option value='+categoriesJson[i].id+' title="'+categoriesJson[i].category+'">'
										+ categoriesJson[i].category
										+ '</option>');
			}
			$('#blog-category-select').val("${blog.category}");
			// adding subCategory for first category
			addSubCategories();

			/* $('#blog-sub-category-select').val(dataarray);
			$("#blog-sub-category-select").multiselect("refresh"); */
		}

		function addSubCategories() {
			$('#blog-sub-category-select').empty();
			var category = $('#blog-category-select').val();
			for (i = 0; i < categoriesJson.length; i++) {
				if (category == categoriesJson[i].id) {
					for (j = 0; j < categoriesJson[i].subCategory.length; j++) {
						$('#blog-sub-category-select')
								.append(
										'<option value='+categoriesJson[i].subCategory[j].id+' title="'+categoriesJson[i].subCategory[j].description+'">'
												+ categoriesJson[i].subCategory[j].name
												+ '</option>');
					}

				}
			}
		}

		$("#blog-category-select").on("change", function() {
			addSubCategories();
		});

		$("#category-edit").on("click", function() {
			makeActiveTab(categoryTab, categoryPane);
		});
		$("#title-edit").on("click", function() {
			makeActiveTab(titleTab, titlePane);
		});
		$("#content-edit").on("click", function() {
			makeActiveTab(contentTab, contentPane);
		});

		$("#submit-title").on("click", function() {

			$('#title-text').html($("#title-text-input").val());
			$('#sub-title-text').html($("#subTitle-text-input").val());
			$('#summary-text').html($("#summary-text-input").val());

			$('#title-summary').show();
			makeActiveTab(contentTab, contentPane);
		});

		$("#save-content").on("click", function() {

			$('#content-text').html($("#content-text-input").val());

			$('#content-summary').show();
			makeActiveTab(imagesTab, imagesPane);
		});

		$("#submit-category").on(
				"click",
				function() {

					$('#category-text').html(
							$("#blog-category-select").find("option:selected")
									.text().trim());

					var subComma = "";
					var tmp = 0;
					$("#blog-sub-category-select option:selected").each(
							function() {
								var $this = $(this);
								if ($this.length && tmp == 0) {
									subComma = $this.text();
								} else if ($this.length) {
									subComma = subComma + " , " + $this.text();
								}
								tmp++;
							});
					$('#sub-category-text').html(subComma);
					$('#category-summary').show();
					makeActiveTab(titleTab, titlePane);
				});

		$(".blog").on("click", function() {
			var form = $(this).parents('form:first');
			var formdata = form.serialize();

			$.ajax({
				url : "addBlog",
				type : "POST",
				data : formdata,
				success : function(mydata) {
					blogId = mydata;
					$(".id").each(function() {
						$(this).val(blogId);

					});

				},
				error : function(error) {

				}
			});
		});

		function makeActiveTab(tab, pane) {

			var allTabs = $('#ul-tabs').children();
			removeClassCustom(allTabs, "active");
			removeClassCustom(allTabs, "show");
			$('#' + tab).addClass("active");
			$('#' + tab).addClass("show");

			var allPane = $('#content-tabs').children();
			removeClassCustom(allPane, "active");
			$('#' + pane).addClass("active");
		}

		function removeClassCustom(element, classToRemove) {

			if (element != undefined) {
				for (i = 0; i < element.length; i++) {
					if (element.hasClass(classToRemove)) {
						element.removeClass(classToRemove);
					}

				}
			}
		}

		function hasClass(element, cls) {
			return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
		}

		function showBigImage(input) {
			var img = document.getElementById('bigImage');
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#bigImagePreview').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
		function showMediumImage(input) {
			var img = document.getElementById('mediumImage');
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#mediumImagePreview').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
		function showThumbImage(input) {
			var img = document.getElementById('thumbImage');
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#thumbImagePreview').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		function ispublishContent(value) {
			$('#ispublish').val(value);
			$("#images-form").submit();
		}

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
							$
									.ajax({
										url : "addKeywordsToBlog",
										type : "POST",
										data : {
											keyWord : val,
											id : blogId
										},
										success : function(mydata) {
											blogId = mydata;
											$(".id").each(function() {
												$(this).val(blogId);
											});
											event
													.html(val
															+ '&nbsp;&nbsp;&nbsp;<button type="button" class="close" onclick="deleteKeyWord(this);">×</button>');
											$('#external-events')
													.prepend(event);

										},
										error : function(error) {

										}
									});

							//Remove event from text input
							$("#new-event").val("");

						});

		function deleteKeyWord(event) {
			var keyword = $(event).closest('div').text().replace('×', '')
					.trim();
			if (keyword == "") {
				return;
			}
			$.ajax({
				url : "removeKeywordFormBlog",
				type : "POST",
				data : {
					keyWord : keyword,
					id : blogId
				},
				success : function(mydata) {

					$(event).closest('div').hide();

				},
				error : function(error) {

				}
			});
		}
	</script>

</body>
</html>
