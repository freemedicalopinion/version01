package com.smo.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.TextIndexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.TextScore;

@Document
public class SMOContent implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 443892913796796261L;
	@Id
	private String id;
	@TextIndexed
	private String blogTitle;
	@TextIndexed(weight=2)
	private String subTitle;
	private String summary;
	@TextIndexed(weight=2)
	private List<String> keyWords = new ArrayList<String>();
	private List<String> tags = new ArrayList<String>();
	private Date date;
	private String content;
	private boolean publish=false;
	private boolean pendingApproval=false;
	private boolean rejected=false;
	private String bigImage;
	private String mediumImage;
	private String thumbImage;
	/** News or Blog */
	private List<String> contentType;
	private String author;
	private Date updatedDate;
	private Date createdDate;
	private boolean isDraftOfPublishedContent=false;
	private String refrenceId;
	@TextScore
	Float score;

	public void addTags(List<String> moreTags) {
		this.tags.addAll(moreTags);
	}

	public void addTag(String tag) {
		this.tags.add(tag);
	}

	public void removeTag(String tag) {
		if (this.tags.contains(tag)) {
			tags.remove(tag);
		}
	}

	public void removeTags(List<String> deleteTags) {
		if (this.tags.containsAll(deleteTags)) {
			tags.removeAll(deleteTags);
		}
	}

	public void addKeyWords(List<String> morekeyWords) {
		this.keyWords.addAll(morekeyWords);
	}

	public void addKeyWord(String keyWord) {
		this.keyWords.add(keyWord);
	}

	public void removeKeyWord(String keyWord) {
		if (this.keyWords.contains(keyWord)) {
			keyWords.remove(keyWord);
		}
	}

	public void removeKeyWords(List<String> deletekeyWords) {
		if (this.keyWords.containsAll(deletekeyWords)) {
			keyWords.removeAll(deletekeyWords);
		}
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the summary
	 */
	public String getSummary() {
		return summary;
	}

	/**
	 * @param summary
	 *            the summary to set
	 */
	public void setSummary(String summary) {
		this.summary = summary;
	}

	/**
	 * @return the subTitle
	 */
	public String getSubTitle() {
		return subTitle;
	}

	/**
	 * @param subTitle
	 *            the subTitle to set
	 */
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	/**
	 * @return the keyWords
	 */
	public List<String> getKeyWords() {
		return keyWords;
	}

	/**
	 * @param keyWords
	 *            the keyWords to set
	 */
	public void setKeyWords(List<String> keyWords) {
		this.keyWords = keyWords;
	}

	/**
	 * @return the tags
	 */
	public List<String> getTags() {
		return tags;
	}

	/**
	 * @param tags
	 *            the tags to set
	 */
	public void setTags(List<String> tags) {
		this.tags = tags;
	}

	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}

	/**
	 * @param date
	 *            the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content
	 *            the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the publish
	 */
	public boolean isPublish() {
		return publish;
	}

	/**
	 * @param publish
	 *            the publish to set
	 */
	public void setPublish(boolean publish) {
		this.publish = publish;
	}

	/**
	 * @return the bigImage
	 */
	public String getBigImage() {
		return bigImage;
	}

	/**
	 * @param bigImage
	 *            the bigImage to set
	 */
	public void setBigImage(String bigImage) {
		this.bigImage = bigImage;
	}

	/**
	 * @return the mediumImage
	 */
	public String getMediumImage() {
		return mediumImage;
	}

	/**
	 * @param mediumImage
	 *            the mediumImage to set
	 */
	public void setMediumImage(String mediumImage) {
		this.mediumImage = mediumImage;
	}

	/**
	 * @return the thumbImage
	 */
	public String getThumbImage() {
		return thumbImage;
	}

	/**
	 * @param thumbImage
	 *            the thumbImage to set
	 */
	public void setThumbImage(String thumbImage) {
		this.thumbImage = thumbImage;
	}

	/**
	 * @return the contentType
	 */
	public List<String> getContentType() {
		return contentType;
	}

	/**
	 * @param contentType
	 *            the contentType to set
	 */
	public void setContentType(List<String> contentType) {
		this.contentType = contentType;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public boolean isPendingApproval() {
		return pendingApproval;
	}

	public void setPendingApproval(boolean pendingApproval) {
		this.pendingApproval = pendingApproval;
	}

	public boolean isRejected() {
		return rejected;
	}

	public void setRejected(boolean rejected) {
		this.rejected = rejected;
	}

	

	public String getRefrenceId() {
		return refrenceId;
	}

	public void setRefrenceId(String refrenceId) {
		this.refrenceId = refrenceId;
	}

	public boolean isDraftOfPublishedContent() {
		return isDraftOfPublishedContent;
	}

	public void setDraftOfPublishedContent(boolean isDraftOfPublishedContent) {
		this.isDraftOfPublishedContent = isDraftOfPublishedContent;
	}
	public boolean getIsDraftOfPublishedContent() {
		return isDraftOfPublishedContent;
	}
	
}
