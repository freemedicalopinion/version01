<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<style type="text/css">
.blog-title {
	max-width: 120px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body class="skin-blue">
	<!-- including header -->
	<%@ include file="header.html"%>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- including menu -->
		<%@ include file="menu.html"%>
		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Blogs Inbox <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Blog</li>
					<li class="active">Manage Old Blogs</li>
				</ol>
			</section>
			<!-- ./wrapper -->
			<!-- Main content -->
			<section class="content">
				<!-- MAILBOX BEGIN -->
				<div class="mailbox row">
					<div class="col-xs-12">
						<div class="box box-solid">
							<div class="box-body">
								<div class="row">
									<div class="col-md-3 col-sm-4">
										<!-- BOXES are complex enough to move the .box-header around.
                                                 This is an example of having the box header within the box body -->
										<!-- compose message btn -->
										<!-- Navigation - folders-->
										<div style="margin-top: 15px;">
											<ul class="nav nav-pills nav-stacked">
												<li class="header">Folders</li>
												<li class="active"><a
													href="manageOldBlogPage?filter=all"><i
														class="fa fa-inbox"></i> All (${allSize})</a></li>
												<li><a href="manageOldBlogPage?filter=published"><i
														class="fa fa-thumbs-up"></i> Published (${publishedSize })</a></li>
												<li><a href="manageOldBlogPage?filter=rejected"><i
														class="fa fa-thumbs-down"></i> Rejected (${rejectedSize })</a></li>
												<li><a href="manageOldBlogPage?filter=pendingapproval"><i
														class="fa fa-folder"></i> Pending Approval
														(${pendingApprovalSize })</a></li>
												<li><a href="manageOldBlogPage?filter=draft"><i
														class="fa fa-pencil-square-o"></i> Drafts (${draftSize})</a></li>

											</ul>
										</div>
									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<div class="row pad">
											<div class="col-sm-6">
												<label style="margin-right: 10px;"> </label>
												<!-- Action button -->
												<div class="btn-group">
													<button type="button"
														class="btn btn-primary btn-sm btn-flat disabled"
														id="preview">Preview</button>

												</div>

												<div class="btn-group">
													<button type="button"
														class="btn btn-success btn-sm btn-flat disabled"
														id="publish">Publish</button>

												</div>
												<div class="btn-group">
													<button type="button"
														class="btn btn-warning btn-sm btn-flat disabled" id="edit-blog">Edit</button>

												</div>
												<div class="btn-group">
													<button type="button"
														class="btn btn-danger btn-sm btn-flat disabled"
														id="delete">Delete</button>

												</div>

											</div>
											<div class="col-sm-6 search-form">
												<form action="#" class="text-right">
													<div class="input-group">
														<input type="text" class="form-control input-sm"
															placeholder="Search">
														<div class="input-group-btn">
															<button type="button" name="q"
																class="btn btn-sm btn-primary">
																<i class="fa fa-search"></i>
															</button>
														</div>
													</div>
												</form>
											</div>
										</div>
										<!-- /.row -->
										<div class="table-responsive">
											<input type='hidden' id='current_page' /> <input
												type='hidden' id='show_per_page' />

											<!-- THE MESSAGES -->
											<table class="table table-mailbox">
												<tbody id="content">
													<c:forEach items="${blogs}" var="blog">
														<tr>
															<td class="small-col"><input type="radio"
																name="same" id="${blog.id}" /></td>
															<c:choose>
																<c:when test="${ blog.publish == true}">
																	<td width="10%;"><a href="#"><p
																				class="text-green">Published</p></a></td>
																</c:when>
																<c:when test="${ blog.pendingApproval == true}">
																	<td width="10%;"><a href="#"><p
																				class="text-aqua">Pending Approval</p></a></td>
																</c:when>
																<c:when test="${ blog.rejected == true}">
																	<td width="10%;"><a href="#"><p
																				class="text-red">Rejected</p></a></td>
																</c:when>
																<c:otherwise>
																	<td width="10%;"><a href="#"><p
																				class="text-muted">Draft</p></a></td>
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${blog.blogTitle== ''}">
																	<td class="subject"><a href="#">(no
																			title)</a></td>
																</c:when>
																<c:when test="${blog.blogTitle== null}">
																	<td class="subject"><a href="#">(no
																			title)</a></td>
																</c:when>
																<c:otherwise>
																	<td class="subject blog-title"><a href="#">${blog.blogTitle}</a></td>
																</c:otherwise>
															</c:choose>

															<td class="time"><fmt:formatDate type="both"
																	dateStyle="short" timeStyle="short"
																	value="${blog.updatedDate}" /></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<div class="box-footer clearfix" id='page_navigation'
												style="float: right;"></div>
										</div>
										<!-- /.table-responsive -->
									</div>
									<!-- /.col (RIGHT) -->
								</div>
								<!-- /.row -->
								<!-- /.col (MAIN) -->
							</div>

						</div>
					</div>
				</div>

				<!-- MAILBOX END -->
			</section>
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
		<form id="edit-blog-form" action="createDraft" method="post">
			<input type="hidden" name="id" class="blogaction" />
		</form>
		<form id="delete-blog-form" action="deleteBlog" method="post">
			<input type="hidden" name="id" class="blogaction" />
		</form>
		<form id="publish-blog-form" action="sendForApprovalBlog"
			method="post">
			<input type="hidden" name="id" class="blogaction" />
		</form>
	</div>
	<!-- ./wrapper -->
	<!-- including footer -->
	<%@ include file="footer.html"%>
	<script type="text/javascript">
		var blogIdStatus = '${blogStatus}';

		var blogIdStatusJson = eval(blogIdStatus);
		var blogIdStatusArray = {};
		for ( var i = 0; i < blogIdStatusJson.length; i++) {
			blogIdStatusArray[blogIdStatusJson[i].key] = blogIdStatusJson[i].value;
		}

		
		//how much items per page to show
		var show_per_page = 5;
		//getting the amount of elements inside content div
		var number_of_items = $('#content').children().size();
		//calculate the number of pages we are going to have
		var number_of_pages = Math.ceil(number_of_items / show_per_page);

		//set the value of our hidden input fields
		$('#current_page').val(0);
		$('#show_per_page').val(show_per_page);

		//now when we got all we need for the navigation let's make it '

		/*
		what are we going to have in the navigation?
			- link to previous page
			- links to specific pages
			- link to next page
			
			
		 */
		var navigation_html = '<div class="btn-group">';
		// navigation_html += '<button type="button" class="btn btn-default" onclick="javascript:previous();"><i class="fa fa-caret-left"></i></button>';

		var current_link = 0;
		while (number_of_pages > current_link) {
			navigation_html += '<button type="button" class="btn btn-default paginationButton" onclick="javascript:go_to_page('
					+ current_link
					+ ')" longdesc="'
					+ current_link
					+ '" id="pagination'
					+ current_link
					+ '">'
					+ (current_link + 1) + '</button>';
			current_link++;
		}

		//	navigation_html += '<button type="button" class="btn btn-default" onclick="javascript:next();"><i class="fa fa-caret-right"></i></button>';
		navigation_html += ' </div>';
		$('#page_navigation').html(navigation_html);
		$('#pagination0').removeClass('btn-default');
		$('#pagination0').addClass('btn-success');

		//add active_page class to the first page link
		$('#page_navigation .page_link:first').addClass('active_page');

		//hide all the elements inside content div
		$('#content').children().hide();
		;

		//and show the first n (show_per_page) elements
		$('#content').children().slice(0, show_per_page).show();

		/* function previous() {

			new_page = parseInt($('#current_page').val()) - 1;
			//if there is an item before the current active link run the function
			if ($('.active_page').prev('.page_link').length == true) {
				go_to_page(new_page);
			}

		}

		function next() {
			new_page = parseInt($('#current_page').val()) + 1;
			//if there is an item after the current active link run the function
			if ($('.active_page').next('.page_link').length == true) {
				go_to_page(new_page);
			}

		} */
		function go_to_page(page_num) {
			//get the number of items shown per page 

			$(".paginationButton").each(function(index) {
				if ($(this).hasClass('btn-success')) {
					$(this).removeClass('btn-success');
					$(this).addClass('btn-default');
				}
			});

			if ($('#pagination' + page_num).hasClass('btn-default')) {
				$('#pagination' + page_num).removeClass('btn-default');
				$('#pagination' + page_num).addClass('btn-success');
			}

			var show_per_page = parseInt($('#show_per_page').val());

			//get the element number where to start the slice from
			start_from = page_num * show_per_page;

			//get the element number where to end the slice
			end_on = start_from + show_per_page;

			//hide all children elements of content div, get specific items and show them
			$('#content').children().hide().slice(start_from, end_on).show();

			/*get the page link that has longdesc attribute of the current page and add active_page class to it
			and remove that class from previously active page link*/
			$('.page_link[longdesc=' + page_num + ']').addClass('active_page')
					.siblings('.active_page').removeClass('active_page');

			//update the current page input field
			$('#current_page').val(page_num);
		}

		// Create a closure
		(function() {
			// Your base, I'm in it!
			var originalAddClassMethod = jQuery.fn.addClass;

			jQuery.fn.addClass = function() {
				// Execute the original method.
				var result = originalAddClassMethod.apply(this, arguments);

				// trigger a custom event
				jQuery(this).trigger('cssClassChanged');

				// return the original result
				return result;
			}
		})();

		// document ready function

		var selectedBlogId;

		$(document.body).on(
				'cssClassChanged',
				".iradio_minimal",
				function() {
					//do stuff here
					if ($(this).hasClass('checked')) {
						disableAllButton();
						var blogStatus = blogIdStatusArray[$(this).children(
								'input[type=radio]').attr('id')];
						selectedBlogId = $(this).children('input[type=radio]')
								.attr('id');
						addSelectedblogIdToAllForm();

						if (blogStatus == 'published') {
							removeDisabledClass('preview');
							removeDisabledClass('edit-blog');
						} else {
							removeDisabledClass('preview');
							removeDisabledClass('publish');
							removeDisabledClass('edit-blog');
							removeDisabledClass('delete');
						}
					}
				});

		function removeDisabledClass(id) {
			if ($('#' + id).hasClass('disabled')) {
				$('#' + id).removeClass('disabled');
			}
		}

		function disableAllButton() {
			$('#preview').addClass('disabled');
			$('#publish').addClass('disabled');
			$('#edit-blog').addClass('disabled');
			$('#delete').addClass('disabled');
		}
		function addSelectedblogIdToAllForm() {
			$(".blogaction").each(function(index) {
				$(this).val(selectedBlogId);
			});
		}

		$("#preview").click(function() {
			$('#edit-blog-form').submit();
		});
		$("#publish").click(function() {
			$('#publish-blog-form').submit();
		});
		$("#edit-blog").click(function() {

			document.getElementById("edit-blog-form").submit();
		});
		$("#delete").click(function() {
			$('#delete-blog-form').submit();

		});
	</script>


</body>
</html>
