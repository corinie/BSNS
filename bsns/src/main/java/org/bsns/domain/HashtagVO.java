package org.bsns.domain;

import java.util.Date;

import lombok.Data;

@Data
public class HashtagVO {
	
	private int bno;
	private String mid, tagname, status, deleteyn;
	private Date regdate, updatedate;

}
