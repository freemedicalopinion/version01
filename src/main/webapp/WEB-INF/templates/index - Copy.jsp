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

		<div class="grid-row"></div>


		<!-- page content -->
		<main class="page-content">
		<div class="grid-row"></div>
		
		<div class="grid-row">
		
<div class="widget pricing-table wpb_content_element">
							
							<div class="row">
								<!--
								--><div class="col col-4">
									<div class="head"><span>SHARE</span>Your Experience with Doctors | Hospitals</div>
									
									<ul class="listing">
										<li><i class="fa fa-clock-o"></i>1 Time a Year</li>
										<li><i class="fa fa-flask"></i>30 Tests and Treatments</li>
										<li><i class="fa fa-star"></i>6 Specialties</li>
										<li><i class="fa fa-heart"></i>24h Assistance</li>
									</ul>
									<div class="summary">Aliquam euismod erat libero, eu condimentum nisl hendrerit vel. Ut sit amet congue lectus.</div>
									
								</div><!--
								--><div class="col col-4">
									<div class="head"><span>Healthcare ADVICE</span>Find real healthcare opinion</div>
									
									<ul class="listing">
										<li><i class="fa fa-clock-o"></i>1 Time a Year</li>
										<li><i class="fa fa-flask"></i>30 Tests and Treatments</li>
										<li><i class="fa fa-star"></i>6 Specialties</li>
										<li><i class="fa fa-heart"></i>24h Assistance</li>
									</ul>
									<div class="summary">Aliquam euismod erat libero, eu condimentum nisl hendrerit vel. Ut sit amet congue lectus.</div>
									
								</div><!--
								--><div class="col col-4">
									<div class="head"><span>DOCTOR</span>Find Doctor and get there reviews/Rating</div>
									
									<ul class="listing">
										<li><i class="fa fa-clock-o"></i>1 Time a Year</li>
										<li><i class="fa fa-flask"></i>30 Tests and Treatments</li>
										<li><i class="fa fa-star"></i>6 Specialties</li>
										<li><i class="fa fa-heart"></i>24h Assistance</li>
									</ul>
									<div class="summary">Aliquam euismod erat libero, eu condimentum nisl hendrerit vel. Ut sit amet congue lectus.</div>
									
								</div><!--
								--><div class="col col-4">
									<div class="head"><span>HOSPITALS</span>Find Hospital and get there others feedbacks</div>
									
									<ul class="listing">
										<li><i class="fa fa-clock-o"></i>1 Time a Year</li>
										<li><i class="fa fa-flask"></i>30 Tests and Treatments</li>
										<li><i class="fa fa-star"></i>6 Specialties</li>
										<li><i class="fa fa-heart"></i>24h Assistance</li>
									</ul>
									<div class="summary">Aliquam euismod erat libero, eu condimentum nisl hendrerit vel. Ut sit amet congue lectus.</div>
									
								</div>
							</div>
						</div>
			<div class="vc_span6">

				<div class="wpb_tabs wpb_content_element">
					<div
						class="wpb_tour_tabs_wrapper clearfix ui-tabs ui-widget ui-widget-content ui-corner-all">
						<ul
							class="wpb_tabs_nav clearfix ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all"
							role="tablist">
							<li role="tab" aria-selected="true"
								class="ui-state-default ui-corner-top ui-tabs-active ui-state-active"
								tabindex="0" aria-controls="tab-1" aria-labelledby="ui-id-1"><a
								href="#tab-1" class="ui-tabs-anchor" role="presentation"
								tabindex="-1" id="ui-id-1"><i class="fa fa-clipboard"></i> Health Care Arcticles</a></li>
							<li role="tab" class="ui-state-default ui-corner-top"
								tabindex="-1" aria-controls="tab-2" aria-labelledby="ui-id-2"
								aria-selected="false"><a href="#tab-2"
								class="ui-tabs-anchor" role="presentation" tabindex="-1"
								id="ui-id-2"><i class="fa fa-user-md"></i> FIND A DOCTOR</a></li>
							<li role="tab" class="ui-state-default ui-corner-top"
								tabindex="-1" aria-controls="tab-3" aria-labelledby="ui-id-3"
								aria-selected="false"><a href="#tab-3"
								class="ui-tabs-anchor" role="presentation" tabindex="-1"
								id="ui-id-3"><i class="fa fa-instagram"></i> FIND A HOSPITAL</a></li>
						</ul>
						<div id="tab-1"
							class="wpb_tab ui-tabs-panel ui-widget-content ui-corner-bottom"
							aria-labelledby="ui-id-1" role="tabpanel" aria-expanded="true"
							aria-hidden="false" style="display: block;">
							<div class="wpb_text_column wpb_content_element">
								<form id="quick-search"
									class="quick-search quick-search-visible">
									<fieldset>


										<input type="text" placeholder="Search by name"> <select>
											<option value="0">Search By</option>
											<option value="0">Hospital</option>
											<option value="1">Corporate</option>
											<option value="2">Doctor</option>

										</select> <select>
											<option value="0">Locations</option>
											<option value="1">Delhi NCR</option>
											<option value="2">Bangalore</option>
											<option value="3">Pune</option>
											<option value="4">Hyderabad</option>
											<option value="5">Chennai</option>
										</select>

										<button type="submit" style="margin-right: 149px;">Search</button>

									</fieldset>
								</form>
							</div>
						</div>
						<div id="tab-2"
							class="wpb_tab ui-tabs-panel ui-widget-content ui-corner-bottom"
							aria-labelledby="ui-id-2" role="tabpanel" aria-expanded="false"
							aria-hidden="true" style="display: none;">
							<div class="wpb_text_column wpb_content_element">
								<form id="quick-search"
									class="quick-search quick-search-visible">
									<fieldset>


										<input type="text" placeholder="Search by name"> <select>
											<option value="0">Search By</option>
											<option value="0">Hospital</option>
											<option value="1">Corporate</option>
											<option value="2">Doctor</option>

										</select> <select>
											<option value="0">Locations</option>
											<option value="1">Delhi NCR</option>
											<option value="2">Bangalore</option>
											<option value="3">Pune</option>
											<option value="4">Hyderabad</option>
											<option value="5">Chennai</option>
										</select>

										<button type="submit" style="margin-right: 149px;">Search</button>

									</fieldset>
								</form>
							</div>
						</div>
						<div id="tab-3"
							class="wpb_tab ui-tabs-panel ui-widget-content ui-corner-bottom"
							aria-labelledby="ui-id-3" role="tabpanel" aria-expanded="false"
							aria-hidden="true" style="display: none;">
							<div class="wpb_text_column wpb_content_element">
								<form id="quick-search"
									class="quick-search quick-search-visible">
									<fieldset>


										<input type="text" placeholder="Search by name"> <select>
											<option value="0">Search By</option>
											<option value="0">Hospital</option>
											<option value="1">Corporate</option>
											<option value="2">Doctor</option>

										</select> <select>
											<option value="0">Locations</option>
											<option value="1">Delhi NCR</option>
											<option value="2">Bangalore</option>
											<option value="3">Pune</option>
											<option value="4">Hyderabad</option>
											<option value="5">Chennai</option>
										</select>

										<button type="submit" style="margin-right: 149px;">Search</button>

									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="grid-row">

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

			<div class="wpb_row vc_row-fluid">
				<div class="vc_span12 wpb_column column_container">
					<div class="wpb_wrapper">
						<div
							class="wpb_text_column wpb_content_element section-headers inline">
							<div class="wpb_wrapper">
								<h1>schedule</h1>
								manager
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="animating-block-3" class="animating-block">
				<img
					src="${pageContext.request.contextPath}/static/pic/page-retina-ready/3/mac.png"
					alt="">
			</div>

			<div class="grid-row-sep"></div>

			<div class="wpb_row vc_row-fluid">
				<div class="vc_span12 wpb_column column_container">
					<div class="wpb_wrapper">
						<div
							class="wpb_text_column wpb_content_element section-headers inline">
							<div class="wpb_wrapper">
								<h1>EXTENSIVE</h1>
								STYLE OPTIONS
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

			<div class="wpb_row vc_row-fluid">
				<div class="vc_span12 wpb_column column_container">
					<div class="wpb_wrapper">
						<div
							class="wpb_text_column wpb_content_element section-headers inline">
							<div class="wpb_wrapper">
								<h1>OVER 200 ICONS</h1>
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

			<div id="animating-block-5" class="animating-block">

				<div class="wpb_row vc_row-fluid">
					<div class="vc_span12 wpb_column column_container">
						<div class="wpb_wrapper">
							<img
								src="${pageContext.request.contextPath}/static/pic/page-retina-ready/5/icons-group.png"
								alt="">
						</div>
					</div>
				</div>

				<div class="wpb_row vc_row-fluid">
					<div class="vc_span12 wpb_column column_container">
						<div class="wpb_wrapper">
							<a class="pic"> <i class="fa fa-leaf"> </i>
							</a> <a class="pic"> <i class="fa fa-ambulance"> </i>
							</a> <a class="pic"> <i class="fa fa-plus-square"> </i>
							</a> <a class="pic"> <i class="fa fa-stethoscope"> </i>
							</a> <a class="pic"> <i class="fa fa-hospital-o"> </i>
							</a> <a class="pic"> <i class="fa fa-user-md"> </i>
							</a> <a class="pic"> <i class="fa fa-medkit"> </i>
							</a> <a class="pic"> <i class="fa fa-wheelchair"> </i>
							</a>
						</div>
					</div>
				</div>

				<div class="wpb_row vc_row-fluid">
					<div class="vc_span12 wpb_column column_container">
						<div class="wpb_wrapper">
							<a href="#" class="soc-icon soc-icon-dark fa fa-facebook"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-google-plus"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-twitter"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-dribbble"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-linux"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-dropbox"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-btc"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-bitbucket-square"></a>
							<a href="#" class="soc-icon soc-icon-dark fa fa-html5"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-weibo"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-youtube"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-android"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-instagram"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-windows"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-apple"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-skype"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-tumblr"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-vimeo-square"></a>
							<a href="#" class="soc-icon soc-icon-dark fa fa-facebook"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-google-plus"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-css3"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-vk"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-xing-square"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-flickr"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-bitcoin"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-clipboard"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-usd"></a> <a
								href="#" class="soc-icon soc-icon-dark fa fa-eur"></a>
						</div>
					</div>
				</div>

				<div class="wpb_row vc_row-fluid">
					<div class="vc_span12 wpb_column column_container">
						<div class="wpb_wrapper">
							<a href="#" class="soc-icon fa fa-facebook"></a> <a href="#"
								class="soc-icon fa fa-google-plus"></a> <a href="#"
								class="soc-icon fa fa-twitter"></a> <a href="#"
								class="soc-icon fa fa-dribbble"></a> <a href="#"
								class="soc-icon fa fa-linux"></a> <a href="#"
								class="soc-icon fa fa-dropbox"></a> <a href="#"
								class="soc-icon fa fa-btc"></a> <a href="#"
								class="soc-icon fa fa-bitbucket-square"></a> <a href="#"
								class="soc-icon fa fa-html5"></a> <a href="#"
								class="soc-icon fa fa-weibo"></a> <a href="#"
								class="soc-icon fa fa-youtube"></a> <a href="#"
								class="soc-icon fa fa-android"></a> <a href="#"
								class="soc-icon fa fa-instagram"></a> <a href="#"
								class="soc-icon fa fa-windows"></a> <a href="#"
								class="soc-icon fa fa-apple"></a> <a href="#"
								class="soc-icon fa fa-skype"></a> <a href="#"
								class="soc-icon fa fa-tumblr"></a> <a href="#"
								class="soc-icon fa fa-vimeo-square"></a> <a href="#"
								class="soc-icon fa fa-facebook"></a> <a href="#"
								class="soc-icon fa fa-google-plus"></a> <a href="#"
								class="soc-icon fa fa-css3"></a> <a href="#"
								class="soc-icon fa fa-vk"></a> <a href="#"
								class="soc-icon fa fa-xing-square"></a> <a href="#"
								class="soc-icon fa fa-flickr"></a> <a href="#"
								class="soc-icon fa fa-bitcoin"></a> <a href="#"
								class="soc-icon fa fa-clipboard"></a> <a href="#"
								class="soc-icon fa fa-usd"></a> <a href="#"
								class="soc-icon fa fa-eur"></a>
						</div>
					</div>
				</div>

			</div>

			<div class="grid-row-sep"></div>

			<div class="wpb_row vc_row-fluid">
				<div class="vc_span12 wpb_column column_container">
					<div class="wpb_wrapper">
						<div
							class="wpb_text_column wpb_content_element section-headers inline">
							<div class="wpb_wrapper">
								<h1>ADVANCED and flexible</h1>
								LAYOUT OPTIONS
							</div>
						</div>
						<div class="wpb_text_column wpb_content_element section-text">
							<div class="wpb_wrapper">
								<b>Clinico</b> gives you the opportunity to change layout
								settings for your website as a whole and for each individual
								page in particular. You can easily create unlimited number of
								Sidebars and fill them with various Widgets to achieve your
								wildest dreams.

							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="animating-block-7" class="animating-block">
				<img
					src="${pageContext.request.contextPath}/static/pic/page-retina-ready/7/one-page.png"
					alt="">
			</div>

			<div class="grid-row-sep"></div>

			<div class="wpb_row vc_row-fluid">
				<div class="vc_span12 wpb_column column_container">
					<div class="wpb_wrapper">
						<div
							class="wpb_text_column wpb_content_element section-headers inline">
							<div class="wpb_wrapper">
								<h1>layer slider</h1>
								included
							</div>
						</div>
						<div class="wpb_text_column wpb_content_element section-text">
							<div class="wpb_wrapper">
								<p>LayerSlider is a premium multi-purpose slider for
									creating image galleries, content sliders, and mind-blowing
									slideshows with must-see effects. It uses cutting edge
									technologies to provide the smoothest experience thats
									possible, and it comes with more than 200 preset 2D and 3D
									slide transitions. Its device friendly by supporting responsive
									mode, multiple layouts, touch gestures on mobile devices, and
									uses techniques like lazy load for optimal performance. You can
									add any content, including images, text, custom HTML, YouTube
									and Vimeo videos or HTML5 self-hosted multimedia contents. Its
									also SEO friendly by allowing you to build semantic markup with
									custom attributes that search engines can index easily.
									LayerSlider comes with 13 built-in skins, and it has tons of
									options to entirely customize the appearance and behaviour of
									your sliders at the smallest detail.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="animating-block-8" class="animating-block">
				<img
					src="${pageContext.request.contextPath}/static/pic/LayerSlider5.png"
					alt="">
			</div>

		</div>
		</main>
		<!-- including footer -->
		<%@ include file="footer.html"%>
	</div>
</body>
</html>