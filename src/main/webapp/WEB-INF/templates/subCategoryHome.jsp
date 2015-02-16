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
<meta name="language" content="en-us" />
<meta name="revist-after" content="1 days" />
<meta name="robots" content="index,follow" />
<meta name="author" content="http://www.freemedicalopinion.com">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<!--/ metas -->
<style type="text/css">
.limitedTextForBlogContent {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 15; /* number of lines to show */
	-webkit-box-orient: vertical;
}

.limitedTextForBlogByCategory {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3; /* number of lines to show */
	-webkit-box-orient: vertical;
}
</style>
</head>
<body>
	<div class="page">
		<!-- including header -->
		<%@ include file="header.html"%>
		<!-- Page title -->
		<section class="page-title">
			<div class="grid-row clearfix">
				<h1>Blog Home</h1>
			</div>
		</section>
		<!--/ Page title -->
		<!-- page content -->
		<main class="page-content">
		<div class="grid-row">
			<div class="grid-col grid-col-3">

				
				<!--/ sevices -->
				<!-- tags -->
				<section class="widget widget-tags">
					<div class="widget-title">Tags</div>
					<ul>
						<li><a href="#">Cardiac Clinic</a></li>
						<li><a href="#">Dental Clinic</a></li>
						<li><a href="#">General</a></li>
						<li><a href="#">Health</a></li>
						<li><a href="#">News</a></li>
						<li><a href="#">Ophthalmology Clinic</a></li>
						<li><a href="#">Outpatient Surgery</a></li>
						<li><a href="#">Pediatric Clinic</a></li>
						<li><a href="#">Primary Health Care</a></li>
						<li><a href="#">Rehabilitation</a></li>
						<li><a href="#">Uncategorized</a></li>
					</ul>
				</section>
				<!--/ tags -->



			</div>

			<div class="grid-col grid-col-6">
				<!-- philosophy -->
				<section>
					<c:forEach var="blog" items="${latestBlogsPartOne}" end="0">
						<div class="widget-title">${blog.summary}</div>

						<div class="wpb_text_column wpb_content_element">
							<div class="wpb_wrapper">
								<img
									src="${pageContext.request.contextPath}/static/images/${ blog.id}/big/${blog.bigImage}"
									width="260" height="246" alt="" class="alignleft">
								<p class="capitalized limitedTextForBlogContent">${blog.content
									}</p>

							</div>
						</div>
					</c:forEach>
				</section>
				<!--/ philosophy -->

				<!-- list -->
				<article>
					<div class="widget-title">Most Popular Healthcare Blogs</div>

					<div class="wpb_row vc_row-fluid">
						<div class="vc_span6 wpb_column column_container">
							<div class="wpb_wrapper">
								<div class="wpb_text_column wpb_content_element">
									<div class="wpb_wrapper">
										<ul class="ul1">
											<c:forEach items="${latestBlogsPartOne}" var="blog">
												<li><a
													href="${pageContext.request.contextPath}/blog/${blog.category[0].category}/${blog.summary}">${blog.summary}</a>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="vc_span6 wpb_column column_container">
							<div class="wpb_wrapper">
								<div class="wpb_text_column wpb_content_element">
									<div class="wpb_wrapper">
										<ul class="ul1">
											<c:forEach items="${latestBlogsPartTwo}" var="blog">
												<li><a
													href="${pageContext.request.contextPath}/blog/${blog.category[0].category}/${blog.summary}">${blog.summary}</a>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
				<!--/ list -->
			</div>

			<div class="grid-col grid-col-3">
				<!-- site search -->
				<form action="${pageContext.request.contextPath}/search" method="GET" class="widget widget-site-search">
					<input type="text" name="keyWord" id="keyWord" placeholder="Search the blog">
					<button type="submit" class="button">GO</button>
				</form>
				<!--/ site search -->

				<!-- comments -->
				<section class="widget widget-comments">
					<div class="widget-title">Comments</div>
					<div id="comments-carousel" class="owl-carousel">
						<div class="item">
							<ul>
								<c:forEach items="${comment}" end="3" var="comment">
									<li>
										<div class="author">
											<a href="#">${comment.user}</a>
										</div>
										<p>
											<span class="limitedTextForBlogByCategory">${comment.comment}</span>
											<br> <span class="date">${comment.createdDate}</span>
										</p>


									</li>
								</c:forEach>
							</ul>
						</div>

						<div class="item">
							<ul>
								<c:forEach items="${comment}" begin="4" end="8" var="comment">
									<li>
										<div class="author">
											<a href="#">${comment.user}</a>
										</div>
										<p class="limitedTextForBlogByCategory">
											${comment.comment}<br> <span class="date">${comment.createdDate}</span>
										</p>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="item">
							<ul>
								<c:forEach items="${comment}" begin="8" end="12" var="comment">
									<li>
										<div class="author">
											<a href="#">${comment.user}</a>
										</div>
										<p class="limitedTextForBlogByCategory">
											${comment.comment}<br> <span class="date">${comment.createdDate}</span>
										</p>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</section>
				<!--/ comments -->
			</div>
		</div>
		</main>
		<!--/ page content -->

		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
</body>
</html>