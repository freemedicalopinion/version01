<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>${smoBlogCategory.category}</title>
<!-- metas -->
<meta charset="utf-8">
<meta name="language" content="en-us" />
<meta name="revist-after" content="1 days" />
<meta name="robots" content="index,follow" />
<meta name="author" content="http://www.freemedicalopinion.com">
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
		<%@ include file="searchTitle.html"%>
		<!-- Page title -->
		<section class="page-title">
			<div class="grid-row clearfix">
				<h1>Articles on ${smoBlogCategory.category}</h1>
			</div>
		</section>
		<!--/ Page title -->
		<!-- Search -->

		<!-- /search -->
		<!-- page content -->
		<main class="page-content">
		<div class="grid-row">
			<div class="grid-col grid-col-9">
				<!-- news -->
				<section id="news" class="widget news news-1">
					<div class="grid">
						<c:forEach items="${listOfBlogsByCategory}" var="blog">
							<div class="item">


								<div class="date">
									${blog.blogTitle } :
									<fmt:formatDate type="date" value="${blog.createdDate}" />
									<a
										href="javascript:fbShare('http://${iAddress.getHostName()}/smo/blogs/${blog.category}/${ blog.id}', '${blog.blogTitle}', '${blog.blogTitle}', '${pageContext.request.contextPath}/static/images/${ blog.id}/big/${blog.bigImage}', 520, 350)"
										class="fa fa-facebook" title="Share with Facebook"></a> <a
										href="javascript:twShare()" class="fa fa-twitter"
										title="Share with Twitter"></a> <a
										href="javascript:pinItShare('http://${iAddress.getHostName()}/smo/blogs/${blog.category}/${ blog.id}','${blog.blogTitle}','${pageContext.request.contextPath}/static/images/${ blog.id}/big/${blog.bigImage}')"
										class="fa fa-pinterest" title="Share with Pinterest"></a> <c:if test="${blogComments.containsKey(blog.id)}">
										<i class="fa fa-comment"><span>${blogComments[blog.id]}
										</span></i>
									</c:if>
									<c:if test="${!blogComments.containsKey(blog.id)}">
										<i class="fa fa-comment"><span>0
										</span></i>
									</c:if>
								</div>

								<a style="color: black;"
									href="${pageContext.request.contextPath}/blogs/${blog.category}/${blog.id}">
									<c:if test="${blog.bigImage!=null}">
										<div class="wrapper">
											<div class="pic">
												<img
													src="${pageContext.request.contextPath}/static/images/${ blog.id}/big/${blog.bigImage}"
													alt="${blog.blogTitle }">

											</div>
										</div>
									</c:if>
									<p>
									<h3 style="font-size: 20px;">${blog.subTitle}</h3>
									</p>
									<div>${blog.summary}</div>
								</a>
								<div style="margin-top: 10px; margin-bottom: 5px;">
									<a
										href="${pageContext.request.contextPath}/blogs/${blog.category}/${blog.id}">Read
										more</a>
								</div>
								<div class="cats">
									Tags :
									<c:forEach items="${blog.keyWords}" var="keyWord">
										<a
											href="${pageContext.request.contextPath}/searchArticle?article=${ keyWord}">${keyWord
											}</a>,
									</c:forEach>
									<a
										href="${pageContext.request.contextPath}/blogs/${blog.category}/${blog.id}"
										class="more fa fa-long-arrow-right"></a>
								</div>
							</div>

						</c:forEach>
					</div>
					<nav class="woocommerce-pagination">
						<ul class="page-numbers">
							<c:forEach varStatus="status" begin="0" end="${count}">
								<c:choose>
									<c:when test="${status.count-1 == page }">
										<li><span class="page-numbers current">${status.count}</span></li>
									</c:when>
									<c:otherwise>
										<li><a class="page-numbers"
											href="${pageContext.request.contextPath}/blogs/${category}?page=${status.count}">${status.count}</a></li>
									</c:otherwise>
								</c:choose>

							</c:forEach>

						</ul>
					</nav>

				</section>
				<!--/ photo tour -->
			</div>
			<div class="grid-col grid-col-3">
				<!-- site search -->
				<form action="#" class="widget widget-site-search">
					<input type="text" placeholder="Search the site">
					<button type="submit" class="button">GO</button>
				</form>
				<!--/ site search -->

				<!-- categories -->
				<section class="widget widget-sevices">
					<div class="widget-title" style="margin-bottom: 20px;">Categories</div>
					<ul>
						<c:forEach items="${allCategories}" var="category">
							<li><i class="fa fa-bookmark"></i><a
								href="${pageContext.request.contextPath}/blogs/${category.id}">${category.category
									}</a></li>
						</c:forEach>
					</ul>
				</section>
				<!--/ categories -->
				<section class="widget widget-comments">
					<div class="widget-title" style="margin-bottom: 15px;">Related
						Blogs.</div>
					<div id="comments-carousel" class="owl-carousel">
					<c:if test="${relatedBlogs1!=null }">
						<div class="item">
							<ul>
								<c:forEach var="relatedPost" items="${relatedBlogs1}">
									<li><c:if test="${not empty  relatedPost.thumbImage}">
											<a
												href="/smo/blogs/${relatedPost.category}/${ relatedPost.id}"><img
												src="${pageContext.request.contextPath}/static/images/${ relatedPost.id}/big/${relatedPost.thumbImage}"
												alt="${relatedPost.blogTitle}"></a>

										</c:if>


										<div class="author">
											<a
												href="/smo/blogs/${relatedPost.category}/${ relatedPost.id}">${relatedPost.blogTitle}</a>
										</div></li>
								</c:forEach>
							</ul>
						</div>
						</c:if>
						<c:if test="${relatedBlogs2!=null }">
						<div class="item">
							<ul>
								<c:forEach var="relatedPost" items="${relatedBlogs2}">
									<li><c:if test="${not empty  relatedPost.thumbImage}">
											<a
												href="/smo/blogs/${relatedPost.category}/${ relatedPost.id}"><img
												src="${pageContext.request.contextPath}/static/images/${ relatedPost.id}/big/${relatedPost.thumbImage}"
												alt="${relatedPost.blogTitle}"></a>

										</c:if>


										<div class="author">
											<a
												href="/smo/blogs/${relatedPost.category}/${ relatedPost.id}">${relatedPost.blogTitle}</a>
										</div></li>
								</c:forEach>
							</ul>
						</div>
						</c:if>
						<c:if test="${relatedBlogs3!=null }">
						<div class="item">
							<ul>
								<c:forEach var="relatedPost" items="${relatedBlogs3}">
									<li><c:if test="${not empty  relatedPost.thumbImage}">
											<a
												href="/smo/blogs/${relatedPost.category}/${ relatedPost.id}"><img
												src="${pageContext.request.contextPath}/static/images/${ relatedPost.id}/big/${relatedPost.thumbImage}"
												alt="${relatedPost.blogTitle}"></a>

										</c:if>


										<div class="author">
											<a
												href="/smo/blogs/${relatedPost.category}/${ relatedPost.id}">${relatedPost.blogTitle}</a>
										</div></li>
								</c:forEach>
							</ul>
						</div>
						</c:if>
					</div>
				</section>




				<!-- tags -->
				<section class="widget widget-tags">
					<div class="widget-title" style="margin-bottom: 20px;">Tags</div>
					<ul>
						<c:forEach items="${allCategories}" var="category">
							<c:forEach items="${category.keyWord}" var="keyWord">
								<li><a
									href="${pageContext.request.contextPath}/searchArticle?article=${ keyWord}">${keyWord
										}</a></li>
							</c:forEach>
						</c:forEach>
					</ul>
				</section>
				<!--/ tags -->


			</div>
		</div>
		</main>
		<!--/ page content -->

		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
</body>
</html>