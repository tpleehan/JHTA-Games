package com.semi4.vo;

import java.util.Date;

public class Profit {

	private Date profitDate;
	private Genre genre;
	private Publisher publisher;
	private Integer sales;

	public Profit() {
	}

	public Date getProfitDate() {
		return profitDate;
	}

	public void setProfitDate(Date profitDate) {
		this.profitDate = profitDate;
	}

	public Genre getGenre() {
		return genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}

	public Integer getSales() {
		return sales;
	}

	public void setSales(Integer sales) {
		this.sales = sales;
	}

}
