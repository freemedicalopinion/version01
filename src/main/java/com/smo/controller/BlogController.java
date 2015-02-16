package com.smo.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mongodb.DBObject;
import com.smo.constant.AppConstants;
import com.smo.manager.BlogCategoryManager;
import com.smo.manager.BlogManager;
import com.smo.manager.CommentManager;
import com.smo.model.ContentImages;
import com.smo.model.SMOBlog;
import com.smo.model.SMOBlogCategory;
import com.smo.model.SMOComment;
import com.smo.model.SMOKeyValue;
import com.smo.utility.SMOException;
import com.smo.utility.UserUtility;
import com.smo.utility.Utility;

@Controller
public class BlogController {
	@Autowired
	private BlogManager blogManager;
	@Autowired
	private BlogCategoryManager blogCategoryManager;
	@Autowired
	private CommentManager commentManager;

	@RequestMapping(value = "/secure/addBlogPage", method = RequestMethod.GET)
	public ModelAndView addBlogPage() {
		ModelAndView m = new ModelAndView();
		List<SMOBlogCategory> categories = blogCategoryManager
				.getAllContentCategory();
		Gson g = new Gson();
		String categoriesJson = g.toJson(categories);
		m.addObject("categories", categoriesJson);
		m.addObject("blogObj", new SMOBlog());
		m.addObject("images", new ContentImages());
		m.setViewName("secure/addBlog");
		return m;

	}

	/**
	 * if no blog in db then blogId=""
	 * */
	@RequestMapping(value = "/secure/addBlog", method = RequestMethod.POST)
	public @ResponseBody
	String addBlog(@ModelAttribute("blogObj") SMOBlog blogObj,
			HttpServletRequest request, BindingResult result) {

		String id = blogManager.editBlog(blogObj);

		return id;

	}

	@RequestMapping(value = "/secure/addKeywordsToBlog", method = RequestMethod.POST)
	public @ResponseBody
	String addKeyWordsToBlog(@RequestParam("keyWord") String keyWord,
			@RequestParam("id") String id) {

		String contentid = blogManager.addKeywordsToBlog(keyWord, id);

		return contentid;

	}

	@RequestMapping(value = "/secure/removeKeywordFormBlog", method = RequestMethod.POST)
	public @ResponseBody
	String removeKeyWordsToBlog(@RequestParam("keyWord") String keyWord,
			@RequestParam("id") String id) throws SMOException {

		String contentId = blogManager.removeKeywordsFromBlog(keyWord, id);

		return contentId;

	}

	/**
	 * if no blog in db then blogId=""
	 * 
	 * @throws IOException
	 * */
	@RequestMapping(value = "/secure/addImagesToBlog", method = RequestMethod.POST)
	public String addImagesToBlog(
			@ModelAttribute("images") ContentImages images,
			HttpServletRequest request, BindingResult result)
			throws IOException {
		if (images.getContentId().equalsIgnoreCase("")) {
			images.setContentId(blogManager.editBlog(new SMOBlog()));
		}
		String bigimageName = Utility.saveFile(images.getBigImage(),
				AppConstants.IMAGE_TYPE_BIG, images.getContentId());
		String mediumimageName = Utility.saveFile(images.getMediumImage(),
				AppConstants.IMAGE_TYPE_MEDIUM, images.getContentId());
		String thumbimageName = Utility.saveFile(images.getThumbImage(),
				AppConstants.IMAGE_TYPE_THUMB, images.getContentId());
		if (images.getIspublish() == 0) {
			blogManager.addImagesToBlog(bigimageName, mediumimageName,
					thumbimageName, images.getContentId(), false);
		} else {
			blogManager.addImagesToBlog(bigimageName, mediumimageName,
					thumbimageName, images.getContentId(), true);
		}
		String referer = request.getHeader("Referer");
		return "redirect:" + "addBlogPage";

	}

	@RequestMapping(value = "/secure/manageOldBlogPage", method = RequestMethod.GET)
	public ModelAndView manageOBlogPagge(
			@RequestParam(value = "filter", required = false) String filter) {
		List<SMOBlog> blogsForUser = blogManager.getBlogsForLoggedInUser();
		List<SMOBlog> published = new ArrayList<SMOBlog>();
		List<SMOBlog> draft = new ArrayList<SMOBlog>();
		List<SMOBlog> pendingApproval = new ArrayList<SMOBlog>();
		List<SMOBlog> rejected = new ArrayList<SMOBlog>();
		List<SMOKeyValue> blogStatusMap = new ArrayList<SMOKeyValue>();
		if (blogsForUser != null) {
			for (SMOBlog blog : blogsForUser) {
				if (blog.isPublish()) {
					published.add(blog);
					blogStatusMap
							.add(new SMOKeyValue(blog.getId(), "published"));
				} else if (blog.isPendingApproval()) {
					pendingApproval.add(blog);
					blogStatusMap.add(new SMOKeyValue(blog.getId(),
							"pendingApproval"));
				} else if (blog.isRejected()) {
					rejected.add(blog);
					blogStatusMap
							.add(new SMOKeyValue(blog.getId(), "rejected"));
				} else {
					draft.add(blog);
					blogStatusMap.add(new SMOKeyValue(blog.getId(), "draft"));
				}
			}
		}
		ModelAndView m = new ModelAndView();
		if (filter != null) {
			if (filter.equalsIgnoreCase("published")) {
				m.addObject("blogs", published);
			} else if (filter.equalsIgnoreCase("draft")) {
				m.addObject("blogs", draft);
			} else if (filter.equalsIgnoreCase("rejected")) {
				m.addObject("blogs", rejected);
			} else if (filter.equalsIgnoreCase("pendingapproval")) {
				m.addObject("blogs", pendingApproval);
			} else {
				m.addObject("blogs", blogsForUser);
			}
		} else {
			m.addObject("blogs", blogsForUser);
		}
		Gson g = new Gson();
		m.addObject("blogStatus", g.toJson(blogStatusMap));

		m.addObject("publishedSize", published.size());
		m.addObject("draftSize", draft.size());
		m.addObject("pendingApprovalSize", pendingApproval.size());
		m.addObject("rejectedSize", rejected.size());
		m.addObject("allSize",
				draft.size() + published.size() + rejected.size()
						+ pendingApproval.size());
		m.setViewName("secure/manageOldBlog");
		return m;

	}

	@RequestMapping(value = "/secure/blogApprovalPage", method = RequestMethod.GET)
	public ModelAndView blogApprovalPage(
			@RequestParam(value = "filter", required = false) String filter) {
		List<SMOBlog> allBlogs = blogManager.getAllBlogs();
		List<SMOBlog> published = new ArrayList<SMOBlog>();
		List<SMOBlog> pendingApproval = new ArrayList<SMOBlog>();
		List<SMOBlog> rejected = new ArrayList<SMOBlog>();
		List<SMOKeyValue> blogStatusMap = new ArrayList<SMOKeyValue>();
		if (allBlogs != null) {
			for (SMOBlog blog : allBlogs) {
				if (blog.isPublish()) {
					published.add(blog);
					blogStatusMap
							.add(new SMOKeyValue(blog.getId(), "published"));
				} else if (blog.isPendingApproval()) {
					pendingApproval.add(blog);
					blogStatusMap.add(new SMOKeyValue(blog.getId(),
							"pendingApproval"));
				} else if (blog.isRejected()) {
					rejected.add(blog);
					blogStatusMap
							.add(new SMOKeyValue(blog.getId(), "rejected"));
				}
			}
		}
		ModelAndView m = new ModelAndView();
		if (filter != null) {
			if (filter.equalsIgnoreCase("published")) {
				m.addObject("blogs", published);
			} else if (filter.equalsIgnoreCase("rejected")) {
				m.addObject("blogs", rejected);
			} else if (filter.equalsIgnoreCase("pendingapproval")) {
				m.addObject("blogs", pendingApproval);
			} else {
				m.addObject("blogs", pendingApproval);
			}
		} else {
			m.addObject("blogs", pendingApproval);
		}
		Gson g = new Gson();
		m.addObject("blogStatus", g.toJson(blogStatusMap));

		m.addObject("publishedSize", published.size());
		m.addObject("pendingApprovalSize", pendingApproval.size());
		m.addObject("rejectedSize", rejected.size());
		m.setViewName("secure/blogApproval");
		return m;

	}

	@RequestMapping(value = "/secure/publishBlog", method = RequestMethod.POST)
	public String publishBlog(@Param("id") String id, HttpServletRequest request) {
		SMOBlog blog = blogManager.getBlogById(id);
		String referer = request.getHeader("Referer");
		if (blog.isPublish()) {
			return "redirect:" + referer;
		}

		if (blog != null && blog.isDraftOfPublishedContent()) {
			SMOBlog publishedBlog = blogManager.getBlogById(blog
					.getRefrenceId());
			blog.setId(publishedBlog.getId());
			blogManager.deleteContent(id);
			blogManager.deleteContent(publishedBlog.getId());

		}
		if (blog != null) {
			blog.setPendingApproval(false);
			blog.setRejected(false);
			blog.setPublish(true);
			blogManager.addBlog(blog);
		}

		return "redirect:" + referer;

	}

	@RequestMapping(value = "/secure/rejectBlog", method = RequestMethod.POST)
	public String rejectBlog(@Param("id") String id, HttpServletRequest request) {
		SMOBlog blog = blogManager.getBlogById(id);
		if (blog != null) {
			blog.setPendingApproval(false);
			blog.setRejected(true);
			blog.setPublish(false);
			blogManager.addBlog(blog);
		}
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/secure/sendForApprovalBlog", method = RequestMethod.POST)
	public String sendForApprovalBlog(@Param("id") String id,
			HttpServletRequest request) {
		SMOBlog blog = blogManager.getBlogById(id);

		if (UserUtility.getLoggedInUserRoleList().contains(
				AppConstants.ROLE_ADMIN)) {
			if (blog != null && blog.isDraftOfPublishedContent()) {
				SMOBlog publishedBlog = blogManager.getBlogById(blog
						.getRefrenceId());
				blog.setId(publishedBlog.getId());
				blogManager.deleteContent(id);
				blogManager.deleteContent(publishedBlog.getId());

			}
			if (blog != null) {
				blog.setPendingApproval(false);
				blog.setRejected(false);
				blog.setPublish(true);
				blogManager.addBlog(blog);
			}
		} else if (blog != null) {
			blog.setPendingApproval(true);
			blog.setRejected(false);
			blog.setPublish(false);
			blogManager.addBlog(blog);
		}
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/secure/deleteBlog", method = RequestMethod.POST)
	public String deleteBlog(@Param("id") String id, HttpServletRequest request) {
		SMOBlog blog = blogManager.getBlogById(id);
		String referer = request.getHeader("Referer");
		if (blog.isPublish()) {
			return "redirect:" + referer;
		}
		if (blog != null && !blog.isPublish()) {
			blogManager.deleteContent(id);
		}

		return "redirect:" + referer;

	}

	@RequestMapping(value = "/secure/blogTimeLine", method = RequestMethod.GET)
	public ModelAndView blogTimeLinePage() {
		// List<SMOBlog> blogsForUser = blogManager.getBlogsForLoggedInUser();
		ModelAndView m = new ModelAndView();
		m.setViewName("secure/blogTimeline");
		return m;

	}

	@RequestMapping(value = "/secure/createDraft", method = RequestMethod.POST)
	public String createDraftOfPublishedBlog(@Param("id") String id)
			throws SMOException {
		if (id == null || id.trim().equalsIgnoreCase("")) {
			throw new SMOException();
		}
		SMOBlog blog = blogManager.getBlogById(id);
		ModelAndView m = new ModelAndView();
		if (blog != null && blog.isPublish()) {
			// Creating draft for published contennt
			blog.setId(null);
			String draftId = blogManager.addBlog(blog);
			SMOBlog draftBlog = blogManager.getBlogById(draftId);
			draftBlog.setPublish(false);
			draftBlog.setDraftOfPublishedContent(true);
			draftBlog.setRefrenceId(id);
			id = blogManager.addBlog(draftBlog);
			m.addObject("blog", draftBlog);
		}

		return "redirect:editBlogPage?id=" + id;

	}

	@RequestMapping(value = "/secure/editBlogPage", method = RequestMethod.GET)
	public ModelAndView editContent(
			@RequestParam(value = "id", required = false) String id)
			throws SMOException {
		if (id == null || id.trim().equalsIgnoreCase("")) {
			throw new SMOException();
		}
		SMOBlog blog = blogManager.getBlogById(id);
		ModelAndView m = new ModelAndView();

		List<SMOBlogCategory> categories = blogCategoryManager
				.getAllContentCategory();

		Gson g = new Gson();
		m.addObject("subCategoryJsonForBlog", g.toJson(blog.getSubCategories()));

		String categoriesJson = g.toJson(categories);
		m.addObject("categories", categoriesJson);
		m.addObject("blogObj", new SMOBlog());
		m.addObject("blog", blog);
		m.addObject("images", new ContentImages());
		m.setViewName("secure/editBlog");
		return m;

	}

	@RequestMapping(value = "/blogs", method = RequestMethod.GET)
	public ModelAndView viewBlogHomePage() {
		List<SMOBlogCategory> allCategories = blogCategoryManager
				.getAllContentCategory();
		Map<String, SMOBlog> latest = blogManager.getLatestContentForHomePage();
		List<SMOBlog> listOfLatestBlogs = blogManager.getLatestContentForHomepage("blog", 11);
		List<SMOComment> listOfLatestComments = commentManager.getLatestComments(10);
		ModelAndView m = new ModelAndView();
		m.addObject("allCategories", allCategories);
		m.addObject("listOfLatestBlogs", listOfLatestBlogs);
		m.addObject("listOfLatestComments", listOfLatestComments);
		m.addObject("latest", latest);
		m.setViewName("blogHome");
		return m;

	}

	@RequestMapping(value = "/blogs/{category}", method = RequestMethod.GET)
	public ModelAndView viewBlogCategoryHomePage(
			@PathVariable("category") String category,
			@RequestParam(value = "page", required = false) String page) {
		int pageId = 0;

		try {
			pageId = page == null ? 0 : Integer.parseInt(page) - 1;
		} catch (Exception e) {
			pageId = 0;
		}

		List<SMOBlog> listOfBlogsByCategory = blogManager.getBlogByCategory(
				category, pageId, 10);
		long count = blogManager.getCountByCategory(category);
		List<SMOBlogCategory> allCategories = blogCategoryManager
				.getAllContentCategory();
		HashMap<String, Integer> blogComments = new HashMap<String, Integer>();
		List<String> listOfBlogId = new ArrayList<String>();
		for (SMOBlog smoBlog : listOfBlogsByCategory) {
			listOfBlogId.add(smoBlog.getId());
		}
		AggregationResults<DBObject> d = commentManager
				.getCommentCount(listOfBlogId);
		List<DBObject> sd = d.getMappedResults();
		if (sd != null) {
			for (DBObject obj : sd) {
				blogComments.put(obj.get("_id").toString(),
						Integer.parseInt(obj.get("count").toString()));
			}
		}
		ModelAndView m = new ModelAndView();
		List<SMOBlog> relatedBlogs=listOfBlogsByCategory;
		if (relatedBlogs.size() < 4) {
			m.addObject("relatedBlogs1", relatedBlogs);
			m.addObject("relatedBlogs2", null);
			m.addObject("relatedBlogs3", null);
		} else {
			m.addObject("relatedBlogs1", relatedBlogs.subList(0, 4));
			if (relatedBlogs.size() < 8) {
				m.addObject(
						"relatedBlogs2",
						relatedBlogs.subList(4,
								relatedBlogs.size()));
				m.addObject("relatedBlogs3", null);
			} else {
				m.addObject("relatedBlogs2",
						relatedBlogs.subList(4, 7));
				if (relatedBlogs.size() < 12) {
					m.addObject(
							"relatedBlogs3",
							relatedBlogs.subList(7,
									relatedBlogs.size()));
				} else {
					m.addObject("relatedBlogs3",
							relatedBlogs.subList(7, 11));

				}
			}
		}
		
		SMOBlogCategory smoBlogCategory = blogCategoryManager
				.getCategoryById(category);
		
		m.addObject("allCategories", allCategories);
		m.addObject("smoBlogCategory", smoBlogCategory);
		m.addObject("listOfBlogsByCategory", listOfBlogsByCategory);
		m.addObject("blogComments", blogComments);
		int effectiveCount = (int) (count / 10);
		m.addObject("count", effectiveCount);
		m.addObject("page", pageId);
		m.addObject("category", category);
		m.setViewName("blogCategoryHome");
		return m;

	}

	@RequestMapping(value = "/blogs/{category}/{title}", method = RequestMethod.GET)
	public ModelAndView viewBlog(@PathVariable("category") String category,
			@PathVariable("title") String title) throws SMOException,
			UnknownHostException {
		SMOBlog blog = blogManager.getBlogById(title);
		if (blog == null) {
			throw new SMOException();
		}
		List<SMOComment> comments = commentManager.getCommentByContentId(title);
		List<SMOBlogCategory> allCategories = blogCategoryManager
				.getAllContentCategory();

		ModelAndView m = new ModelAndView();
		HashMap<String, String> smoCategoriesMap = new HashMap<String, String>();
		for (SMOBlogCategory smoBlogCategory : blogCategoryManager
				.getAllContentCategory()) {
			smoCategoriesMap.put(smoBlogCategory.getId(),
					smoBlogCategory.getCategory());
		}

		InetAddress iAddress = InetAddress.getLocalHost();

		List<SMOBlog> relatedBlogs=blogManager.getBlogByCategory(blog.getCategory(), 12);
		if (relatedBlogs.size() < 4) {
			m.addObject("relatedBlogs1", relatedBlogs);
			m.addObject("relatedBlogs2", null);
			m.addObject("relatedBlogs3", null);
		} else {
			m.addObject("relatedBlogs1", relatedBlogs.subList(0, 4));
			if (relatedBlogs.size() < 8) {
				m.addObject(
						"relatedBlogs2",
						relatedBlogs.subList(4,
								relatedBlogs.size()));
				m.addObject("relatedBlogs3", null);
			} else {
				m.addObject("relatedBlogs2",
						relatedBlogs.subList(4, 7));
				if (relatedBlogs.size() < 12) {
					m.addObject(
							"relatedBlogs3",
							relatedBlogs.subList(7,
									relatedBlogs.size()));
				} else {
					m.addObject("relatedBlogs3",
							relatedBlogs.subList(7, 11));

				}
			}
		}
		
		m.addObject("smoCategoriesMap", smoCategoriesMap);
		m.addObject("allCategories", allCategories);
		m.addObject("blog", blog);
		m.addObject("blogComments", comments);
		m.addObject("hostName", iAddress);
		m.setViewName("blog");
		return m;

	}

	@RequestMapping("/searchArticle")
	public ModelAndView searchBlog(@RequestParam("article") String keyword,
			@RequestParam(value = "page", required = false) String page,
			HttpServletRequest request) {
		int pageId = 0;

		try {
			pageId = page == null ? 0 : Integer.parseInt(page) - 1;
		} catch (Exception e) {
			pageId = 0;
		}
		List<SMOBlog> blogs = blogManager.getBlogsByText(keyword, pageId, 0);
		if (blogs == null) {
			blogs = blogManager.getBlogsByRegex(keyword, pageId, 0);
		}
		int count = blogs == null ? 0 : blogs.size();
		int start = ((pageId) * 10) + 1;
		int end = blogs != null
				&& (blogs.size() > start + 10 || blogs.size() == start + 10) ? start + 10
				: blogs.size();

		HashMap<String, Integer> blogComments = new HashMap<String, Integer>();
		List<String> listOfBlogId = new ArrayList<String>();
		ModelAndView m = new ModelAndView();
		if (blogs != null) {
			for (SMOBlog smoBlog : blogs) {
				listOfBlogId.add(smoBlog.getId());
			}
			AggregationResults<DBObject> d = commentManager
					.getCommentCount(listOfBlogId);
			List<DBObject> sd = d.getMappedResults();
			if (sd != null) {
				for (DBObject obj : sd) {
					blogComments.put(obj.get("_id").toString(),
							Integer.parseInt( obj.get("count").toString()));
				}
			}
			m.addObject("latest", blogs.subList(start, end));

		}
		List<SMOBlog> relatedBlogs=blogs;
		if (relatedBlogs.size() < 4) {
			m.addObject("relatedBlogs1", relatedBlogs);
			m.addObject("relatedBlogs2", null);
			m.addObject("relatedBlogs3", null);
		} else {
			m.addObject("relatedBlogs1", relatedBlogs.subList(0, 4));
			if (relatedBlogs.size() < 8) {
				m.addObject(
						"relatedBlogs2",
						relatedBlogs.subList(4,
								relatedBlogs.size()));
				m.addObject("relatedBlogs3", null);
			} else {
				m.addObject("relatedBlogs2",
						relatedBlogs.subList(4, 7));
				if (relatedBlogs.size() < 12) {
					m.addObject(
							"relatedBlogs3",
							relatedBlogs.subList(7,
									relatedBlogs.size()));
				} else {
					m.addObject("relatedBlogs3",
							relatedBlogs.subList(7, 11));

				}
			}
		}
		
		m.addObject("blogComments", blogComments);
		int effectiveCount = (int) (count / 10);
		m.addObject("count", effectiveCount);
		m.addObject("page", pageId);
		m.addObject("keyword", keyword);
		m.setViewName("blogSearch");
		return m;
	}

	@RequestMapping(value = { "{sa}/blogAutoComplete", "/blogAutoComplete" }, method = RequestMethod.GET)
	public @ResponseBody
	String getSearchKeyWords(@RequestParam("keyword") String keyword) {
		List<String> words = new ArrayList<String>();
		List<SMOBlog> blogs = null;
		if (keyword != null) {
			blogs = blogManager.getBlogsByRegex(keyword, 0, 0);
			if (blogs == null || blogs.size() == 0) {
				blogs = blogManager.getBlogsByText(keyword, 0, 0);
			}
		}

		if (blogs != null) {
			for (SMOBlog blog : blogs) {
				words.add(blog.getBlogTitle());
			}
		}

		Gson g = new Gson();
		return g.toJson(words);

	}
}
