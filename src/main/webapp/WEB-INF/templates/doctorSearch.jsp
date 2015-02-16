<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
						<c:forEach items="${docs }" var="doc">
							<dd style="display: block;">
								<div class="details" style="">
									<div class="clearfix">
										<img
											src="${pageContext.request.contextPath}/static/img/2(2).jpg"
											width="110" height="130" alt="">

										<div class="widget-title">
											<a href="doctor/${doc.id}" style="color: black">Dr.
												${doc.fname} ${doc.lname}</a><a
												style="font-size: 15px; margin-left: 69px;"><i
												class="fa fa-pencil"></i> Write a Review</a>
										</div>
										<h1>
											<c:forEach items="${doc.specilities }" var="docSpecility">
											${specilityMap[docSpecility]},
										</c:forEach>
										</h1>
										<ul>

											<li><i class="fa fa-user" style="margin-right: 5px;"></i>Patient
												Experience</li>
											<span class="star-rating star-rating-empty"> <span
												class="stars"> <c:choose>
														<c:when test="${ratingMap[doc.id] == 5}">
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${ratingMap[doc.id] == 4}">
															<span class="star"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${ratingMap[doc.id] == 3}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${ratingMap[doc.id] == 2}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star "></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${ratingMap[doc.id] == 1}">
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

												<a><c:if test="${countMap[doc.id]==null}">0</c:if>${countMap[doc.id]}
													reviews</a>


											</div>
											<li><a style="font-size: 25px;"><i
													class="fa fa-thumbs-up"
													style="color: #96bf2d; font-size: 25px;"></i> <c:if
														test="${recommendationMap[doc.id]==null}">0</c:if>
													${recommendationMap[doc.id]}</a>Recommendations</li>
										</ul>
										<ul style="width: 220px;">
											<c:forEach items="${doc.hospitals}" var="hospital" begin="0"
												end="0">
												<li><i class="fa fa-hospital-o"
													style="margin-right: 5px;"></i>Hospital</li>
												<li><a>${hospitalMap[hospital.hospitalId].name}</a></li>
												<li>${hospitalMap[hospital.hospitalId].contact.address}</li>
												<li>${hospitalMap[hospital.hospitalId].contact.city} ,
													${hospitalMap[hospital.hospitalId].contact.state}
													(${hospitalMap[hospital.hospitalId].contact.country})</li>
												<li><i class="fa fa-phone"></i>
													${hospitalMap[hospital.hospitalId].phone.enquiryPhoneNo[0]}</li>
											</c:forEach>
										</ul>
										<ul>
											<li><i class="fa fa-location-arrow"
												style="margin-right: 5px;"></i> ${doc.city }</li>
											<li><i class="fa fa-star" style="margin-right: 5px;"></i>
												<c:forEach items="${doc.education}" var="entry">${entry.degree } ,
											</c:forEach></li>
											<li><i class="fa fa-calendar" style="margin-right: 5px;"></i>
												15 year (s) Experience</li>


										</ul>

									</div>
								</div>

							</dd>
						</c:forEach>
					</dl>
					<nav class="woocommerce-pagination">
						<ul class="page-numbers">
							<li><span class="page-numbers current">1</span></li>
							<li><a class="page-numbers" href="#">2</a></li>
							<li><a class="next page-numbers" href="#">3</a></li>
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