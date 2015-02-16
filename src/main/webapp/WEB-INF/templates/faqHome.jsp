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
			<!-- services -->
			<section class="services">
				<ul>
					<c:forEach items="${categories }" var="category">
						<c:forEach items="${category.subCategory }" var="subCategory">
							<li><a class="pic"><i class="fa fa-leaf"></i></a>
								<h2>
									<a
										href="${pageContext.request.contextPath}/faq/${category.category}/${subCategory.name}">${subCategory.name}</a>
								</h2>
								<p>
									<a
										href="${pageContext.request.contextPath}/faq/${category.category}/${subCategory.name}">${subCategory.description}</a>
								</p> <a
								href="${pageContext.request.contextPath}/faq/${category.category}/${subCategory.name}"
								class="more fa fa-long-arrow-right"></a></li>
						</c:forEach>
					</c:forEach>


				</ul>
			</section>
			<!--/ services -->
		</div>

		</main>
		<!--/ page content -->

		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
</body>
</html>