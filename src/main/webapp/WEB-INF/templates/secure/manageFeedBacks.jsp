<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>Dashboard Manage FeedBacks</title>
<!-- metas -->
<meta charset="utf-8">
<meta name="author"
	content="http://themeforest.net/user/CreativeWS/portfolio">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<!--/ metas -->
<style type="text/css">
.rename {
	
}
</style>
</head>
<body>
	<div class="page">
		<!-- including header -->
		<%@ include file="../header.html"%>
		<!-- Page title -->
		<section class="page-title">
			<div class="grid-row clearfix">
				<h1>Dashboard</h1>
			</div>
		</section>
		<!--/ Page title -->
		<!-- page content -->
		<main class="page-content">
		<div class="grid-row">
			<%@ include file="../menu.html"%>
			<div class="grid-col grid-col-9">
				<button class="wpb_button wpb_btn-mini" id="add-faqs">Add
					FAQs</button>
				<section class="widget widget-appointment">
					<table cellpadding='0' cellspacing='0' border='0' class='display'
						id='allUsers'>
						<thead>
							<tr>
								<th>Question</th>
								<th>Answer</th>
								<th>Category</th>
								<th>Edit FAQ</th>

								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listOfAllFAQs}" var="listOfAllFAQs">
								<tr>
									<td>${listOfAllFAQs.question}</td>
									<td>${listOfAllFAQs.answer}</td>
									<td><c:forEach var="subCategory"
											items="${listOfAllFAQs.category}">
											${subCategory.subCategory}								
										</c:forEach></td>
									<td>
										<button class="wpb_button wpb_btn-mini rename"
											onclick="openEditFAQ('${listOfAllFAQs.id}','${listOfAllFAQs.question}','${listOfAllFAQs.answer}', '${listOfAllFAQs.category}');">
											Edit FAQ</button>
									</td>
									<td><form action="removeFAQ" method="post">
											<input type="hidden" name="id" value="${listOfAllFAQs.id}">
											<button class="wpb_button wpb_btn-mini">Delete</button>
										</form></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</section>

			</div>
		</div>
		</main>
				<!--/ page content -->
		<!-- including footer -->
		<%@ include file="../footer.html"%>
	</div>
	
		
</body>
</html>