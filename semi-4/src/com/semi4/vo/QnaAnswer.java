package com.semi4.vo;

public class QnaAnswer {

	private QnaBoard qnaBoard;
	private String content;
	private Admin admin;

	public QnaAnswer() {
	}

	public QnaBoard getQnaBoard() {
		return qnaBoard;
	}

	public void setQnaBoard(QnaBoard qnaBoard) {
		this.qnaBoard = qnaBoard;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

}
