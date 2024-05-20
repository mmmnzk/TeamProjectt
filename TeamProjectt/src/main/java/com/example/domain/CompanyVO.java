package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CompanyVO {
	
	private long cno;
	private String owner;
	private int profit;
	private Date established_date;
	private String information;
	private String c_name;
	private String c_address;
	private String logo;
	private int stock;
	private String debut;
	private int rank;
	private int capital;
	
}
