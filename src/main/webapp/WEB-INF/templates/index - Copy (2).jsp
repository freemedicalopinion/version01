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
<meta name="author" content="MSO">
<meta name="keywords" content="">
<meta name="description" content="">
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
		<div class="grid-row">
			<div>
				<div class="grid-row"></div>
				<div class="wpb_row vc_row-fluid">
					<div class="vc_span12 wpb_column column_container">
						<div class="wpb_wrapper">
							<div
								class="wpb_text_column wpb_content_element section-headers inline">
								<div class="wpb_wrapper">
									<h1>Share Your Experience with</h1>
									Doctors | Hospitals
								</div>
							</div>
							<div
								class="wpb_text_column wpb_content_element section-text inline">
								<div class="wpb_wrapper">
									<p>Might that will help others to get nice treatment .</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="animating-block-1" class="animating-block">
					<img
						src="${pageContext.request.contextPath}/static/pic/page-retina-ready/1/iphone.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/static/pic/page-retina-ready/1/monitor.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/static/pic/page-retina-ready/1/ipad.png"
						alt="">
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

				<div id="animating-block-4" class="animating-block">
					<img
						src="${pageContext.request.contextPath}/static/pic/page-retina-ready/4/color-6.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/static/pic/page-retina-ready/4/color-5.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/static/pic/page-retina-ready/4/color-4.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/static/pic/page-retina-ready/4/color-3.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/static/pic/page-retina-ready/4/color-2.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/static/pic/page-retina-ready/4/color-1.png"
						alt="">
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
				</div>
				<div class="grid-row">
					<form name="search_bar"
						class="search-bar searchForm specialization-search " action="/"
						method="GET">
						<div class="search-bar-tab-container">
							<div class="search-bar-tab">SPECIALTY</div>
							<div class=" search-bar-tab-selected">DOCTOR</div>
							<div class="search-bar-tab">CLINIC</div>
						</div>
						<div class="search-bar-container">
							<input name="q" type="text"
								placeholder="Eg. Dentist, Gynecologist" value=""
								class="ui-autocomplete-input" autocomplete="off"> <input
								name="locality" type="text" placeholder="Eg. Connaught Place"
								value="" class="ui-autocomplete-input" autocomplete="off">
							<input type="submit" class="search-button" value="">
						</div>
					</form>
				</div>
				<div class="grid-row">
					<div class="vc_span6">
						<div class="wpb_tabs wpb_content_element" id="searchLarge">
							<div class="wpb_tour_tabs_wrapper clearfix">
								<ul class="wpb_tabs_nav clearfix" role="tablist"
									style="background: none;">
									<li role="tab" aria-selected="true"><a href="#tab-4">Doctor</a></li>
									<li role="tab"><a href="#tab-5">Hospital</a></li>
									<li role="tab"><a href="#tab-6">Article</a></li>
								</ul>
								<div id="tab-4" class="wpb_tab"
									style="border: 1px solid #008fd5;padding: 0px;">
									<div class="wpb_text_column wpb_content_element">
										<!-- quick search -->
										<form id="quick-search"
											class="quick-search quick-search-visible">
											<fieldset>

												<input type="text" placeholder="Search by name"
													style="font-size: 20px;"> <input type="text"
													placeholder="Search by name"> <input type="text"
													placeholder="Search by name">
												<button type="submit">Search</button>

											</fieldset>
										</form>
										<!--/ quick search -->
									</div>
								</div>
								<div id="tab-5" class="wpb_tab"
									style="border: 1px solid #008fd5;">
									<div class="wpb_text_column wpb_content_element">
										<p>Maecenas facilisis tellus metus, sed lacinia ipsum
											sollicitudin in. Pellentesque in tincidunt augue. Fusce
											ullamcorper vestibulum mauris non volutpat. Fusce ac tellus
											quis neque egestas aliquet in ac ipsum. Phasellus ac
											hendrerit risus. Nullam porta fermentum lectus. Mauris ornare
											vulputate tortor, eget ullamcorper dolor ullamcorper ac.</p>
									</div>
								</div>
								<div id="tab-6" class="wpb_tab"
									style="border: 1px solid #008fd5;">
									<div class="wpb_text_column wpb_content_element">
										<p>Aliquam venenatis, lectus ac varius varius, mi lorem
											molestie sem, sed dignissim lectus libero at velit.
											Suspendisse potenti. Suspendisse orci justo, viverra laoreet
											leo at, pharetra vulputate enim. Aliquam volutpat lectus
											ullamcorper purus feugiat porttitor. Vestibulum ante ipsum
											primis in faucibus orci luctus et ultrices posuere cubilia
											Curae; Integer eleifend ante enim, ac sollicitudin diam
											placerat nec. Vivamus viverra iaculis scelerisque.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="grid-row">
					<!-- doctors carousel -->
					<section class="widget doctors-carousel doctors">
						<div id="doctors-carousel" class="owl-carousel">
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>




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
					<!-- hospitals carousel -->
					<section class="widget doctors-carousel doctors">
						<div id="hospitals-carousel" class="owl-carousel">
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
							<div class="item">
								<div class="pic">
									<img src="pic/doctor-1.jpg" width="270" height="270"
										alt="Dr. Butcher House">
									<div class="links">
										<ul>
											<li><a href="#" class="fa fa-info"></a></li>
										</ul>
									</div>
								</div>
								<h3>Dr. Butcher House</h3>
								<p>
									Ophthomologist<br>MBBS , MD<br> <span
										class="star-rating star-rating-empty"> <span
										class="stars"> <span class="star"></span> <span
											class="star half"></span> <span class="star selected"></span>
											<span class="star selected"></span> <span
											class="star selected"></span>
									</span>
									</span>
								</p>
							</div>
						</div>
					</section>
					<!--/ hospitals carousel -->
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
							<div class="item">
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
										href="#">&rarr;</a>
								</p>
								<div class="cats">
									Posted in: <a href="#">Dental Clinic</a>, <a href="#">General</a>,
									<a href="#">News</a>
								</div>
							</div>

							<div class="item">
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
										href="#">&rarr;</a>
								</p>
								<div class="cats">
									Posted in: <a href="#">Dental Clinic</a>, <a href="#">General</a>,
									<a href="#">News</a>
								</div>
							</div>

							<div class="item">
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
										href="#">&rarr;</a>
								</p>
								<div class="cats">
									Posted in: <a href="#">Dental Clinic</a>, <a href="#">General</a>,
									<a href="#">News</a>
								</div>
							</div>
						</div>
						<a href="#" data-template="news-three" data-page="2"
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
					<div class="grid-col grid-col-9">
						<!-- feedback -->
						<article class="feedback">
							<form action="#" id="contactform">
								<fieldset>
									<div class="clearfix">
										<div class="input">
											<label>Your name:</label> <input type="text" name="name">
										</div>
										<div class="input">
											<label>Your email:</label> <input type="text" name="email">
										</div>
									</div>
									<div class="clearfix">
										<div class="input">
											<label>Category:</label> <input type="text" name="category">
										</div>
										<div class="input">
											<label>Subject:</label> <input type="text" name="subject">
										</div>
									</div>
									<label>Message:</label>
									<textarea rows="6" name="message"></textarea>
									<div class="clearfix captcha">

										<button type="submit" class="button" value="Submit">Submit</button>

									</div>
								</fieldset>
							</form>
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