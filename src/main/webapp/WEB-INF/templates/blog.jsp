<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>${blog.blogTitle}</title>
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
		<%@ include file="searchTitle.html"%>
		<!-- Page title -->
		<section class="page-title">
			<div class="grid-row clearfix">
				<h1>${blog.blogTitle}</h1>
			</div>
		</section>
		<!--/ Page title -->
		<!-- page content -->
		<main class="page-content">
		<div class="grid-row">
			<div class="grid-col grid-col-9">

				<!-- blog post -->
				<article class="widget blog-post">

					<nav class="bread-crumbs">
						<a href="/smo">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;
						<a href="/smo/blogs/${blog.category}">${smoCategoriesMap[blog.category]}</a>&nbsp;&nbsp;
					</nav>



					<div class="date">
						<div class="share">
							<a
								href="javascript:fbShare('http://${iAddress.getHostName()}/smo/blogs/${blog.category}/${ blog.id}', '${blog.blogTitle}', '${blog.blogTitle}', '${pageContext.request.contextPath}/static/images/${ blog.id}/big/${blog.bigImage}', 520, 350)"
								class="fa fa-facebook" title="Share with Facebook"></a> <a
								href="javascript:twShare()" class="fa fa-twitter"
								title="Share with Twitter"></a> <a
								href="javascript:pinItShare('http://${iAddress.getHostName()}/smo/blogs/${blog.category}/${ blog.id}','${blog.blogTitle}','${pageContext.request.contextPath}/static/images/${ blog.id}/big/${blog.bigImage}')"
								class="fa fa-pinterest" title="Share with Pinterest"></a> <a
								href="#" class="fa fa-thumbs-o-up" title="Like this Blog"></a>
						</div>
						<fmt:formatDate type="date" value="${blog.createdDate}" />
						<i class="fa fa-comment"><span>${fn:length(blogComments)}</span></i>
					</div>
					<c:if test="${not empty blog.bigImage}">
						<div class="pic">

							<img
								src="${pageContext.request.contextPath}/static/images/${ blog.id}/big/${blog.bigImage}"
								alt="${blog.blogTitle}">


						</div>
					</c:if>
					<div class="typography">
						<h3>${blog.subTitle}</h3>
						<p>${blog.content}</p>
					</div>

					<div class="cats">
						Posted in: <a href="/smo/blogs/${blog.category}/${ blog.id}">${smoCategoriesMap[blog.category]}
						</a>
					</div>
				</article>
				<!--/ blog post -->

				<!-- comments -->
				<section class="widget comments">
					<div class="widget-title" style="margin-bottom: 20px;">${fn:length(blogComments)}
						Comments</div>

					<ul>
						<c:forEach items="${blogComments}" var="comment">
							<li>
								<div class="avatar">
									<i class="fa fa-user"></i>
								</div>
								<div class="text">
									<div class="author">
										<span>${comment.user}</span> &nbsp; ${comment.createdDate}
									</div>
									<p>${comment.comment}</p>
								</div>
							</li>
						</c:forEach>
					</ul>
				</section>
				<!--/ comments -->

				<!-- add comment -->
				<section class="widget add-comment">
					<div class="widget-title" style="margin-bottom: 20px;">Leave
						a Comment</div>

					<form:form method="post" modelAttribute="comment"
						action="${pageContext.request.contextPath}/addComment">
						<input type="text" name="user" id="user"
							placeholder="Your Name (required)">
						<input type="email" name="email" id="email"
							placeholder="Your E-mail">
						<input type="hidden" name="contentId" id="contentId"
							value="${blog.id}">
						<input type="hidden" name="referurl" id="referurl"
							value="${blog.id}">
						<textarea rows="6" placeholder="Your Message (required)"
							name="comment" id="comment"></textarea>
						<button type="submit" class="button">Post comment</button>
					</form:form>
				</section>
				<!--/ add comment -->
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
								href="/smo/blogs/${category.id}">${category.category }</a></li>
						</c:forEach>
					</ul>
				</section>
				<!--/ categories -->
				<section class="widget widget-comments">
					<div class="widget-title" style="margin-bottom: 15px;">
						Related Posts.</div>
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

						<c:forEach items="${blog.keyWords}" var="keyWord">
							<li><a
								href="${pageContext.request.contextPath}/searchArticle?article=${ keyWord}">${keyWord
									}</a></li>
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