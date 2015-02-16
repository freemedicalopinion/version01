package com.smo.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.stereotype.Component;

import com.mongodb.DBObject;
import com.smo.constant.AppConstants;
import com.smo.model.SMOComment;
import com.smo.service.comment.CommentService;

@Component
public class CommentManager {
	@Autowired
	CommentService commentService;

	public void addComment(SMOComment comment) {
		commentService.saveComment(comment);
	}

	public List<SMOComment> getCommentByContentId(String contentId) {
		return commentService.getCommentByContentId(contentId);
	}

	public List<SMOComment> getCommentForBlogHomePage() {
		return commentService
				.getLatestComment(AppConstants.commentCountForBlogHomePage);
	}
	public AggregationResults<DBObject> getCommentCount(List<String> blogIds) {
		String[] array=new String[blogIds.size()];
		 array=blogIds.toArray(array);
		return commentService.getCommentCount(array);
	}
	
	public List<SMOComment> getLatestComments(int limit){
		return commentService.getLatestComment(limit);
	}
	

}
