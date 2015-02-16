<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>${doc.fname} ${doc.lname}</title>
<meta name="language" content="en-us" />
<meta name="revist-after" content="1 days" />
<meta name="robots" content="index,follow" />
<meta name="author" content="http://www.freemedicalopinion.com">
<style>
.circle {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	font-size: 33px;
	color: #fff;
	line-height: 46px;
	text-align: center;
	background: #008fd5
}
</style>
<script>
	var time = new Object();
	time[10000] = "12:00 AM";
	time[10030] = "12:30 AM";
	time[10100] = "01:00 AM";
	time[10130] = "01:30 AM";
	time[10200] = "02:00 AM";
	time[10230] = "02:30 AM";
	time[10300] = "03:00 AM";
	time[10330] = "03:30 AM";
	time[10400] = "04:00 AM";
	time[10430] = "04:30 AM";
	time[10500] = "05:00 AM";
	time[10530] = "05:30 AM";
	time[10600] = "06:00 AM";
	time[10630] = "06:30 AM";
	time[10700] = "07:00 AM";
	time[10730] = "07:30 AM";
	time[10800] = "08:00 AM";
	time[10830] = "08:30 AM";
	time[10900] = "09:00 AM";
	time[10930] = "09:30 AM";
	time[11000] = "10:00 AM";
	time[11030] = "10:30 AM";
	time[11100] = "11:00 AM";
	time[11130] = "11:30 AM";
	time[20000] = "12:00 PM";
	time[20030] = "12:30 PM";
	time[20100] = "01:00 PM";
	time[20030] = "01:30 PM";
	time[20200] = "02:00 PM";
	time[20230] = "02:30 PM";
	time[20300] = "03:00 PM";
	time[20330] = "03:30 PM";
	time[20400] = "04:00 PM";
	time[20430] = "04:30 PM";
	time[20500] = "05:00 PM";
	time[20530] = "05:30 PM";
	time[20600] = "06:00 PM";
	time[20630] = "06:30 PM";
	time[20700] = "07:00 PM";
	time[20730] = "07:30 PM";
	time[20800] = "08:00 PM";
	time[20830] = "08:30 PM";
	time[20900] = "09:00 PM";
	time[20930] = "09:30 PM";
	time[21000] = "10:00 PM";
	time[21030] = "10:30 PM";
	time[21100] = "11:00 PM";
	time[21130] = "11:30 PM";
</script>
<!-- styles -->
</head>
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
										src="${pageContext.request.contextPath}/static/images/profile/${userByUserName.username}/${userByUserName.profilePicture}"
										width="150" height="170" alt="">

									<div class="widget-title">
										Dr. <span style="text-transform: capitalize">${fn:toLowerCase(doc.fname
											)}</span> <span style="text-transform: capitalize">${fn:toLowerCase(doc.lname
											)}</span>
									</div>
									<h1>

										<c:forEach items="${doc.specilities }" var="docSpecility">
											${specilityMap[docSpecility]},
										</c:forEach>
									</h1>
									<div>

										<c:if test="${doc.social!=null }">
											<c:if test="${doc.social.facebook!=null }">
												<a><i class="fa fa-facebook" style="margin-right: 10px;"></i></a>
											</c:if>
											<c:if test="${doc.social.twitter!=null }">
												<a><i class="fa fa-twitter" style="margin-right: 10px;"></i></a>
											</c:if>
											<c:if test="${doc.social.linkdin!=null }">
												<a><i class="fa fa-linkedin" style="margin-right: 10px;"></i></a>
											</c:if>
											<c:if test="${doc.social.google!=null }">
												<a><i class="fa fa-google-plus"
													style="margin-right: 10px;"></i></a>
											</c:if>
										</c:if>

									</div>
									<ul>

										<li><i class="fa fa-user" style="margin-right: 5px;"></i>Patient
											Experience</li>
										<span class="star-rating star-rating-empty"> <span
											class="stars"> <c:choose>
													<c:when test="${relatedDoctorReview[doc.id] == 5}">
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
													</c:when>
													<c:when test="${relatedDoctorReview[doc.id] == 4}">
														<span class="star"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
													</c:when>
													<c:when test="${relatedDoctorReview[doc.id] == 3}">
														<span class="star"></span>
														<span class="star "></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
													</c:when>
													<c:when test="${relatedDoctorReview[doc.id] == 2}">
														<span class="star"></span>
														<span class="star "></span>
														<span class="star "></span>
														<span class="star selected"></span>
														<span class="star selected"></span>
													</c:when>
													<c:when test="${relatedDoctorReview[doc.id] == 1}">
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
											<a><c:if test="${countMap[doc.id]==null}">0</c:if>${countMap[doc.id]} reviews</a>
										</div>
										<li><a style="font-size: 25px;"><i
												class="fa fa-thumbs-up"
												style="color: #96bf2d; font-size: 25px;"></i>
												<c:if test="${recommendationMap[doc.id]==null}">0</c:if>${recommendationMap[doc.id]}</a>Recommendations</li>
										<li><a style="font-size: 15px;"><i
												class="fa fa-pencil"></i> Write a Review</a></li>
									</ul>
									<ul style="width: 220px;">
										<c:forEach items="${hopspitalMap}" var="entry" begin="0"
											end="0">
											<li><i class="fa fa-hospital-o"
												style="margin-right: 5px;"></i>Hospital</li>
											<li><a>${entry.value.name}</a></li>
											<li>${entry.value.contact.address}</li>
											<li>${entry.value.contact.city} ,
												${entry.value.contact.state}
												(${entry.value.contact.country})</li>
											<li><i class="fa fa-phone"></i>
												${entry.value.phone.enquiryPhoneNo[0]}</li>
										</c:forEach>

									</ul>
									<ul>
										<li><i class="fa fa-folder-open"
											style="margin-right: 5px;"></i>Registrations</li>
										<c:forEach items="${doc.doctorRegistration}" var="entry"
											begin="0" end="0">
											<li>${entry.registrationNo } ${
												entry.stateMedicalCouncil}, ${entry.yearOfRegistration }</li>
										</c:forEach>
										<li><i class="fa fa-star" style="margin-right: 5px;"></i>
											<c:forEach items="${doc.education}" var="entry">${entry.degree } ,
											</c:forEach></li>
										<li><i class="fa fa-calendar" style="margin-right: 5px;"></i>
											15 year (s) Experience</li>


									</ul>
									<ul style="">
										<li><i class="fa fa-location-arrow"
											style="margin-right: 5px;"></i> ${doc.city}</li>
										<li><i class="fa fa-male" style="margin-right: 5px;"></i>
											${doc.gender }</li>
										<li><i class="fa fa-phone" style="margin-right: 5px;"></i>
											Unavailable</li>
										<li><i class="fa fa-map-marker"
											style="margin-right: 5px;"></i> <a>View Map</a></li>
										<li><i class="fa fa-external-link"
											style="margin-right: 5px;"></i> <a>${doc.websiteURL }</a></li>
									</ul>
								</div>
							</div>

						</dd>
					</dl>
				</section>
			</div>
			<div class="grid-col grid-col-9" style="margin-left: 0px;border: none" >
				<!-- tabs -->
				<div class="vc_row-fluid">
					<div class="vc_span12">
						<div class="wpb_tabs wpb_content_element" style="border: none">
							<div class="wpb_tour_tabs_wrapper clearfix" style="border: none">
								<ul class="wpb_tabs_nav clearfix" role="tablist" style="border: none">

									<li role="tab" aria-selected="true"><a href="#tab-1">About
									</a></li>
									<li role="tab"><a href="#tab-2">Specialties</a></li>
									<li role="tab"><a href="#tab-3">Hospital</a></li>
									<li role="tab"><a href="#tab-4"> Experience</a></li>
									<li role="tab"><a href="#tab-5">Patient Reviews</a></li>
									<li role="tab"><a href="#tab-6">Blogs</a></li>
									<li role="tab"><a href="#tab-7">Social media</a></li>
								</ul>
								<div id="tab-1" class="wpb_tab" style="border: none">
									<div class="wpb_text_column wpb_content_element">
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;text-transform: capitalize;">
											<b>About Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)}</b>
										</div>
										<div>${doc.aboutMe }</div>
										<div class="vc_text_separator"></div>
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;text-transform: capitalize;">
											<b>Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Education</b>
										</div>
										<div>

											<c:forEach items="${doc.education }" var="education" step="2"
												varStatus="count">
												<div class="vc_row-fluid">
													<!-- 1/2 column -->
													<div class="vc_span6">
														<ul style="margin-top: 5px;">
															<li style="color: #008fd5;"><b>${education.degree}</b></li>
															<li style="margin-top: 0px;">${education.college}</li>
															<li style="margin-top: 0px;">${education.yearOfStarting}
																- ${education.yearOfCompletion}</li>
															<li style="margin-top: 0px;">${education.city}
																(${education.country})</li>
														</ul>
													</div>
													<div class="vc_span6">
														<ul style="margin-top: 5px;">
															<li style="color: #008fd5;"><b>${doc.education[count.index+1].degree}</b></li>
															<li style="margin-top: 0px;">${doc.education[count.index+1].college}</li>
															<li style="margin-top: 0px;">${doc.education[count.index+1].yearOfStarting}
																- ${doc.education[count.index+1].yearOfCompletion}</li>
															<li style="margin-top: 0px;">${doc.education[count.index+1].city}
																(${doc.education[count.index+1].country})</li>
														</ul>
													</div>
												</div>

											</c:forEach>
										</div>
										<div class="vc_text_separator"></div>
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;text-transform: capitalize;">
											<b>Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Awards & Recognitions</b>
										</div>

										<c:forEach items="${doc.awards }" var="award" step="2"
											varStatus="count">
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
														<li style="color: #008fd5;"><b>${doc.awards[count.index+1].awardName}</b></li>
														<li style="margin-top: 0px;">${doc.awards[count.index+1].details}</li>
														<li style="margin-top: 0px;">${doc.awards[count.index+1].date}
														</li>
													</ul>
												</div>
											</div>

										</c:forEach>
										<div class="vc_text_separator"></div>
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;text-transform: capitalize;">
											<b>Languages Spoken by Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
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
											style="font-size: 25px; margin-left: 10px; color: #993300;text-transform: capitalize;">
											<b>Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Specialties</b>
										</div>
										<div>
											<c:forEach items="${doc.specilities }" var="spe" step="2"
												varStatus="count">
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
																style="margin-right: 5px; color: #008fd5;"></i>${doc.specilities[count.index+1]}
															</li>
														</ul>
													</div>
												</div>

											</c:forEach>

										</div>

										<div class="vc_text_separator"></div>
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;text-transform: capitalize;">
											<b>Procedures Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Performs</b>
										</div>
										<c:forEach items="${doc.procedures }" var="spe" step="2"
											varStatus="count">
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
															style="margin-right: 5px; color: #008fd5;"></i>${doc.procedures[count.index+1]}
														</li>
													</ul>
												</div>
											</div>

										</c:forEach>
										<div class="vc_text_separator"></div>
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;text-transform: capitalize;">
											<b>Conditions Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Treats</b>
										</div>
										<c:forEach items="${doc.condition }" var="spe" step="2"
											varStatus="count">
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
															style="margin-right: 5px; color: #008fd5;"></i>${spe}${doc.condition[count.index+1]}
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
											<b>Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Practice Information</b>
										</div>
										<c:forEach items="${doc.hospitals}" var="hospital">

											<c:set value="${hopspitalMap[hospital.hospitalId]}"
												var="entry" />
											<section class="detailed-services wpb_content_element"
												style="margin-bottom: 15px;">
												<dl>
													<dd style="display: block;">
														<div class="details">
															<div class="clearfix">
																<img
																	src="${pageContext.request.contextPath}/static/img/2(2).jpg"
																	width="150" height="170" alt="">

																<div class="widget-title">${entry.name}</div>
																<div>
																	<a><i class="fa fa-facebook"
																		style="margin-right: 10px;"></i></a><a><i
																		class="fa fa-twitter" style="margin-right: 10px;"></i></a><a><i
																		class="fa fa-linkedin" style="margin-right: 10px;"></i></a>
																</div>
																<ul>

																	<li><i class="fa fa-user"
																		style="margin-right: 5px;"></i>Patient Experience</li>
																	<span class="star-rating star-rating-empty"> <span
																		class="stars"> <span class="star"></span> <span
																			class="star half"></span> <span class="star selected"></span>
																			<span class="star selected"></span> <span
																			class="star selected"></span>
																	</span>
																	</span>
																	<div class="star-rating-count">
																		<a>114 reviews</a>
																	</div>
																	<li><a style="font-size: 25px;"><i
																			class="fa fa-thumbs-up"
																			style="color: #96bf2d; font-size: 25px;"></i> 56</a>Recommendations</li>
																	<li><a style="font-size: 15px;"><i
																			class="fa fa-pencil"></i> Write a Review</a></li>
																</ul>
																<ul style="width: 200px;">
																	<li><i class="fa fa-hospital-o"
																		style="margin-right: 5px;"></i>Address</li>
																	<li>${entry.contact.address}</li>
																	<li>${entry.contact.city} , ${entry.contact.state}
																		(${entry.contact.country})</li>

																</ul>
																<ul style="width: 150px;">
																	<li><i class="fa fa-phone"
																		style="margin-right: 5px;"></i>Contact</li>

																	<li><c:forEach
																			items="${entry.phone.enquiryPhoneNo}" var="enqury">${enqury } , </c:forEach></li>
																	<li><c:forEach
																			items="${entry.phone.appointmentPhoneNo}"
																			var="enqury">${enqury } , </c:forEach></li>
																	<li><c:forEach
																			items="${entry.phone.emergencyPhoneNo}" var="enqury">${enqury } , </c:forEach></li>

																</ul>


															</div>
														</div>

													</dd>
												</dl>
											</section>
											<section class="detailed-services wpb_content_element"
												style="margin-bottom: 15px;">
												<dl>
													<dd style="display: block;">
														<div class="details">
															<div class="clearfix">
																<div class="widget-title">Availability</div>
																<c:forEach var="timming" items="${hospital.timings}">
																	<ul>
																		<li>${timming.day }</li>
																		<li><script>document.write(time[${timming.startingTime }])</script>-<script>document.write(time[${timming.endingTime }])</script></li>

																	</ul>
																</c:forEach>


															</div>
														</div>

													</dd>
												</dl>
											</section>
											<div class="vc_text_separator"></div>


										</c:forEach>
									</div>
								</div>
								<div id="tab-4" class="wpb_tab" style="border: none">
									<div class="wpb_text_column wpb_content_element">
										<div
											style="font-size: 25px; margin-left: 10px; color: #993300;text-transform: capitalize;">
											<b>Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Experience</b>
										</div>
										<c:forEach items="${doc.experiences }" var="education"
											step="2" varStatus="count">
											<div class="vc_row-fluid">
												<!-- 1/2 column -->
												<div class="vc_span6">
													<ul style="margin-top: 5px;">
														<li style="color: #008fd5;"><b>${education.hospital}</b></li>
														<li style="margin-top: 0px;">${education.startingYear}
															- ${education.endYear}</li>
														<li style="margin-top: 0px;">${education.city}
															(${education.country})</li>
													</ul>
												</div>
												<div class="vc_span6">
													<ul style="margin-top: 5px;">
														<li style="color: #008fd5;"><b>${doc.experiences[count.index+1].hospital}</b></li>
														<li style="margin-top: 0px;">${doc.experiences[count.index+1].startingYear}
															- ${doc.experiences[count.index+1].endYear}</li>
														<li style="margin-top: 0px;">${doc.experiences[count.index+1].city}
															(${doc.experiences[count.index+1].country})</li>
													</ul>
												</div>
											</div>

										</c:forEach>
										<div class="vc_text_separator"></div>
									</div>
								</div>
								<div id="tab-5" class="wpb_tab" style="border: none">
									<div class="wpb_text_column wpb_content_element">
										<div style="font-size: 25px; color: #993300;text-transform: capitalize;">
											<b>How was your experience with Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} ?</b>
										</div>
										<div style="font-size: 20px;">Help other patients, and
											let the doctor know how he's doing</div>
										<div>
											<b>Your participation is kept confidential.</b> <span style="text-transform: capitalize;">Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)}</span>span> and
											his staff will not know that you took the survey or the
											identity of any survey participants. By completing the
											survey, you acknowledge that you or a family member is or has
											been a patient of the provider. Learn more in our<a>
												Privacy Policy</a>.
										</div>
										<div class="vc_text_separator"></div>
										<form:form method="post" modelAttribute="addReview"
											action="addReivew">
											<div class="input">
												<label>Your email:</label> <input type="email"
													name="reviewerEmail"> <input type="hidden"
													name="staffRating" id="staffRating"><input
													type="hidden" name="userName" value="${doc.id}"> <input
													type="hidden" name="helpfulnessRating"
													id="helpfulnessRating"> <input type="hidden"
													name="knowledgeRating" id="knowledgeRating"> <input
													type="hidden" name="punctualityRating"
													id="punctualityRating">
											</div>
											<section class="widget" style="padding-top: 20px;">
												<div class="wpb_row vc_row-fluid">
													<div class="vc_span4 wpb_column column_container">
														<div class="wpb_wrapper">
															<div class="wpb_text_column wpb_content_element">
																<div class="wpb_wrapper">
																	<ul class="ul1">
																		<li
																			style="line-height: 50px; border: 1px solid #e3e3e3;">
																			<div style=" text-align: center;text-transform: capitalize;">Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Office & Staff</div> <i
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
																			<div style="text-transform: capitalize;">Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Knowledge</div> <i
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
																			<div style="text-transform: capitalize;">Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Helpfulness</div> <i
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
																			<div style="text-transform: capitalize;">Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Punctuality</div> <i
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
											<b>Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Review(s)</b>
										</div>
										<div class="vc_text_separator"></div>
										<c:forEach items="${allReview }" var="review">
											<div class="vc_row-fluid" style="margin-bottom: 25px;">
												<!-- 1/4 column -->
												<div class="vc_span3">
													<div class="wpb_text_column"><span style="text-transform: capitalize;">
														<h1>Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Office & Staff</span></h1>
														<span class="star-rating star-rating-empty"> <span
															class="stars"> <c:choose>
																	<c:when test="${review.staffRating == 5}">
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.staffRating == 4}">
																		<span class="star"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.staffRating == 3}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.staffRating == 2}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.staffRating == 1}">
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
													<div class="wpb_text_column"><span style="text-transform: capitalize;">
														<h1>Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Helpfulness</h1></span>
														<span class="star-rating star-rating-empty"> <span
															class="stars"> <c:choose>
																	<c:when test="${review.helpfulnessRating == 5}">
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.helpfulnessRating == 4}">
																		<span class="star"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.helpfulnessRating == 3}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.helpfulnessRating == 2}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.helpfulnessRating == 1}">
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
													<div class="wpb_text_column"><span style="text-transform: capitalize;">
														<h1>Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Knowledge</h1></span>
														<span class="star-rating star-rating-empty"> <span
															class="stars"><c:choose>
																	<c:when test="${review.knowledgeRating == 5}">
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.knowledgeRating == 4}">
																		<span class="star"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.knowledgeRating == 3}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.knowledgeRating == 2}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.knowledgeRating == 1}">
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
													<div class="wpb_text_column"><span style="text-transform: capitalize;">
														<h1>Dr. ${fn:toLowerCase(doc.fname
											)} ${fn:toLowerCase(doc.lname
											)} Punctuality</h1></span>
														<span class="star-rating star-rating-empty"> <span
															class="stars"> <c:choose>
																	<c:when test="${review.punctualityRating == 5}">
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.punctualityRating == 4}">
																		<span class="star"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.punctualityRating == 3}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.punctualityRating == 2}">
																		<span class="star"></span>
																		<span class="star "></span>
																		<span class="star "></span>
																		<span class="star selected"></span>
																		<span class="star selected"></span>
																	</c:when>
																	<c:when test="${review.punctualityRating == 1}">
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

								<div id="tab-6" class="wpb_tab" style="border: none">
									<div class="wpb_text_column wpb_content_element">
										<div class="grid-col grid-col-9">
											<!-- news -->
											<section id="news" class="widget news news-1">
												<div class="grid">
												
													<c:forEach items="${listOfBlogsForUserName}" var="blog">
							<div class="item">
								<h3></h3>

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
												<a href="#" data-template="news-one" data-page="2"
													class="button more"><i class="fa fa-refresh"></i>Load
													more</a>

											</section>
										</div>
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
						the Right Doctor For You.</div>
					<div id="comments-carousel" class="owl-carousel">
						<c:if test="${relatedDoctor1!=null }">
							<div class="item">
								<ul>
									<c:forEach var="relateddoc" items="${relatedDoctor1 }">
										<li><img src="${pageContext.request.contextPath}/static/images/profile/${relateddoc.username}/${relateddoc.profilePicture}" alt="">
											<div class="author">
												<a
													href="${pageContext.request.contextPath}/doctor/${relateddoc.id}">${relateddoc.fname
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
												
													<a>${relateddoc.specilities}</a>,
										<br> <a>${relateddoc.city
													}</a>
											</p></li>

									</c:forEach>


								</ul>
							</div>

						</c:if>
						<c:if test="${relatedDoctor2!=null }">
							<div class="item">
								<ul>
									<c:forEach var="relateddoc" items="${relatedDoctor2 }">
										<li><img src="pic/doctor-1.jpg" alt="">
											<div class="author">
												<a
													href="${pageContext.request.contextPath}/doctor/${relateddoc.id}">${relateddoc.fname
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
										</c:forEach><br> <a>${relateddoc.city
													}</a>
											</p></li>

									</c:forEach>


								</ul>
							</div>

						</c:if>


						<c:if test="${relatedDoctor3!=null }">
							<div class="item">
								<ul>
									<c:forEach var="relateddoc" items="${relatedDoctor3 }">
										<li><img src="pic/doctor-1.jpg" alt="">
											<div class="author">
												<a
													href="${pageContext.request.contextPath}/doctor/${relateddoc.id}">${relateddoc.fname
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
												<a>${relateddoc.city }</a>
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
		$('#punctualityRating').val(starPunctuality);

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
		$('#helpfulnessRating').val(starHelp);

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
		$('#knowledgeRating').val(starKnowledge);

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
		$('#staffRating').val(starStaff);

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
									url : "/smo/twiter",
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
									url : "/smo/facebook",
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
	if(value==0){
		$('#recommend').val(1);
	}else{
		$('#recommend').val(0);
	}
}
	
</script>