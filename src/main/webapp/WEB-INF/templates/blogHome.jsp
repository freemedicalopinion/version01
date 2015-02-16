<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<%@ include file="searchTitle.html"%>
		<!-- Page title -->
		<section class="page-title">
			<div class="grid-row clearfix">
				<h1>FMO Blog Home</h1>
			</div>

		</section>
		<div class="grid-row clearfix"></div>

		<!--/ Page title -->
		<!-- page content -->
		<main class="page-content">
		<div class="grid-row">
			<div class="grid-col grid-col-3">
				<!-- sevices -->
				<section class="widget widget-sevices">
					<div class="widget-title">Departments</div>
					<ul>

						<c:forEach items="${allCategories}" var="category">
							<li><i class="fa fa-bookmark"></i><a
								href="${pageContext.request.contextPath}/blogs/${category.id}"><i
									class="fa fa-angle-right"></i>${category.category}</a></li>
						</c:forEach>


					</ul>
				</section>
				<!--/ sevices -->





				<!-- tags -->
				<section class="widget widget-tags">
					<div class="widget-title">Tags</div>
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

			<div class="grid-col grid-col-6">
				<!-- philosophy -->
				<section>
					<c:forEach items="${listOfLatestBlogs}" var="blog" varStatus="loop">
						<fmt:formatNumber var="divisionOfList"
							value="${fn:length(listOfLatestBlogs)/2}" minFractionDigits="0"
							maxFractionDigits="0" />
						<c:if test="${loop.index == 0}">

							<div class="widget-title"><a href="${pageContext.request.contextPath}/blogs/${blog.category}/${ blog.id}">${blog.blogTitle}</a></div>

							<div class="wpb_text_column wpb_content_element">

								<div class="wpb_wrapper">
									<img
										src="${pageContext.request.contextPath}/static/images/${ blog.id}/big/${blog.bigImage}"
										width="260" height="246" alt="${blog.blogTitle}" class="alignleft">
									<p style="text-transform: capitalize;">${blog.subTitle}</p>
									<p style="text-transform: capitalize;">${blog.summary}</p>


								</div>
								<div class="grid-row clearfix"></div>
							</div>
				</section>
				<!--/ philosophy -->

				<!-- list -->
				<article>
					<div class="widget-title">Most Popular Healthcare Blogs</div>
					<div class="vc_row-fluid">
						<div class="vc_span6 wpb_column column_container">
							
								<div class="wpb_text_column4 wpb_content_element">
									
										<ul class="ul4">

											</c:if>


											<c:if test="${divisionOfList > loop.index}">
												<li><a href="${pageContext.request.contextPath}/blogs/${blog.category}/${ blog.id}">${blog.blogTitle}</a></li>
											</c:if>
											<c:if test="${divisionOfList == loop.index}">
										</ul>
									
								</div>
							
						</div>
						<div class="vc_span6 wpb_column column_container">
							<div class="wpb_wrapper">
								<div class="wpb_text_column4 wpb_content_element">
								
									<div class="wpb_wrapper">
										<ul class="ul4">
											<li><a href="${pageContext.request.contextPath}/blogs/${blog.category}/${ blog.id}">${blog.blogTitle}</a></li>
											</c:if>

											<c:if test="${divisionOfList < loop.index}">
												<li><a href="${pageContext.request.contextPath}/blogs/${blog.category}/${ blog.id}">${blog.blogTitle}</a></li>

											</c:if>
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
				<form action="#" class="widget widget-site-search">
					<input type="text" placeholder="Search the site">
					<button type="submit" class="button">GO</button>
				</form>
				<!--/ site search -->

				<!-- comments -->
				<section class="widget widget-comments">
					<div class="widget-title">Comments</div>
					<div id="comments-carousel" class="owl-carousel">
						<div class="item">
							<ul>
							
							<c:forEach items="${listOfLatestComments }" var="comment">
								<li><a class="pic"><i class="fa fa-leaf"></i></a>
									<div class="author">
										<a href="#">${comment.user}</a>
									</div>
									<p>
										${comment.comment}<br>
										<span class="date"><fmt:formatDate type="date" value="${comment.createdDate}" /></span>
									</p>
								</li>
							</c:forEach>
								
								
							</ul>
						</div>
						
						
					</div>
				</section>
				<!--/ comments -->







			</div>
			<div class="grid-col grid-col-9"></div>

			<!-- toggles -->
			<div class="grid-row">
				<!-- news -->
				
					<div class="grid isotope"
						style="position: relative; overflow: hidden;">
						<div class="item isotope-item"
							style="position: absolute; left: 0px; top: 0px; transform: translate3d(0px, 0px, 0px);">
							<div class="widget-title">
								<a href="#">Living Healthy</a>
							</div>
							<h3>
								<a href="#">Nullam euismod commodo</a>
							</h3>
							<div class="date">
								20 AUG 2014<i class="fa fa-comment"><span>3</span></i>
							</div>
							<div class="pic">
								<img src="pic/photo-tour-1.jpg" alt="Nullam euismod commodo">
								<div class="links">
									<ul>
										<li><a href="#" class="fa fa-plus"></a></li>
									</ul>
								</div>
							</div>
							<p>
								Mauris vitae quam quam. Class aptent taciti sociosqu ad litora
								torquent per conubia nostra, per inceptos himenaeos. Integer
								ullamcorper ultricies eros eu consequat. Nullam convallis
								volutpat nunc, gravida vestibulum mauris interdum et. Nunc
								tristique eros nec dictum blandit. Cras eu turpis augue. Ut non
								molestie nulla. Nulla nec rutrum tortor, in fermentum nisl <a
									href="#">→</a>
							</p>
							<div class="vc_span6 wpb_column column_container">
								<div class="wpb_wrapper">
									<div class="wpb_text_column wpb_content_element">
										<div class="wpb_wrapper">
											<ul class="ul2">
												<li><a href="#">Suspendisse pharetra libero.</a></li>
												<li><a href="#">Curabitur a laoreet erat nulla
														odio.</a></li>
												<li><a href="#">Massa faucibus accumsan placerat
														dui.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="item isotope-item"
							style="position: absolute; left: 0px; top: 0px; transform: translate3d(600px, 0px, 0px);">
							<div class="widget-title">
								<a href="#">Family & Pregnancy</a>
							</div>
							<h3>
								<a href="#">Commodo purus sit amet</a>
							</h3>
							<div class="date">
								18 AUG 2014<i class="fa fa-comment"><span>4</span></i>
							</div>
							<div class="video">
								<iframe
									src="http://player.vimeo.com/video/44510157?color=ffffff"
									allowfullscreen=""></iframe>
							</div>
							<p>
								Class aptent taciti sociosqu ad litora torquent per conubia
								nostra, per inceptos himenaeos. Aliquam venenatis consectetur
								sem, eget luctus eros. Sed massa arcu, tincidunt eget augue at,
								condimentum feugiat ante. Nullam eleifend aliquam magna <a
									href="#">→</a>
							</p>
							<div class="vc_span6 wpb_column column_container">
								<div class="wpb_wrapper">
									<div class="wpb_text_column wpb_content_element">
										<div class="wpb_wrapper">
											<ul class="ul2">
												<li><a href="#">Suspendisse pharetra libero.</a></li>
												<li><a href="#">Curabitur a laoreet erat nulla
														odio.</a></li>
												<li><a href="#">Massa faucibus accumsan placerat
														dui.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="item isotope-item"
							style="position: absolute; left: 0px; top: 0px; transform: translate3d(600px, 597px, 0px);">
							<div class="widget-title">
								<a href="#">Beauty & Relationships</a>
							</div>
							<h3>
								<a href="#">Quisque venenatis mi at</a>
							</h3>
							<div class="date">
								15 AUG 2014<i class="fa fa-comment"><span>1</span></i>
							</div>
							<p>Aliquam venenatis consectetur sem, eget luctus eros
								sodales et. Vivamus non metus eget nisl adipiscing congue. Donec
								placerat, ipsum fringilla cursus. Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Integer nec lectus orci. Nunc
								suscipit quis mauris non pellentesque. Cras at augue dui.
								Vestibulum mollis cursus orci.</p>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
								nec lectus orci. Nunc suscipit quis mauris non pellentesque.
								Cras at augue dui. Vestibulum mollis cursus orci ut laoreet.
								Duis accumsan accumsan adipiscing. Mauris tincidunt a lacus nec
								pretium <a href="#">→</a>
							</p>
							<div class="vc_span6 wpb_column column_container">
								<div class="wpb_wrapper">
									<div class="wpb_text_column wpb_content_element">
										<div class="wpb_wrapper">
											<ul class="ul2">
												<li><a href="#">Suspendisse pharetra libero.</a></li>
												<li><a href="#">Curabitur a laoreet erat nulla
														odio.</a></li>
												<li><a href="#">Massa faucibus accumsan placerat
														dui.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="item isotope-item"
							style="position: absolute; left: 0px; top: 0px; transform: translate3d(0px, 641px, 0px);">
							<div class="widget-title">
								<a href="#">Diet & Fitness</a>
							</div>
							<h3>
								<a href="#">Cras gravida tristique odio</a>
							</h3>
							<div class="date">
								12 AUG 2014<i class="fa fa-comment"><span>4</span></i>
							</div>
							<div class="audio">
								<audio controls="" preload="none">
									<source src="audio/californication.html" type="audio/mpeg">
									
								
								
								
								
								
								
								
								
								
								
								

								
								
								</audio>
							</div>
							<p>Class aptent taciti sociosqu ad litora torquent per
								conubia nostra, per inceptos himenaeos. Aliquam venenatis
								consectetur sem, eget luctus eros. Sed massa arcu, tincidunt
								eget augue at, condimentum feugiat ante. Nullam eleifend aliquam
								magna.</p>
							<p>Donec placerat, ipsum fringilla cursus vehicula, velit
								diam tristique magna. Donec placerat, ipsum fringilla cursus
								vehicula, velit diam tristique magna, vitae sodales urna ante et
								lorem. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Integer nec lectus orci.</p>
							<div class="vc_span6 wpb_column column_container">
								<div class="wpb_wrapper">
									<div class="wpb_text_column wpb_content_element">
										<div class="wpb_wrapper">
											<ul class="ul2">
												<li><a href="#">Suspendisse pharetra libero.</a></li>
												<li><a href="#">Curabitur a laoreet erat nulla
														odio.</a></li>
												<li><a href="#">Massa faucibus accumsan placerat
														dui.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="item isotope-item"
							style="position: absolute; left: 0px; top: 0px; transform: translate3d(600px, 975px, 0px);">
							<div class="widget-title">
								<a href="#">Obesity Weight Loss</a>
							</div>
							<h3>
								<a href="#">Quisque venenatis mi</a>
							</h3>
							<div class="date">
								11 AUG 2014<i class="fa fa-comment"><span>3</span></i>
							</div>
							<div class="pic">
								<img src="pic/photo-tour-2.jpg" alt="Quisque venenatis mi">
								<div class="links">
									<ul>
										<li><a href="#" class="fa fa-plus"></a></li>
									</ul>
								</div>
							</div>
							<p>
								Mauris vitae quam quam. Class aptent taciti sociosqu ad litora
								torquent per conubia nostra, per inceptos himenaeos. Integer
								ullamcorper ultricies eros eu consequat <a href="#">→</a>
							</p>
							<div class="vc_span6 wpb_column column_container">
								<div class="wpb_wrapper">
									<div class="wpb_text_column wpb_content_element">
										<div class="wpb_wrapper">
											<ul class="ul2">
												<li><a href="#">Suspendisse pharetra libero.</a></li>
												<li><a href="#">Curabitur a laoreet erat nulla
														odio.</a></li>
												<li><a href="#">Massa faucibus accumsan placerat
														dui.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="item isotope-item"
							style="position: absolute; left: 0px; top: 0px; transform: translate3d(0px, 1042px, 0px);">
							<div class="widget-title">
								<a href="#">Organ Transplants</a>
							</div>
							<h3>
								<a href="#">Cras gravida tristique</a>
							</h3>
							<div class="date">
								10 AUG 2014<i class="fa fa-comment"><span>1</span></i>
							</div>
							<p>Aliquam venenatis consectetur sem, eget luctus eros
								sodales et. Vivamus non metus eget nisl adipiscing congue. Donec
								placerat, ipsum fringilla cursus. Lorem ipsum dolor sit amet,
								consectetur adipiscing elit. Integer nec lectus orci. Nunc
								suscipit quis mauris non pellentesque. Cras at augue dui.
								Vestibulum mollis cursus orci.</p>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
								nec lectus orci. Nunc suscipit quis mauris non pellentesque.
								Cras at augue dui. Vestibulum mollis cursus orci ut laoreet.
								Duis accumsan accumsan adipiscing. Mauris tincidunt a lacus nec
								pretium <a href="#">→</a>
							</p>
							<div class="vc_span6 wpb_column column_container">
								<div class="wpb_wrapper">
									<div class="wpb_text_column wpb_content_element">
										<div class="wpb_wrapper">
											<ul class="ul2">
												<li><a href="#">Suspendisse pharetra libero.</a></li>
												<li><a href="#">Curabitur a laoreet erat nulla
														odio.</a></li>
												<li><a href="#">Massa faucibus accumsan placerat
														dui.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
												<li><a href="#">Maecenas facilisis lacinia metus
														sit amet.</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
				<!--/ photo tour -->
			</div>
		</div>
		</main>
		<!--/ page content -->

		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
	
	
</body>
</html>