package org.bsns.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno;
	private String writer, content, deleteyn;
	private Date regdate, updatedate;
	private List<PhotoVO> pvo;
	private List<HashtagVO> hvo;

}
