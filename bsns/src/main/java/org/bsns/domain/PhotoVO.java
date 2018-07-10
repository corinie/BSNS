package org.bsns.domain;


import lombok.Data;

@Data
public class PhotoVO {

	private int pno, bno;
	private double lat, lng;
	private String pname, ppath, address, deleteyn, uuid, faceyn;
	
}
