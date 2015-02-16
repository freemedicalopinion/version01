package com.smo.service.blog;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smo.model.SMOBlog;
import com.smo.model.SMOContent;
import com.smo.repository.BlogCustomQuery;
import com.smo.repository.BlogRepository;
import com.smo.service.blogCategory.BlogCategoryService;

@Service
public class BlogServiceImpl implements BlogService {
	@Autowired
	BlogRepository blogRepository;
	@Autowired
	BlogCategoryService blogCategoryService;
	@Autowired
	BlogCustomQuery blogCustomQuery;

	@Override
	public SMOBlog getBlogById(String id) {

		SMOBlog contents = blogRepository.findOne(id.replace(" ", ""));

		return contents;
	}

	@Override
	public String addBlog(SMOBlog content) {
		SMOContent savedContent = blogRepository.save(content);
		return savedContent.getId();
	}

	@Override
	public List<SMOBlog> getBlogByCategoryForHomepage(String contentCategory,
			int count) {
		/*
		 * long totalRecord = blogRepository.count(); int starting = (int)
		 * ((totalRecord / 10)); if (starting > 0) { starting -= 1; }
		 * List<SMOBlog> k = blogRepository.findByTheCategory(contentCategory,
		 * new PageRequest(starting, count, new Sort(Sort.Direction.DESC,
		 * "date"))); while (k != null && k.size() < count && k.size() <
		 * totalRecord && starting > 0) { starting--;
		 * k.addAll(blogRepository.findByTheCategory(contentCategory, new
		 * PageRequest(starting, count - k.size(), new Sort(
		 * Sort.Direction.DESC, "date")))); }
		 */

		return null;
	}

	@Override
	public Map<String, SMOBlog> getLatestBlogForHomepage(List<String> categories) {

		return blogCustomQuery.getContentForBlogHomePage(categories);
	}

	@Override
	public SMOBlog getBlogByTitleAndCategory(String title, String ccategory) {
		List<SMOBlog> blogs = blogRepository.findByCategoryAndSummary(
				ccategory, title);
		if (blogs != null) {
			return blogs.get(0);
		}
		return null;
	}

	@Override
	public List<SMOBlog> getLatestBlogByCategory(String category, int page,
			int size) {
		return blogCustomQuery.getContentForBlogCategoryPage(category, page,
				size);
	}

	@Override
	public List<SMOBlog> getLatestBlogByCategory(String category, int size) {
		return blogCustomQuery.getContentForBlogCategoryPage(category, size);
	}

	@Override
	public List<SMOBlog> getBlogsForLoggedInUser(String user) {

		return blogRepository.findByAuthor(user);
	}

	@Override
	public void deleteContent(String id) {

		blogRepository.delete(id);
	}

	@Override
	public List<SMOBlog> getBlogsByText(String keyWord, int page, int size) {
		return blogCustomQuery.searchByText(keyWord, page, size);

	}

	@Override
	public List<SMOBlog> getBlogsByRegex(String keyWord, int page, int size) {
		return blogCustomQuery.searchByRegex(keyWord, page, size);

	}

	@Override
	public List<SMOBlog> getAllBlogs() {
		return blogRepository.findAll();
	}

	@Override
	public List<SMOBlog> getLatestContentByType(String type, int limit) {
		List<SMOBlog> latestContent = blogCustomQuery.getLatestContentByType(
				type, limit);
		return latestContent;
	}

	@Override
	public long getCountByCategory(String category) {
		// TODO Auto-generated method stub
		return blogRepository.countByCategoryAndPublish(category,true);
	}

	@Override
	public List<SMOBlog> getLatestBlogByAuthor(String author, int count) {
		
		return blogCustomQuery.getLatestBlogByAuthor(author, count);
	}
}
