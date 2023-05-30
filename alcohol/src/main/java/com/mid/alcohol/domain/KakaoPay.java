package com.mid.alcohol.domain;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPay {
	//response
    private String tid, next_redirect_pc_url;
    private Date created_at;
}
