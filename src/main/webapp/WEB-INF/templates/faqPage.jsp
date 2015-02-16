<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>HeathCare Blog</title>
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
</style>
</head>
<body>
	<div class="page">
		<!-- including header -->
		<%@ include file="searchTitle.html"%>
		<!-- Page title -->
		<section class="page-title">
			<div class="grid-row clearfix">
				<h1>Faq</h1>
			</div>
		</section>
		<!--/ Page title -->
		<!-- page content -->
		<main class="page-content">
		<div class="grid-row">
			<div class="grid-col grid-col-3">
				<!-- categories -->
				<section class="widget widget-sevices">
					<div class="widget-title" style="margin-bottom: 20px;">Categories</div>
					<ul>
						<c:forEach items="${categories }" var="category">
							<c:forEach items="${category.subCategory }" var="subCategory">
								<li><i class="fa fa-bookmark"></i><a
									href="${pageContext.request.contextPath}/faq/${category.category}/${subCategory.name}">${subCategory.name
										}</a></li>
							</c:forEach>
						</c:forEach>

					</ul>
				</section>
				<!--/ categories -->
			</div>
			<div class="grid-col grid-col-9">

				<!-- dividers -->
				<div class="wpb_content_element">
					<c:forEach items="${listOfAllFAQs }" var="faq">
						<p class="capitalized" style="color: black;">${faq.question }</p>
						<br>
						<p class="capitalized">${faq.answer }</p>
						<div class="vc_text_separator vc_text_separator3"></div>
					</c:forEach>

				</div>
				<!--/ dividers -->

			</div>

		</div>
		</main>
		<!--/ page content -->

		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
</body>
</html>