package com.smo.manager;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.smo.constant.AppConstants;
import com.smo.model.SMOBlog;
import com.smo.model.SMOBlogCategory;
import com.smo.model.SMOUser;
import com.smo.service.blog.BlogService;
import com.smo.utility.SMOException;
import com.smo.utility.UserUtility;

@Component
public class BlogManager {

	@Autowired
	BlogService blogService;
	@Autowired
	BlogCategoryManager blogCategoryManager;

	public String editBlog(SMOBlog blog) {

		if (blog.getId() != null && !blog.getId().equalsIgnoreCase("")) {
			SMOBlog dbBlog;
			dbBlog = blogService.getBlogById(blog.getId());
			if (dbBlog != null) {

				if (blog.getCategory() != null) {
					dbBlog.setCategory(blog.getCategory());
				}
				if (blog.getSubCategories().size() > 0) {
					dbBlog.setSubCategories(blog.getSubCategories());
				}
				if (blog.getBlogTitle() != null) {
					dbBlog.setBlogTitle(blog.getBlogTitle());
				}
				if (blog.getSubTitle() != null) {
					dbBlog.setSubTitle(blog.getSubTitle());
				}
				if (blog.getSummary() != null) {
					dbBlog.setSummary(blog.getSummary());
				}
				if (blog.getContent() != null) {
					dbBlog.setContent(blog.getContent());
				}
				return blogService.addBlog(dbBlog);
			}

		}
		blog.setId(null);
		blog.setPublish(false); // because user can only publish after adding
								// images
		blog.setAuthor(UserUtility.getLoggedInUserUserName());
		Date d = new Date();
		blog.setCreatedDate(d);
		blog.setUpdatedDate(d);
		return blogService.addBlog(blog);
	}

	public String addBlog(SMOBlog blog) {
		return blogService.addBlog(blog);
	}

	public String addKeywordsToBlog(String keyword, String id) {
		if (!id.equalsIgnoreCase("") && id != null) {
			SMOBlog dbBlog = blogService.getBlogById(id);
			if (dbBlog != null) {
				dbBlog.addKeyWord(keyword);
				return blogService.addBlog(dbBlog);
			}
		}
		SMOBlog b = new SMOBlog();
		b.addKeyWord(keyword);

		return blogService.addBlog(b);
	}

	public String removeKeywordsFromBlog(String keyword, String id)
			throws SMOException {
		if (!id.equalsIgnoreCase("") && id != null) {
			SMOBlog dbBlog = blogService.getBlogById(id);
			if (dbBlog != null) {
				if (dbBlog.getKeyWords().contains(keyword)) {
					dbBlog.getKeyWords().remove(keyword);
				}
				return blogService.addBlog(dbBlog);
			}
		}

		throw new SMOException();
	}

	public boolean addImagesToBlog(String bigfileName, String midiumFileName,
			String thumbFileName, String id, boolean isRequestedForApproval) {
		if (!id.equalsIgnoreCase("") && id != null) {
			SMOBlog content = blogService.getBlogById(id);

			if (bigfileName != null && content != null) {
				content.setBigImage(bigfileName);
			}
			if (midiumFileName != null && content != null) {
				content.setMediumImage(midiumFileName);

			}
			if (thumbFileName != null && content != null) {
				content.setThumbImage(thumbFileName);
			}
			if (content != null) {
				List<String> roles = UserUtility.getLoggedInUserRoleList();

				if (roles.contains(AppConstants.ROLE_ADMIN)) {
					content.setPublish(isRequestedForApproval);
					if (content != null && content.isDraftOfPublishedContent()
							&& isRequestedForApproval) {
						SMOBlog publishedBlog = getBlogById(content
								.getRefrenceId());
						content.setId(publishedBlog.getId());
						deleteContent(id);
						deleteContent(publishedBlog.getId());

					}
				} else {
					content.setPendingApproval(isRequestedForApproval);
				}

				blogService.addBlog(content);
				return true;
			}
		}

		return false;

	}

	public List<SMOBlog> getBlogByCategoryForHomePage(String category) {
		return blogService.getBlogByCategoryForHomepage(category,
				AppConstants.contentSizeByCategoryInHomePage);
	}

	public List<SMOBlog> getBlogByCategoryForRelatedBlog(String category) {
		return blogService.getBlogByCategoryForHomepage(category,
				AppConstants.relatedBlogCount);
	}

	public List<SMOBlog> getBlogByCategory(String category, int page,int size) {

		return blogService.getLatestBlogByCategory(category, page, size);
	}
	public List<SMOBlog> getBlogByCategory(String category,int size) {

		return blogService.getLatestBlogByCategory(category, size);
	}

	public Map<String, SMOBlog> getLatestContentForHomePage() {
		List<SMOBlogCategory> allCategories = blogCategoryManager
				.getAllContentCategory();
		List<String> categories = new ArrayList<String>();
		if (allCategories != null) {
			for (SMOBlogCategory c : allCategories) {
				categories.add(c.getId());
			}
		}

		return blogService.getLatestBlogForHomepage(categories);
	}

	public SMOBlog getBlogByTitleAndCategory(String title, String ccategory) {
		return blogService.getBlogByTitleAndCategory(title, ccategory);
	}

	public List<SMOBlog> getBlogByCategoryForSubCategoryPage(String category) {
		return blogService.getBlogByCategoryForHomepage(category,
				AppConstants.contentLatestInHomePage);
	}

	public List<SMOBlog> getBlogsForLoggedInUser() {
		SMOUser auth = (SMOUser) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();

		return blogService.getBlogsForLoggedInUser(auth.getUsername());
	}

	public List<SMOBlog> getAllBlogs() {

		return blogService.getAllBlogs();
	}

	public SMOBlog getBlogById(String id) {
		return blogService.getBlogById(id);

	}

	public void deleteContent(String id) {
		SMOBlog blog = getBlogById(id);
		if (blog != null) {
			blogService.deleteContent(id);
		}

	}

	public List<SMOBlog> getBlogsByText(String keyWord, int page, int size) {
		return blogService.getBlogsByText(keyWord, page, size);
	}

	public List<SMOBlog> getBlogsByRegex(String keyWord, int page, int size) {
		return blogService.getBlogsByRegex(keyWord, page, size);
	}

	public List<SMOBlog> getLatestContentForHomepage(String type, int limit) {
		return blogService.getLatestContentByType(type, limit);
	}
	public long getCountByCategory(String category) {
		// TODO Auto-generated method stub
		return blogService.getCountByCategory(category);
	}

	public List<SMOBlog> getLatestBlogByAuthor(String author , int count){
		return blogService.getLatestBlogByAuthor(author, count);
	}
}
