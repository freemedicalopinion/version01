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

		<section class="page-title">
			<div class="grid-row clearfix">
				<form id="quick-search" class="quick-search quick-search-visible">
					<fieldset>
						<legend>Advance Search:</legend>
						<input type="text" placeholder="Search by name"> <select>
							<option value="0">Speciality</option>
							<option value="1">Ophthomologist</option>
							<option value="2">Dermatologist</option>
							<option value="3">Neorologist</option>
							<option value="4">Surgeon</option>
						</select> <select>
							<option value="0">Locations</option>
							<option value="1">Primary Health Care</option>
							<option value="2">Gynaecological Clinic</option>
							<option value="3">Diagnosis With Precise</option>
							<option value="4">Cardiac Clinic</option>
							<option value="5">General Surgery</option>
						</select>

						<button type="submit">Search</button>

					</fieldset>
				</form>
			</div>
		</section>
		<!-- page content -->
		<main class="page-content">
		<div class="grid-row">
			<div class="grid-col grid-col-3">
				<div class="widget pricing-table wpb_content_element">
					<div class="col col-12">
						<div class="head">
							<span>Dr. Alok Kalyani</span><i class="fa fa-star"
								style="margin-right: 5px;"></i><i class="fa fa-star"
								style="margin-right: 5px;"></i> <i class="fa fa-star"
								style="margin-right: 5px;"></i><i class="fa fa-star"></i>
						</div>
						<div class="price">
							<div>
								<img src="#" style="height: 150px; width: 150px;">
							</div>
						</div>
						<ul class="listing">
							<li><i class="fa fa-clock-o"></i>MBBS, MD (Medicine), AFIH</li>
							<li><i class="fa fa-flask"></i>Experience 15 Year(s)</li>
							<li><i class="fa fa-star"></i>6 Specialties</li>
							<li><i class="fa fa-heart"></i>3797 Delhi Medical Council</li>
						</ul>
						<div class="summary">Aliquam euismod erat libero, eu
							condimentum nisl hendrerit vel. Ut sit amet congue lectus.</div>
						<div class="join">
							<a href="index-2.html">
								<button class="wpb_button wpb_btn-large">Add Review</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="grid-col grid-col-9">
				<!-- tabs -->
				<div class="vc_row-fluid">
					<div class="vc_span12">
						<div class="wpb_tabs wpb_content_element">
							<div class="wpb_tour_tabs_wrapper clearfix">
								<ul class="wpb_tabs_nav clearfix" role="tablist">
									
									<li role="tab" aria-selected="true"><a href="#tab-1">Practice Information</a></li>
									<li role="tab"><a href="#tab-2">Services</a></li>
									<li role="tab" ><a href="#tab-3">Profile</a></li>
									<li role="tab"><a href="#tab-4">Reviews</a></li>
									<li role="tab"><a href="#tab-5">Blog</a></li>
								</ul>
								<div id="tab-1" class="wpb_tab">
									<div class="wpb_text_column wpb_content_element">
										<section id="news" class="widget news news-1">
											<div class="widget pricing-table wpb_content_element">
												<div class="col col-12">
													<div class="item">
														<div class="date">About Dr. Alok Kalyani</div>
														<p>Aliquam venenatis consectetur sem, eget luctus eros
															sodales et. Vivamus non metus eget nisl adipiscing
															congue. Donec placerat, ipsum fringilla cursus. Lorem
															ipsum dolor sit amet, consectetur adipiscing elit.
															Integer nec lectus orci. Nunc suscipit quis mauris non
															pellentesque. Cras at JANue dui. Vestibulum mollis cursus
															orci.</p>
														<p>Lorem ipsum dolor sit amet, consectetur adipiscing
															elit. Integer nec lectus orci. Nunc suscipit quis mauris
															non pellentesque. Cras at JANue dui. Vestibulum mollis
															cursus orci ut laoreet. Duis accumsan accumsan
															adipiscing. Mauris tincidunt a lacus nec pretium.</p>

													</div>
												</div>
											</div>
										</section>
										
									</div>
								</div>
								<div id="tab-2" class="wpb_tab">
									<div class="wpb_text_column wpb_content_element">
										<p>Maecenas facilisis tellus metus, sed lacinia ipsum
											sollicitudin in. Pellentesque in tincidunt augue. Fusce
											ullamcorper vestibulum mauris non volutpat. Fusce ac tellus
											quis neque egestas aliquet in ac ipsum. Phasellus ac
											hendrerit risus. Nullam porta fermentum lectus. Mauris ornare
											vulputate tortor, eget ullamcorper dolor ullamcorper ac.</p>
									</div>
								</div>
								<div id="tab-3" class="wpb_tab">
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
								<div id="tab-4" class="wpb_tab">
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
								<div id="tab-5" class="wpb_tab">
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
			</div>
			<!--/ tabs -->
		</div>
		</main>
		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
</body>
</html>