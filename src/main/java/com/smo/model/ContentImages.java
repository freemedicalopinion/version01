package com.smo.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class ContentImages implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MultipartFile bigImage;
	private MultipartFile mediumImage;
	private MultipartFile thumbImage;
	private String contentId;
	private int ispublish;
	/**
	 * @return the bigImage
	 */
	public MultipartFile getBigImage() {
		return bigImage;
	}
	/**
	 * @param bigImage the bigImage to set
	 */
	public void setBigImage(MultipartFile bigImage) {
		this.bigImage = bigImage;
	}
	/**
	 * @return the mediumImage
	 */
	public MultipartFile getMediumImage() {
		return mediumImage;
	}
	/**
	 * @param mediumImage the mediumImage to set
	 */
	public void setMediumImage(MultipartFile mediumImage) {
		this.mediumImage = mediumImage;
	}
	/**
	 * @return the thumbImage
	 */
	public MultipartFile getThumbImage() {
		return thumbImage;
	}
	/**
	 * @param thumbImage the thumbImage to set
	 */
	public void setThumbImage(MultipartFile thumbImage) {
		this.thumbImage = thumbImage;
	}
	/**
	 * @return the contentId
	 */
	public String getContentId() {
		return contentId;
	}
	/**
	 * @param contentId the contentId to set
	 */
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	/**
	 * @return the ispublish
	 */
	public int getIspublish() {
		return ispublish;
	}
	/**
	 * @param ispublish the ispublish to set
	 */
	public void setIspublish(int ispublish) {
		this.ispublish = ispublish;
	}

	
}
