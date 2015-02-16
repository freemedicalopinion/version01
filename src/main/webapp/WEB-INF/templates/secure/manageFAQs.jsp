<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
					Manage FAQs <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Blog</li>
					<li class="active">Blogs Approval</li>
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

										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#add-faq"><i class="fa fa-pencil"></i> Add
											FAQ</a>
										<!-- Navigation - folders-->
										<div style="margin-top: 15px;">
											<ul class="nav nav-pills nav-stacked">

												<li class="header">Folders</li>
												<li class="active"><a href="manageFAQs?filter=all"><i
														class="fa fa-inbox"></i>All</a></li>
												<c:forEach items="${cattegoryAndCouunt}" var="entry">
													<li><a href="manageFAQs?filter=${entry.key}"><i
															class="fa fa-inbox"></i> ${entry.key} (${entry.value})</a></li>
												</c:forEach>
											</ul>
										</div>
									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<c:forEach items="${listOfAllFAQs}" var="faq"
											varStatus="count">

											<div class="box box-primary">
												<div class="box-header">
													<i class="fa fa-question-circle"></i>
													<h3 class="box-title">${faq.categoryName}</h3>
													<ul class="nav nav-tabs">
														<form id="form-faq-delete-${faq.id }" action="removeFAQ"
															method="post">
															<input type="hidden" name="id" value="${faq.id}">
														</form>
														<li class="pull-right"><a href="#"
															class="text-muted delete" faqId="${faq.id}" onclick='document.getElementById("form-faq-delete-${faq.id }").submit();'><i
																class="fa fa-trash-o"></i></a></li>
														<li class="pull-right"><a href="#"
															class="text-muted edit" faqId="${faq.id}"
															data-toggle="modal" data-target="#add-faq"><i
																class="fa fa-edit"></i></a></li>

													</ul>
												</div>
												<!-- /.box-header -->
												<div class="box-body">
													<div id="faq-detail-${faq.id}">
														<dl>
															<dt>Sub-Categories</dt>
															<dd>
																<p class="text-light-blue">${faq.subCategoriesName}</p>
															</dd>
															<dt>Question</dt>
															<dd>
																<p class="text-light-blue">${faq.question }</p>
															</dd>
															<dt>Answer</dt>
															<dd>
																<p class="text-light-blue">${faq.answer}</p>
															</dd>
														</dl>
													</div>

												</div>
												<!-- /.box-body -->
											</div>
											<!-- /.box -->
										</c:forEach>
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
	</div>
	<div class="modal fade" id="add-faq" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Add FAQ
					</h4>
				</div>
				<form:form method="post" modelAttribute="faQs" action="addFAQs">
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
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Question:</span> <input
									name="question" type="text" class="form-control"
									placeholder="question" id="faq-question"><input
									type="hidden" id="faq-id" name="id" />
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">Answer:</span>
								<textarea name="answer" class="form-control"
									placeholder="answer" id="faq-answer"></textarea>
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
				</form:form>
			</div>

			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- ./wrapper -->
	<!-- including footer -->
	<%@ include file="footer.html"%>
	<script type="text/javascript">
		var categories = '${categories}';
		var faq = '${allFaqJson}';
		var categoriesJson = eval(categories);
		var faqJson = eval(faq);

		var arrayFaq = {};
		for ( var i = 0; i < faqJson.length; i++) {
			arrayFaq[faqJson[i].id] = faqJson[i];
		}

		//adding option to category select box
		addCategories();

		function addCategories() {
			alert(categoriesJson.length)
			for (i = 0; i < categoriesJson.length; i++) {
				
				alert(categoriesJson[i].category)
				$('#blog-category-select')
						.append(
								'<option value='+categoriesJson[i].id+' title="'+categoriesJson[i].category+'">'
										+ categoriesJson[i].category
										+ '</option>');
			}
			// adding subCategory for first category
			addSubCategories();
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
		$('.edit').on("click", function() {

			var faq = arrayFaq[$(this).attr('faqId')];
			$('#blog-category-select').val(faq.category);
			$('#blog-sub-category-select').val(faq.subCategories);
			$('#faq-answer').text(faq.answer);
			$('#faq-question').val(faq.question);
			$('#faq-id').val(faq.id);

		});
	</script>


</body>
</html>
