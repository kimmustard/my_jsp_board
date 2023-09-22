package handler;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileHandler {
	
	private static final Logger log = LoggerFactory.getLogger(FileHandler.class);
	
	
	public int deleteFile(String imageFileName, String savePath) {
		
		boolean isDel = true;
		log.info("imageFileName = {}", imageFileName);
		
		File fileDir = new File(savePath);
		File removeFile = new File(fileDir+File.separator+imageFileName);
		File removeThFile = new File(fileDir+File.separator+"_th_"+imageFileName);
		
		
		if(removeFile.exists() || removeThFile.exists()) {
			isDel =  removeFile.delete();
			log.info("removeFile isDel = {}", (isDel ? "Ok" : "Fail"));
			
			//썸네일삭제
			if(isDel) {
				isDel = removeThFile.delete();
			}
			log.info("removeThFile isDel = {}", (isDel ? "Ok" : "Fail"));
			
		}
		
		log.info("remove File Ok");
		return isDel ? 1: 0;
	}
}
