package org.bsns.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	
	private int bno, cno;
	private String commenter, comment, deleteyn;
	private Date regdate, updatedate;
	
}
