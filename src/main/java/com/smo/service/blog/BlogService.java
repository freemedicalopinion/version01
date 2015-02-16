package com.smo.service.blog;

import java.util.List;
import java.util.Map;

import com.smo.model.SMOBlog;

public interface BlogService {

	public SMOBlog getBlogById(String id);

	public String addBlog(SMOBlog blog);

	public List<SMOBlog> getBlogByCategoryForHomepage(String blogCategory,
			int count);

	public Map<String, SMOBlog> getLatestBlogForHomepage(List<String> categories);

	public List<SMOBlog> getLatestContentByType(String type, int limit);

	public List<SMOBlog> getAllBlogs();

	public List<SMOBlog> getLatestBlogByCategory(String category, int page,
			int size);

	public List<SMOBlog> getLatestBlogByCategory(String category, int size);

	public SMOBlog getBlogByTitleAndCategory(String title, String ccategory);

	public List<SMOBlog> getBlogsForLoggedInUser(String user);

	public void deleteContent(String id);

	public List<SMOBlog> getBlogsByText(String keyWord, int page, int size);

	public List<SMOBlog> getBlogsByRegex(String keyWord, int page, int size);
	
	public long getCountByCategory(String category);
	public List<SMOBlog> getLatestBlogByAuthor(String author, int count);

}
