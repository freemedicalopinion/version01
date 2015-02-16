package com.smo.service.comment;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.stereotype.Service;

import com.mongodb.DBObject;
import com.smo.model.SMOComment;
import com.smo.repository.CommentCustomQuery;
import com.smo.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentRepository commentRepository;
	@Autowired
	CommentCustomQuery commentCustomQuery;

	@Override
	public void saveComment(SMOComment comment) {
		commentRepository.save(comment);

	}

	@Override
	public List<SMOComment> getCommentByContentId(String contentId) {

		return commentRepository.findByContentId(contentId);
	}

	@Override
	public List<SMOComment> getLatestComment(int count) {
		List<SMOComment> listToreturn = new ArrayList<SMOComment>();
		long totalRecord = commentRepository.count();
		int starting = (int) ((totalRecord / 10));
		if (starting > 0) {
			starting -= 1;
		}
		Page<SMOComment> k = commentRepository.findAll(new PageRequest(
				starting, count, new Sort(Sort.Direction.DESC, "createdDate")));
		if (k != null) {
			listToreturn = k.getContent();
		}

		while (k != null && k.getSize() < count && k.getSize() < totalRecord
				&& starting > 0) {
			starting--;
			Page<SMOComment> k1 = commentRepository.findAll(new PageRequest(
					starting, count - k.getSize(), new Sort(
							Sort.Direction.DESC, "createdDate")));
			if (k1 != null) {
				listToreturn.addAll(k1.getContent());
			}

		}

		return listToreturn;

	}

	@Override
	public AggregationResults<DBObject> getCommentCount(String... blogIds) {
		// TODO Auto-generated method stub
		return commentCustomQuery.getCommentsCount(blogIds);
	}

}
