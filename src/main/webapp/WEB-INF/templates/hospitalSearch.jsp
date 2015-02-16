<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>MSO</title>

<!-- metas -->
<meta charset="utf-8">
<meta name="language" content="en-us" />

<meta name="robots" content="index,follow" />
<meta name="author" content="http://www.freemedicalopinion.com">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<!--/ metas -->
</head>

<body>
	<div class="page">
		<!-- including header -->
			<%@ include file="searchTitle.html"%>
		<!-- page content -->
		<main class="page-content">
		<div class="grid-row">
			<div class="grid-col grid-col-9">
				<!-- services -->
				<section class="detailed-services wpb_content_element">
					<dl>
						<c:forEach items="${hospitals }" var="hospitalObject">
							<dd style="display: block;">
								<div class="details">
									<div class="clearfix">
										<img
											src="${pageContext.request.contextPath}/static/img/2(2).jpg"
											width="150" height="170" alt="">

										<div class="widget-title">
											<span style="text-transform: capitalize"><a href="hospital/${hospitalObject.id}" style="color: black">${fn:toLowerCase(hospitalObject.name
												)}</a></span>
										</div>
										
										<ul>

											<li><i class="fa fa-user" style="margin-right: 5px;"></i>Patient
												Experience</li>
											<span class="star-rating star-rating-empty"> <span
												class="stars"> <c:choose>
														<c:when test="${ratingMap[hospitalObject.id] == 5}">
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${ratingMap[hospitalObject.id] == 4}">
															<span class="star"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${ratingMap[hospitalObject.id] == 3}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${ratingMap[hospitalObject.id] == 2}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star "></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${ratingMap[hospitalObject.id] == 1}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star "></span>
															<span class="star "></span>
															<span class="star selected"></span>
														</c:when>
														<c:otherwise>
															<span class="star"></span>
															<span class="star "></span>
															<span class="star "></span>
															<span class="star "></span>
															<span class="star "></span>
														</c:otherwise>
													</c:choose>
											</span>
											</span>
											<div class="star-rating-count">

												<a><c:if test="${countMap[hospitalObject.id]==null}">0</c:if>${countMap[hospitalObject.id]}
													reviews</a>


											</div>
											<li><a style="font-size: 25px;"><i
													class="fa fa-thumbs-up"
													style="color: #96bf2d; font-size: 25px;"></i>
												<c:if test="${recommendationMap[hospitalObject.id]==null}">0</c:if>
													${recommendationMap[hospitalObject.id]}</a>Recommendations</li>
										</ul>
										<ul style="width: 200px;">
											<li><i class="fa fa-hospital-o"
												style="margin-right: 5px;"></i>Address</li>
											<li>${hospitalObject.contact.address}</li>
											<li>${hospitalObject.contact.city} ,
												${entry.contact.state} (${hospitalObject.contact.country})</li>

										</ul>


										<ul style="">
											
											<li><i class="fa fa-location-arrow"
												style="margin-right: 5px;"></i> ${doc.city}</li>
											<li><i class="fa fa-map-marker"
												style="margin-right: 5px;"></i> <a>View Map</a></li>
											<li><i class="fa fa-external-link"
												style="margin-right: 5px;"></i> <a>${hospitalObject.websiteUrl
													}</a></li>
										</ul>
									</div>
								</div>

							</dd>
						</c:forEach>
					</dl>
					<nav class="woocommerce-pagination">
						<ul class="page-numbers">
							<li><span class="page-numbers current">1</span></li>
							<li><a class="page-numbers"
								href="#">2</a></li>
							<li><a class="next page-numbers"
								href="#">3</a></li>
						</ul>
					</nav>
				</section>
				<!--/ services -->

			</div>

		</div>
		</main>
		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
</body>
</html>