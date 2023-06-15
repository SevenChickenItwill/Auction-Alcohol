package com.mid.alcohol.domain.shop;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Products {

	private long pid;
	private String productname;
	private String standard;
	private String unit;
	private long price;
	private String brand;
	private String userid;
	private String expirationdate;
	private long alcohol_level;
	private String hashtag;
	private String photopath;
	
}
