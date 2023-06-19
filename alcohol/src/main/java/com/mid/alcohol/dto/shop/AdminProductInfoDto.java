package com.mid.alcohol.dto.shop;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminProductInfoDto {
	private int pid;
	private String productname;
	private String standard;
	private int price;
	private String brand;
	private int basketid;
	private int quantity;
	private String username;
	private String useraddress;
	private String userphone;
	private String useremail;
	private int status;

}
