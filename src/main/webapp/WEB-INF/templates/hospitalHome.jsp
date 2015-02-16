<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<body>
	<div class="page">
		<!-- including header -->
		<%@ include file="searchTitle.html"%>
		<!-- page content -->
		<main class="page-content">
		<div class="grid-row">
			<div class="grid-col grid-col-9" style="width: 100%;">
				<nav class="bread-crumbs">
					<a href="/smo">Home</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp; <a
						href="features-accordion.html">Styled Content Items</a>&nbsp;&nbsp;<i
						class="fa fa-angle-right"></i>&nbsp; <a href="#">Twitter
						Carousel Element</a>
				</nav>
				<section class="detailed-services wpb_content_element"
					style="margin-bottom: 15px;">
					<dl>
						<dd style="display: block;">
							<div class="details">
								<div class="clearfix">
									<img
										src="${pageContext.request.contextPath}/static/images/profile/${userAsHospital.username}/${userAsHospital.profilePicture}"
										width="150" height="170" alt="">

									<div class="widget-title">
										<span style="text-transform: capitalize">${fn:toLowerCase(hospitalObject.name
											)}</span>
									</div>
									<div>
										<a><i class="fa fa-facebook" style="margin-right: 10px;"></i></a><a><i
											class="fa fa-twitter" style="margin-right: 10px;"></i></a><a><i
											class="fa fa-linkedin" style="margin-right: 10px;"></i></a> <a><i
											class="fa fa-google-plus" style="margin-right: 10px;"></i></a>
									</div>
									<ul>

										<li><i class="fa fa-user" style="margin-right: 5px;"></i>Patient
											Experience</li>
										<span class="star-rating star-rating-empty"> <span
											class="stars"> <c:choose>
													<c:when test="${relatedDoctorReview[hospitalObject.id] == 5}">
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
													</c:when>
													<c:when test="${relatedDoctorReview[hospitalObject.id] == 4}">
														<span class="star"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
													</c:when>
													<c:when test="${relatedDoctorReview[hospitalObject.id] == 3}">
														<span class="star"></span>
														<span class="star "></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
													</c:when>
													<c:when test="${relatedDoctorReview[hospitalObject.id] == 2}">
														<span class="star"></span>
														<span class="star "></span>
														<span class="star "></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
													</c:when>
													<c:when test="${relatedDoctorReview[hospitalObject.id] == 1}">
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
											<a><c:if test="${countMap[hospitalObject.id]==null}">0</c:if>${countMap[hospitalObject.id]} reviews</a>
										</div>
										<li><a style="font-size: 25px;"><i
												class="fa fa-thumbs-up"
												style="color: #96bf2d; font-size: 25px;"></i>
												<c:if test="${recommendationMap[hospitalObject.id]==null}">0</c:if>${recommendationMap[hospitalObject.id]}</a>Recommendations</li>
										<li><a style="font-size: 15px;"><i
												class="fa fa-pencil"></i> Write a Review</a></li>
									</ul>
									<ul style="width: 200px;">
										<li><i class="fa fa-hospital-o"
											style="margin-right: 5px;"></i>Address</li>
										<li>${hospitalObject.contact.address}</li>
										<li>${hospitalObject.contact.city} ,
											${entry.contact.state} (${hospitalObject.contact.country})</li>

									</ul>
									<ul style="width: 150px;">
										<li><i class="fa fa-phone" style="margin-right: 5px;"></i>Contact</li>

										<li><c:forEach
												items="${hospitalObject.phone.enquiryPhoneNo}" var="enqury">${enqury } , </c:forEach></li>
										<li><c:forEach
												items="${hospitalObject.phone.appointmentPhoneNo}"
												var="enqury">${enqury } , </c:forEach></li>
										<li><c:forEach
												items="${hospitalObject.phone.emergencyPhoneNo}"
												var="enqury">${enqury } , </c:forEach></li>

									</ul>

									<ul style="">
										<li><i class="fa fa-location-arrow"
											style="margin-right: 5px;"></i></li>
										<li><i class="fa fa-male" style="margin-right: 5px;"></i>
											${doc.gender }</li>

										<li><i class="fa fa-map-marker"
											style="margin-right: 5px;"></i> <a>View Map</a></li>
										<li><i class="fa fa-external-link"
											style="margin-right: 5px;"></i> <a>${hospitalObject.websiteUrl
												}</a></li>
									</ul>
								</div>
							</div>

						</dd>
					</dl>
				</section>
			</div>
			<div class="grid-col grid-col-9" style="margin-left: 0px;">
				<!-- tabs -->
				<div class="vc_row-fluid">
					<div class="vc_span12">
						<div class="wpb_tabs wpb_content_element" style="border: none">
							<div class="wpb_tour_tabs_wrapper clearfix" style="border: none">
								<ul class="wpb_tabs_nav clearfix" role="tablist" style="border: none">

									<li role="tab" aria-selected="true"><a href="#tab-1">About
									</a></li>
									<li role="tab"><a href="#tab-2">Specialties</a></li>
									<li role="tab"><a href="#tab-3">Doctors</a></li>
									<li role="tab"><a href="#tab-5">Patient Reviews</a></li>
									<li role="tab"><a href="#tab-7">Social media</a></li>
								</ul>
								<div id="tab-1" class="wpb_tab" style="border: none">
									<div class="wpb_text_column wpb_content_element">
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;">
											<b>About ${hospitalObject.name }</b>
										</div>
										<div>${hospitalObject.aboutUs }</div>
										<div class="vc_text_separator"></div>
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;">
											<b>${hospitalObject.name } 's Services</b>
										</div>
										<div>

											<c:forEach items="${hospitalObject.services }" var="spe"
												step="2" varStatus="count">
												<div class="vc_row-fluid" style="margin-bottom: 15px;">
													<!-- 1/2 column -->
													<div class="vc_span6">
														<ul style="margin-top: 5px;">
															<li><i class="fa fa-check"
																style="margin-right: 5px; color: #008fd5;"></i>${spe}</li>
														</ul>
													</div>
													<div class="vc_span6">
														<ul style="margin-top: 5px;">
															<li><i class="fa fa-check"
																style="margin-right: 5px; color: #008fd5;"></i>${hospitalObject.services[count.index+1]}
															</li>
														</ul>
													</div>
												</div>

											</c:forEach>
										</div>
										<div class="vc_text_separator"></div>
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;">
											<b>${hospitalObject.name } 's Awards & Recognitions</b>
										</div>

										<c:forEach items="${hospitalObject.awards }" var="award"
											step="2" varStatus="count">
											<div class="vc_row-fluid">
												<!-- 1/2 column -->
												<div class="vc_span6">
													<ul style="margin-top: 5px;">
														<li style="color: #008fd5;"><b>${award.awardName}</b></li>
														<li style="margin-top: 0px;">${award.details}</li>
														<li style="margin-top: 0px;">${award.date}</li>
													</ul>
												</div>
												<div class="vc_span6">
													<ul style="margin-top: 5px;">
														<li style="color: #008fd5;"><b>${hospitalObject.awards[count.index+1].awardName}</b></li>
														<li style="margin-top: 0px;">${hospitalObject.awards[count.index+1].details}</li>
														<li style="margin-top: 0px;">${hospitalObject.awards[count.index+1].date}
														</li>
													</ul>
												</div>
											</div>

										</c:forEach>
										<div class="vc_text_separator"></div>
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;text-transform: capitalize;">
											<b>Languages Spoken by Doctors at ${fn:toLowerCase(hospitalObject.name
											)} & Staff</b>
										</div>
										<ul style="margin-top: 5px;">
											<li>English</li>
											<li style="margin-top: 0px;">Hindi</li>
											<li style="margin-top: 0px;">Urdu</li>
										</ul>
										<div class="vc_text_separator"></div>
									</div>
								</div>
								<div id="tab-2" class="wpb_tab" style="border: none">
									<div class="wpb_text_column wpb_content_element">

										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;">
											<b>${hospitalObject.name } 's Specialties</b>
										</div>
										<div>
											<c:forEach items="${hospitalObject.specilities }" var="spe"
												step="2" varStatus="count">
												<div class="vc_row-fluid" style="margin-bottom: 15px;">
													<!-- 1/2 column -->
													<div class="vc_span6">
														<ul style="margin-top: 5px;">
															<li><i class="fa fa-check"
																style="margin-right: 5px; color: #008fd5;"></i>${spe}</li>
														</ul>
													</div>
													<div class="vc_span6">
														<ul style="margin-top: 5px;">
															<li><i class="fa fa-check"
																style="margin-right: 5px; color: #008fd5;"></i>${hospitalObject.specilities[count.index+1]}
															</li>
														</ul>
													</div>
												</div>

											</c:forEach>

										</div>

										<div class="vc_text_separator"></div>
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;">
											<b>Procedures ${hospitalObject.name} Performs</b>
										</div>
										<c:forEach items="${hospitalObject.procedures }" var="spe"
											step="2" varStatus="count">
											<div class="vc_row-fluid" style="margin-bottom: 15px;">
												<!-- 1/2 column -->
												<div class="vc_span6">
													<ul style="margin-top: 5px;">
														<li><i class="fa fa-check"
															style="margin-right: 5px; color: #008fd5;"></i>${spe}</li>
													</ul>
												</div>
												<div class="vc_span6">
													<ul style="margin-top: 5px;">
														<li><i class="fa fa-check"
															style="margin-right: 5px; color: #008fd5;"></i>${hospitalObject.procedures[count.index+1]}
														</li>
													</ul>
												</div>
											</div>

										</c:forEach>
										<div class="vc_text_separator"></div>
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;">
											<b>Conditions ${hospitalObject.name} Treats</b>
										</div>
										<c:forEach items="${hospitalObject.condition }" var="spe"
											step="2" varStatus="count">
											<div class="vc_row-fluid" style="margin-bottom: 15px;">
												<!-- 1/2 column -->
												<div class="vc_span6">
													<ul style="margin-top: 5px;">
														<li><i class="fa fa-check"
															style="margin-right: 5px; color: #008fd5;"></i>${spe}</li>
													</ul>
												</div>
												<div class="vc_span6">
													<ul style="margin-top: 5px;">
														<li><i class="fa fa-check"
															style="margin-right: 5px; color: #008fd5;"></i>${hospitalObject.condition[count.index+1]}
														</li>
													</ul>
												</div>
											</div>

										</c:forEach>
										<div class="vc_text_separator"></div>
									</div>
								</div>
								<div id="tab-3" class="wpb_tab" style="border: none">
									<div class="wpb_text_column wpb_content_element">
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;text-transform: capitalize;">
											<b> ${fn:toLowerCase(hospitalObject.name
											)} Practice Information</b>
										</div>
									</div>
								</div>

								<div id="tab-5" class="wpb_tab" style="border: none">
									<div class="wpb_text_column wpb_content_element">
										<div style="font-size: 25px; color: #993300;">
											<b>How was your experience with <span style="text-transform: capitalize;"> ${fn:toLowerCase(hospitalObject.name
											)} </span> ?</b>
										</div>
										<div style="font-size: 20px;">Help other patients, and
											let the doctor know how he's doing</div>
										<div>
											<b>Your participation is kept confidential.</b> <span style="text-transform: capitalize;"> ${fn:toLowerCase(hospitalObject.name
											)}</span> and
											his staff will not know that you took the survey or the
											identity of any survey participants. By completing the
											survey, you acknowledge that you or a family member is or has
											been a patient of the provider. Learn more in our<a>
												Privacy Policy</a>.
										</div>
										<div class="vc_text_separator"></div>
										<form:form method="post" modelAttribute="addReview"
											action="addHospitalReivew">
											<div class="input">
												<label>Your email:</label> <input type="email"
													name="reviewerEmail"> <input type="hidden"
													name="cleanliness" id="cleanliness"><input
													type="hidden" name="userName" value="${hospitalObject.id}"> <input
													type="hidden" name="facilities"
													id="facilities"> <input type="hidden"
													name="services" id="services"> <input
													type="hidden" name="value"
													id="value">
											</div>
											<section class="widget" style="padding-top: 20px;">
												<div class="wpb_row vc_row-fluid">
													<div class="vc_span4 wpb_column column_container">
														<div class="wpb_wrapper">
															<div class="wpb_text_column wpb_content_element">
																<div class="wpb_wrapper">
																	<ul class="ul1">
																		<li
																			style="line-height: 50px; border: 1px solid #e3e3e3; text-align: center;">
																			<div>Cleanliness</div> <i
																			class="fa fa-user"
																			style="margin-right: 5px; font-size: 25px;"></i><span
																			class="star-rating star-rating-empty"> <span
																				class="stars" id="star-staff-collection"> <a><span
																						class="star star-staff" id="star-staff-4"
																						data-value="5"></span></a> <a> <span
																						class="star star-staff" id="star-staff-3"
																						data-value="4"></span></a> <a> <span
																						class="star star-staff" id="star-staff-2"
																						data-value="3"></span></a> <a> <span
																						class="star star-staff" id="star-staff-1"
																						data-value="2"></span></a> <a> <span
																						class="star star-staff" id="star-staff-0"
																						data-value="1"></span></a>
																			</span>
																		</span>
																		</li>
																		<li
																			style="line-height: 50px; border: 1px solid #e3e3e3; text-align: center;">
																			<div>Facilities</div> <i
																			class="fa fa-lightbulb-o"
																			style="margin-right: 5px; font-size: 25px;"></i><span
																			class="star-rating star-rating-empty"> <span
																				class="stars" id="star-knowledge-collection">
																					<a><span class="star star-knowledge"
																						id="star-knowledge-4" data-value="5"></span></a> <a>
																						<span class="star star-knowledge"
																						id="star-knowledge-3" data-value="4"></span>
																				</a> <a> <span class="star star-knowledge"
																						id="star-knowledge-2" data-value="3"></span></a> <a>
																						<span class="star star-knowledge"
																						id="star-knowledge-1" data-value="2"></span>
																				</a> <a> <span class="star star-knowledge"
																						id="star-knowledge-0" data-value="1"></span></a>
																			</span>
																		</span>
																		</li>
																	</ul>
																</div>
															</div>
														</div>
													</div>
													<div class="vc_span4 wpb_column column_container">
														<div class="wpb_wrapper">
															<div class="wpb_text_column wpb_content_element">
																<div class="wpb_wrapper">
																	<ul class="ul1">
																		<li
																			style="line-height: 50px; border: 1px solid #e3e3e3; text-align: center;">
																			<div>Services</div> <i
																			class="fa fa-question-circle"
																			style="margin-right: 5px; font-size: 25px;"></i><span
																			class="star-rating star-rating-empty"> <span
																				class="stars" id="star-help-collection"> <a><span
																						class="star star-help" id="star-help-4"
																						data-value="5"></span></a> <a> <span
																						class="star star-help" id="star-help-3"
																						data-value="4"></span></a> <a> <span
																						class="star star-help" id="star-help-2"
																						data-value="3"></span></a> <a> <span
																						class="star star-help" id="star-help-1"
																						data-value="2"></span></a> <a> <span
																						class="star star-help" id="star-help-0"
																						data-value="1"></span></a>
																			</span>
																		</span>
																		</li>
																		<li
																			style="line-height: 50px; border: 1px solid #e3e3e3; text-align: center;">
																			<div>Value</div> <i
																			class="fa fa-clock-o"
																			style="margin-right: 5px; font-size: 25px;"></i><span
																			class="star-rating star-rating-empty"> <span
																				class="stars" id="star-punctuality-collection">
																					<a><span class="star star-punctuality"
																						id="star-punctuality-4" data-value="5"></span></a> <a>
																						<span class="star star-punctuality"
																						id="star-punctuality-3" data-value="4"></span>
																				</a> <a> <span class="star star-punctuality"
																						id="star-punctuality-2" data-value="3"></span></a> <a>
																						<span class="star star-punctuality"
																						id="star-punctuality-1" data-value="2"></span>
																				</a> <a> <span class="star star-punctuality"
																						id="star-punctuality-0" data-value="1"></span></a>
																			</span>
																		</span>
																		</li>
																	</ul>
																</div>
															</div>
														</div>
													</div>

												</div>
											</section>
											<a style="font-size: 25px;" onclick="recommeddoctor();"><i
												class="fa fa-thumbs-up"
												style="color: #96bf2d; font-size: 25px;"></i>Recommend</a>
											<input type="hidden" id="recommend" name="recommend"
												value="0">
											<label>Comment:</label>
											<textarea rows="2" name="reviewerComment"></textarea>
											<button class="button" value="Submit">Submit Review</button>
										</form:form>
										<div style="font-size: 25px; margin-top: 10px;text-transform: capitalize;">
											<b>${fn:toLowerCase(hospitalObject.name
											)} Review(s)</b>
										</div>
										<div class="vc_text_separator"></div>
										<c:forEach items="${allReview }" var="review">
											<div class="vc_row-fluid" style="margin-bottom: 25px;">
												<!-- 1/4 column -->
												<div class="vc_span3">
													<div class="wpb_text_column">
														<h1>Cleanliness</h1>
														<span class="star-rating star-rating-empty"> <span
															class="stars"> <c:choose>
																	<c:when test="${review.cleanliness == 5}">
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.cleanliness == 4}">
																		<span class="star"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.cleanliness == 3}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.cleanliness == 2}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.cleanliness == 1}">
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
													</div>
												</div>
												<!--/ 1/4 column -->
												<!-- 1/4 column -->
												<div class="vc_span3">
													<div class="wpb_text_column">
														<h1>Facilities</h1>
														<span class="star-rating star-rating-empty"> <span
															class="stars"> <c:choose>
																	<c:when test="${review.facilities == 5}">
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.facilities == 4}">
																		<span class="star"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.facilities == 3}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.facilities == 2}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.facilities == 1}">
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
													</div>
												</div>
												<!--/ 1/4 column -->
												<!-- 1/4 column -->
												<div class="vc_span3">
													<div class="wpb_text_column">
														<h1>Services</h1>
														<span class="star-rating star-rating-empty"> <span
															class="stars"><c:choose>
																	<c:when test="${review.services == 5}">
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.services == 4}">
																		<span class="star"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.services == 3}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.services == 2}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.services == 1}">
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
																</c:choose> </span>
														</span>
													</div>
												</div>
												<!--/ 1/4 column -->
												<!-- 1/4 column -->
												<div class="vc_span3">
													<div class="wpb_text_column">
														<h1>Value</h1>
														<span class="star-rating star-rating-empty"> <span
															class="stars"> <c:choose>
																	<c:when test="${review.value == 5}">
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.value == 4}">
																		<span class="star"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.value == 3}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.value == 2}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.value == 1}">
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
													</div>
												</div>
												<!--/ 1/4 column -->
											</div>
											<div class="vc_row-fluid" style="margin-bottom: 25px;">
												<!-- Full width column -->
												<div class="vc_span12">
													<div class="wpb_text_column">
														<h1>Comment</h1>
														${review.reviewerComment }

													</div>
												</div>
												<!--/ Full width column -->
											</div>
											<div class="vc_text_separator"></div>
										</c:forEach>
										<a href="#" data-template="news-three" data-page="2"
											class="button more"><i class="fa fa-refresh"></i>Load
											more</a>
									</div>
								</div>
								<div id="tab-7" class="wpb_tab" style="border: none">
									<div class="wpb_text_column wpb_content_element">
										<div class="grid-col grid-col-4">
											<!-- categories -->
											<!-- help -->
											<section class="widget widget-comments">
												<div class="widget-title" style="margin-bottom: 25px;">Facebook</div>
												<div id="facebook-carousel" class="owl-carousel"></div>
											</section>
											<!--/ help -->

											<!--/ categories -->
										</div>

										<div class="grid-col grid-col-4">
											<!-- categories -->
											<!-- help -->
											<section class="widget widget-comments">
												<div class="widget-title" style="margin-bottom: 25px;">Twitter</div>
												<div id="twitter-carousel" class="owl-carousel"></div>
											</section>
											<!--/ help -->

											<!--/ categories -->
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="grid-col grid-col-3">
				<!-- comments -->
				<section class="widget widget-comments">
					<div class="widget-title" style="margin-bottom: 15px;">Find
						the Right Hospital For You.</div>
					<div id="comments-carousel" class="owl-carousel">
						<c:if test="${relatedHospital1!=null }">
							<div class="item">
								<ul>
									<c:forEach var="relateddoc" items="${relatedHospital1 }">
										<li><img src="pic/doctor-1.jpg" alt="">
											<div class="author">
												<a
													href="${pageContext.request.contextPath}/hospital/${relateddoc.id}">${relateddoc.name
													} </a>
											</div> <span class="star-rating star-rating-empty"> <span
												class="stars"> <c:choose>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 5}">
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 4}">
															<span class="star"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 3}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 2}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star "></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 1}">
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
											<p>
												<c:if test="${countMap[relateddoc.id]==null}">0</c:if>${countMap[relateddoc.id]} reviews<br>
												<c:forEach items="${relateddoc.specilities }"
													var="docSpecility">
													<a>${specilityMap[docSpecility]}</a>,
										</c:forEach><br> 
											</p></li>

									</c:forEach>


								</ul>
							</div>

						</c:if>
						<c:if test="${relatedHospital2!=null }">
							<div class="item">
								<ul>
									<c:forEach var="relateddoc" items="${relatedHospital2 }">
										<li><img src="pic/doctor-1.jpg" alt="">
											<div class="author">
												<a
													href="${pageContext.request.contextPath}/hospital/${relateddoc.id}">${relateddoc.fname
													} ${relateddoc.lname }</a>
											</div> <span class="star-rating star-rating-empty"> <span
												class="stars"> <c:choose>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 5}">
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 4}">
															<span class="star"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 3}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 2}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star "></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 1}">
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
											<p>
												<c:if test="${countMap[relateddoc.id]==null}">0</c:if>${countMap[relateddoc.id]} reviews<br>
												<c:forEach items="${relateddoc.specilities }"
													var="docSpecility">
													<a>${specilityMap[docSpecility]}</a>,
										</c:forEach><br> 
											</p></li>

									</c:forEach>


								</ul>
							</div>

						</c:if>


						<c:if test="${relatedHospital3!=null }">
							<div class="item">
								<ul>
									<c:forEach var="relateddoc" items="${relatedHospital3 }">
										<li><img src="pic/doctor-1.jpg" alt="">
											<div class="author">
												<a
													href="${pageContext.request.contextPath}/hospital/${relateddoc.id}">${relateddoc.fname
													} ${relateddoc.lname }</a>
											</div> <span class="star-rating star-rating-empty"> <span
												class="stars"> <c:choose>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 5}">
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 4}">
															<span class="star"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 3}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 2}">
															<span class="star"></span>
															<span class="star "></span>
															<span class="star "></span>
															<span class="star selected"></span>
															<span class="star selected"></span>
														</c:when>
														<c:when test="${relatedDoctorReview[relateddoc.id] == 1}">
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
											<p>
												<c:if test="${countMap[relateddoc.id]==null}">0</c:if>${countMap[relateddoc.id]} reviews<br>
												<c:forEach items="${relateddoc.specilities }"
													var="docSpecility">
													<a>${specilityMap[docSpecility]}</a>,
										</c:forEach>
											</p></li>

									</c:forEach>


								</ul>
							</div>

						</c:if>


					</div>
				</section>
			</div>
		</div>
		</main>
		<!-- including footer -->
		<%@ include file="footer.html"%></div>
</body>
<script>
	var starStaff = 0;
	var starKnowledge = 0;
	var starHelp = 0;
	var starPunctuality = 0;

	$("#star-punctuality-collection").on('mouseout', function() {
		$(".star-punctuality").each(function() {
			$(this).removeClass("selected");
		});
		for ( var i = 0; i < starPunctuality; i++) {
			$('#star-punctuality-' + i).addClass('selected');
		}
		$('#value').val(starPunctuality);

	});
	$(".star-punctuality").on('mouseover', function() {
		var selected = $(this).attr('data-value');

		for ( var i = 0; i < selected; i++) {
			$('#star-punctuality-' + i).addClass('selected');
		}
		for ( var i = selected; i < $(".star-punctuality").length; i++) {
			$('#star-punctuality-' + i).removeClass('selected');
		}

	});
	$(".star-punctuality").on('click', function() {
		var selected = $(this).attr('data-value');
		starPunctuality = parseInt(selected);

	});

	//

	$("#star-help-collection").on('mouseout', function() {
		$(".star-help").each(function() {
			$(this).removeClass("selected");
		});
		for ( var i = 0; i < starHelp; i++) {
			$('#star-help-' + i).addClass('selected');
		}
		$('#services').val(starHelp);

	});
	$(".star-help").on('mouseover', function() {
		var selected = $(this).attr('data-value');

		for ( var i = 0; i < selected; i++) {
			$('#star-help-' + i).addClass('selected');
		}
		for ( var i = selected; i < $(".star-help").length; i++) {
			$('#star-help-' + i).removeClass('selected');
		}

	});
	$(".star-help").on('click', function() {
		var selected = $(this).attr('data-value');
		starHelp = parseInt(selected);

	});

	//

	$("#star-knowledge-collection").on('mouseout', function() {
		$(".star-knowledge").each(function() {
			$(this).removeClass("selected");
		});
		for ( var i = 0; i < starKnowledge; i++) {
			$('#star-knowledge-' + i).addClass('selected');
		}
		$('#facilities').val(starKnowledge);

	});
	$(".star-knowledge").on('mouseover', function() {
		var selected = $(this).attr('data-value');

		for ( var i = 0; i < selected; i++) {
			$('#star-knowledge-' + i).addClass('selected');
		}
		for ( var i = selected; i < $(".star-knowledge").length; i++) {
			$('#star-knowledge-' + i).removeClass('selected');
		}

	});
	$(".star-knowledge").on('click', function() {
		var selected = $(this).attr('data-value');
		starKnowledge = parseInt(selected);

	});

	//
	$("#star-staff-collection").on('mouseout', function() {
		$(".star-staff").each(function() {
			$(this).removeClass("selected");
		});
		for ( var i = 0; i < starStaff; i++) {
			$('#star-staff-' + i).addClass('selected');
		}
		$('#cleanliness').val(starStaff);

	});
	$(".star-staff").on('mouseover', function() {
		var selected = $(this).attr('data-value');

		for ( var i = 0; i < selected; i++) {
			$('#star-staff-' + i).addClass('selected');
		}
		for ( var i = selected; i < $(".star-staff").length; i++) {
			$('#star-staff-' + i).removeClass('selected');
		}

	});
	$(".star-staff").on('click', function() {
		var selected = $(this).attr('data-value');
		starStaff = parseInt(selected);

	});
	$(document)
			.ready(
					function() {

						$
								.ajax({
									url : "/smo/twiter/KatrinaKaif_",
									success : function(output) {
										var result = JSON.parse(output);
										for (i = 0; i < result.length; i++) {
											var twitter = '<div class="item">'
													+ '<ul>'
													+ '<li><a href="'+result[i].url+'"><img src="'+
						result[i].mediaURL+
						'" alt="'+result[i].feed+'"></a>'
													+ '<p>'
													+ '<span class="author">'
													+ result[i].user
													+ '</span><br>'
													+ result[i].feed
													+ '</p><span class="date">'
													+ result[i].createdDate
													+ '</span></li>';
											i++;
											if (i < result.length) {
												twitter = twitter
														+ '<li><img src="'+
									result[i].mediaURL+
									'" alt="'+result[i].feed+'">'
														+ '<p>'
														+ '<span class="author">'
														+ result[i].user
														+ '</span><br>'
														+ result[i].feed
														+ '</p><span class="date">'
														+ result[i].createdDate
														+ '</span></li>';
											}

											twitter = twitter + '</ul></div>';
											var owl = $("#twitter-carousel");
											owl.data('owlCarousel').addItem(
													twitter);
										}
									}
								});

						$
								.ajax({
									url : "/smo/facebook/dellindia",
									success : function(output) {
										var result = JSON.parse(output);
										for (i = 0; i < result.length; i++) {
											var twitter = '<div class="item">'
													+ '<ul>'
													+ '<li><a href="'+result[i].url+'"><img src="'+
				result[i].mediaURL+
				'" alt="'+result[i].feed+'"></a>'
													+ '<p>'
													+ '<span class="author">'
													+ result[i].user
													+ '</span><br>'
													+ result[i].feed
													+ '</p><span class="date">'
													+ result[i].createdDate
													+ '</span></li>';
											i++;
											if (i < result.length) {
												twitter = twitter
														+ '<li><img src="'+
							result[i].mediaURL+
							'" alt="'+result[i].feed+'">'
														+ '<p>'
														+ '<span class="author">'
														+ result[i].user
														+ '</span><br>'
														+ result[i].feed
														+ '</p><span class="date">'
														+ result[i].createdDate
														+ '</span></li>';
											}

											twitter = twitter + '</ul></div>';
											var owl = $("#facebook-carousel");
											owl.data('owlCarousel').addItem(
													twitter);
										}
									}
								});

					});
function recommeddoctor(){
	var value=$('#recommend').val();
	if(value==1){
		$('#recommend').val(0);
	}else{
		$('#recommend').val(1);
	}
}
	
</script>