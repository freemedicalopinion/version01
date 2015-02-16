<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>Online free medical opinion</title>

<!-- metas -->
<meta charset="utf-8">
<meta name="language" content="en-us" />
<meta name="revist-after" content="1 days" />
<meta name="robots" content="index,follow" />
<meta name="author" content="http://www.freemedicalopinion.com">
<meta name="keywords" content="free medical opinion,free online consultation,  Free Consultation Online,health,Health Care,online consultation,drugs information, health related information, medical calculators, health calculators, health news, health records, medical records, Alternative Medicine" />
<meta name="description" content="Get free medical opinion questions answered and experience of others with doctors and hospitals" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<!--/ metas -->
</head>

<body>
	<div class="page">
		<!-- including header -->
		<%@ include file="header.html"%>

		<!-- page content -->
		<main class="page-content">

		<div>
			<div class="grid-row"></div>
			<div class="grid-row"></div>

			<div class="grid-row">

				<div class="wpb_row vc_row-fluid">
					<div class="vc_span12 wpb_column column_container">
						<div class="wpb_wrapper">
							<div
								class="wpb_text_column wpb_content_element section-headers inline">
								<div class="wpb_wrapper">
									<h1>Search others Experiences with</h1>
									Doctors | Hospitals
								</div>
							</div>
							<div
								class="wpb_text_column wpb_content_element section-text inline">
								<div class="wpb_wrapper">
									<p>Might that will help you or your family to get nice
										treatment .</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="search.html"%>
				<div class="widget pricing-table wpb_content_element">

					<div class="row">
						<!--
								-->
						<div class="col col-4">
							<div class="vc_span6">
								<div class="milestone clearfix">
									<div class="icon">
										<i class="fa fa-users"></i>
									</div>
									<div class="title">${totalUsers}</div>

									Users
								</div>
							</div>

						</div>
						<!--
								-->
						<div class="col col-4">
							<div class="vc_span6">
								<div class="milestone clearfix">
									<div class="icon">
										<i class="fa fa-user-md"></i>
									</div>
									<div class="title">${totalDoctors}</div>
									Doctors
								</div>
							</div>

						</div>
						<!--
								-->
						<div class="col col-4">
							<div class="vc_span6">
								<div class="milestone milestone-alt clearfix">
									<div class="icon">
										<i class="fa fa-ambulance"></i>
									</div>
									<div class="title">${totalHospitals}</div>
									Hospitals
								</div>
							</div>

						</div>
						<!--
								-->
						<div class="col col-4">
							<div class="vc_span6">
								<div class="milestone milestone-alt clearfix">
									<div class="icon">
										<i class="fa fa-user"></i>
									</div>
									<div class="title">${totalArticles}</div>
									Articles
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>

			<div class="grid-row-sep"></div>
		</div>
		<div id="how-it-works-section">
			<div class="grid-row"></div>
			<div class="wpb_row vc_row-fluid">
				<div class="vc_span12 wpb_column column_container">
					<div class="wpb_wrapper">
						<div
							class="wpb_text_column wpb_content_element section-headers inline">
							<div class="wpb_wrapper">
								<h1>How it</h1>
								Works
							</div>
						</div>
						<div class="wpb_text_column wpb_content_element section-text">
							<div class="wpb_wrapper">
								<p>
									<b>Clinico</b> comes with six predefined color schemes. Take a
									look and make a choice easily adjust one of the predefined
									schemes!
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="grid-row">

				<div class="widget pricing-table wpb_content_element">

					<div class="row">
						<!--
								-->
						<div class="col col-4">
							<div class="head">
								<span>SHARE</span>Your Experience with Doctors | Hospitals
							</div>

							<ul class="listing">
								<li><i class="fa fa-clock-o"></i>1 Time a Year</li>
								<li><i class="fa fa-flask"></i>30 Tests and Treatments</li>
								<li><i class="fa fa-star"></i>6 Specialties</li>
								<li><i class="fa fa-heart"></i>24h Assistance</li>
							</ul>
							<div class="summary">Aliquam euismod erat libero, eu
								condimentum nisl hendrerit vel. Ut sit amet congue lectus.</div>

						</div>
						<!--
								-->
						<div class="col col-4">
							<div class="head">
								<span>Healthcare ADVICE</span>Find real healthcare opinion
							</div>

							<ul class="listing">
								<li><i class="fa fa-clock-o"></i>1 Time a Year</li>
								<li><i class="fa fa-flask"></i>30 Tests and Treatments</li>
								<li><i class="fa fa-star"></i>6 Specialties</li>
								<li><i class="fa fa-heart"></i>24h Assistance</li>
							</ul>
							<div class="summary">Aliquam euismod erat libero, eu
								condimentum nisl hendrerit vel. Ut sit amet congue lectus.</div>

						</div>
						<!--
								-->
						<div class="col col-4">
							<div class="head">
								<span>DOCTOR</span>Find Doctor and get there reviews/Rating
							</div>

							<ul class="listing">
								<li><i class="fa fa-clock-o"></i>1 Time a Year</li>
								<li><i class="fa fa-flask"></i>30 Tests and Treatments</li>
								<li><i class="fa fa-star"></i>6 Specialties</li>
								<li><i class="fa fa-heart"></i>24h Assistance</li>
							</ul>
							<div class="summary">Aliquam euismod erat libero, eu
								condimentum nisl hendrerit vel. Ut sit amet congue lectus.</div>

						</div>
						<!--
								-->
						<div class="col col-4">
							<div class="head">
								<span>HOSPITALS</span>Find Hospital and get there others
								feedbacks
							</div>

							<ul class="listing">
								<li><i class="fa fa-clock-o"></i>1 Time a Year</li>
								<li><i class="fa fa-flask"></i>30 Tests and Treatments</li>
								<li><i class="fa fa-star"></i>6 Specialties</li>
								<li><i class="fa fa-heart"></i>24h Assistance</li>
							</ul>
							<div class="summary">Aliquam euismod erat libero, eu
								condimentum nisl hendrerit vel. Ut sit amet congue lectus.</div>

						</div>
					</div>
				</div>

			</div>

			<div class="grid-row-sep"></div>
		</div>
		<div id="doctor-section">
			<div class="grid-row"></div>
			<div class="wpb_row vc_row-fluid">
				<div class="vc_span12 wpb_column column_container">
					<div class="wpb_wrapper">
						<div
							class="wpb_text_column wpb_content_element section-headers inline">
							<div class="wpb_wrapper">
								<h1>Find</h1>
								Doctor
							</div>
						</div>
						<div class="wpb_text_column wpb_content_element section-text">
							<div class="wpb_wrapper">
								<p>
									<b>Clinico</b> comes with six predefined color schemes. Take a
									look and make a choice easily adjust one of the predefined
									schemes!
								</p>
							</div>
						</div>
					</div>
				</div>
				ss
			</div>

			<div class="grid-row">
				<!-- doctors carousel -->
				<section class="widget doctors-carousel doctors">
					<div id="doctors-carousel" class="owl-carousel">
						<c:forEach var="userWithRoleDoc" items="${userWithRoleDoctor}"
							end="10">
							<div class="item">
								<div class="pic">
									<img
										src="${pageContext.request.contextPath}/static/images/profile/${userWithRoleDoc.username}/${userWithRoleDoc.profilePicture}"
										width="270" height="270"
										alt="${userWithRoleDoc.fname} ${userWithRoleDoc.lname}">
									<div class="links">
										<ul>
											<li><a href="doctor/${userWithRoleDoc.id}"
												class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>

								<%-- <c:forEach var="education" items="${doctors.education}" end="2">
									<h3>${education.degree}</h3>
								</c:forEach> --%>

								<h3>Dr. ${userWithRoleDoc.fname} ${userWithRoleDoc.lname}</h3>
								<p>
									${userWithRoleDoc.specilities }
									<%-- <c:forEach items="${userWithRoleDoc.specilities }" var="docSpecility">
											${specilityMap[docSpecility]},
										</c:forEach> --%>
									<br> <span class="star-rating star-rating-empty"> <span
										class="stars"> <c:choose>
												<c:when test="${ratingMap[userWithRoleDoc.id] == 5}">
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
												</c:when>
												<c:when test="${ratingMap[userWithRoleDoc.id] == 4}">
													<span class="star"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
												</c:when>
												<c:when test="${ratingMap[userWithRoleDoc.id] == 3}">
													<span class="star"></span>
													<span class="star "></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
												</c:when>
												<c:when test="${ratingMap[userWithRoleDoc.id] == 2}">
													<span class="star"></span>
													<span class="star "></span>
													<span class="star "></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
												</c:when>
												<c:when test="${ratingMap[userWithRoleDoc.id] == 1}">
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
									</span><br>
									<c:if test="${countMap[userWithRoleDoc.id]==null}">0</c:if>
									${countMap[userWithRoleDoc.id]} reviews

								</p>

							</div>
						</c:forEach>

					</div>
				</section>
				<!--/ doctors carousel -->
			</div>

			<div class="grid-row-sep"></div>
		</div>
		<div id="hospital-section">
			<div class="grid-row"></div>
			<div class="wpb_row vc_row-fluid">
				<div class="vc_span12 wpb_column column_container">
					<div class="wpb_wrapper">
						<div
							class="wpb_text_column wpb_content_element section-headers inline">
							<div class="wpb_wrapper">
								<h1>Find</h1>
								HOSPITALS
							</div>
						</div>
						<div class="wpb_text_column wpb_content_element section-text">
							<div class="wpb_wrapper">
								<p>
									<b>Clinico</b> comes with six predefined color schemes. Take a
									look and make a choice easily adjust one of the predefined
									schemes!
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="grid-row">
				<!-- doctors carousel -->
				<section class="widget doctors-carousel doctors">
					<div id="hospitals-carousel" class="owl-carousel">
						<c:forEach var="hospitalObject" items="${latestHospitals}"
							end="10">
							<div class="item">
								<div class="pic">
									<img
										src="${pageContext.request.contextPath}/static/images/profile/${hospitalObject.username}/${hospitalObject.profilePicture}"
										width="270" height="270" alt="${hospitalObject.fname}">
									<div class="links">
										<ul>
											<li><a href="hospital/${hospitalObject.id}"
												class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>

								<h3>${hospitalObject.name}</h3>
								<p>
									${hospitalObject.contact.city}<br>
									<span class="star-rating star-rating-empty"> <span
										class="stars"> <c:choose>
												<c:when test="${ratingMapHospital[hospitalObject.id] == 5}">
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
												</c:when>
												<c:when test="${ratingMapHospital[hospitalObject.id] == 4}">
													<span class="star"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
												</c:when>
												<c:when test="${ratingMapHospital[hospitalObject.id] == 3}">
													<span class="star"></span>
													<span class="star "></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
												</c:when>
												<c:when test="${ratingMapHospital[hospitalObject.id] == 2}">
													<span class="star"></span>
													<span class="star "></span>
													<span class="star "></span>
													<span class="star selected"></span>
													<span class="star selected"></span>
												</c:when>
												<c:when test="${ratingMapHospital[hospitalObject.id] == 1}">
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
									</span><br>
									<c:if test="${countMapHospital[hospitalObject.id]==null}">0</c:if>
									${countMapHospital[hospitalObject.id]} reviews
								</p>
							</div>
						</c:forEach>

					</div>
				</section>
				<!--/ doctors carousel -->
			</div>


			<div class="grid-row-sep"></div>
		</div>
		<div id="blog-section">
			<div class="grid-row"></div>
			<div class="wpb_row vc_row-fluid">
				<div class="vc_span12 wpb_column column_container">
					<div class="wpb_wrapper">
						<div
							class="wpb_text_column wpb_content_element section-headers inline">
							<div class="wpb_wrapper">
								<h1>Latest Blogs</h1>
								INTEGRATED
							</div>
						</div>
						<div class="wpb_text_column wpb_content_element section-text">
							<div class="wpb_wrapper">
								<b>Clinico</b> comes with popular Icon Font - FontAwesome. Feel
								free to use over 200 icons to create distinguished and unique
								content paragraphs, buttons, lists etc.
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="grid-row">
				<!-- news -->
				<section id="" class="widget news news-3">
					<div class="grid">
						<c:forEach var="blog" items="${latestContent}" end="3">
							<div class="item">
								<h3>
									<a href="/smo/blogs/${blog.category}/${ blog.id}">${blog.blogTitle}</a>
								</h3>
								<div class="date">

									${blog.updatedDate}<i class="fa fa-comment"><span>${fn:length(mapOfBlogComments[blog.id])}</span></i>
								</div>
								<c:if test="${blog.bigImage!=null}">
									<div class="pic">
										<img
											src="${pageContext.request.contextPath}/static/images/${ blog.id}/big/${blog.bigImage}"
											alt="${blog.blogTitle}">
										<div class="links">
											<ul>
												<li><a href="/smo/blogs/${blog.category}/${ blog.id}"
													class="fa fa-plus"></a></li>
											</ul>
										</div>
									</div>
								</c:if>
								<p>
									${blog.subTitle} <a
										href="/smo/blogs/${blog.category}/${ blog.id}">&rarr;</a>
								</p>
								<div class="cats">
									Posted in: <a href="/smo/blogs/${blog.category}">${smoBlogCategoriesMap[blog.category]}
									</a>


								</div>
							</div>
						</c:forEach>





					</div>
					<a href="blogs" data-template="news-three" data-page="2"
						class="button more"><i class="fa fa-refresh"></i>Load more</a>
				</section>
				<!--/ photo tour -->
			</div>


			<div class="grid-row-sep"></div>
		</div>

		<div id="contact-us-section">
			<div class="grid-row"></div>
			<div class="wpb_row vc_row-fluid">
				<div class="vc_span12 wpb_column column_container">
					<div class="wpb_wrapper">
						<div
							class="wpb_text_column wpb_content_element section-headers inline">
							<div class="wpb_wrapper">
								<h1>Contact</h1>
								US
							</div>
						</div>
						<div class="wpb_text_column wpb_content_element section-text">
							<div class="wpb_wrapper">
								<p>
									<b>Clinico</b> comes with six predefined color schemes. Take a
									look and make a choice easily adjust one of the predefined
									schemes!
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="grid-row">
				<!-- map -->
				<section class="map">
					<div class="widget-title">Our Locations</div>
					<div id="map" class="google-map"></div>
				</section>
				<!--/ map -->
			</div>
			<div class="grid-row">
				<div class="grid-col grid-col-9">
					<!-- feedback -->
					<article class="feedback">
						<form:form method="post" modelAttribute="smoContactUs"
							action="addContactUs">
							<fieldset>
								<div class="clearfix">
									<div class="input">
										<label>Your name:</label> <input type="text" name="name"
											required>
									</div>
									<div class="input">
										<label>Your email:</label> <input type="email" name="email"
											required>
									</div>
								</div>
								<label>Summary:</label>
								<textarea rows="1" name="summary" required></textarea>
								<label>Message:</label>
								<textarea rows="6" name="message" required></textarea>
								<button type="submit" class="button" value="Submit">Submit</button>


							</fieldset>
						</form:form>
					</article>
					<!--/ feedback -->
				</div>

			</div>
			<div class="grid-row-sep"></div>
		</div>
		</main>
		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
</body>
</html>