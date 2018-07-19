package org.bsns.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.bsns.domain.PhotoVO;
import org.bsns.domain.ProfileVO;
import org.bsns.service.ProfileService;
import org.bsns.util.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class ProfileController {
	
	@Setter(onMethod_= {@Autowired})
	ProfileService service;

	@PostMapping("/uploadProfile")
	@ResponseBody
	public ResponseEntity<List<ProfileVO>> uploadAjaxPost(MultipartFile[] uploadFile, Principal principal) {
		
		List<ProfileVO> list = new ArrayList<>();
		String uploadFolder = "C:\\zzz\\upload";
		String uploadFolderPath = UploadFileUtils.getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		String mid = principal.getName();
		
		// File.exists check
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		} // make date folder

		for (MultipartFile multipartFile : uploadFile) {
			ProfileVO vo = new ProfileVO();
			vo.setMid(mid);
			String uploadFileName = multipartFile.getOriginalFilename();

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			vo.setPname(uploadFileName);

			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				
				vo.setUuid(uuid.toString());
				vo.setPath(uploadFolderPath);
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
				
				service.insertProfile(vo);
				
				
				list.add(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	

}
