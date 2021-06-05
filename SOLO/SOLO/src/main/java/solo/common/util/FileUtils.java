package solo.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Component("fileUtils")
public class FileUtils {
	
	
	  private static final String filePath = "C:\\Spring\\workspace\\MUSCLE\\src\\main\\webapp\\img\\goods_upload\\";
	  
	  public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map,
	  HttpServletRequest request) throws Exception {
	  
		  MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    	
	    	MultipartFile multipartFile = null;
	    	String originalFileName = null;
	    	String originalFileExtension = null;
	    	String storedFileName = null;
	    	
	    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	        Map<String, Object> listMap = null; 
	        
	        String file_parent = (String)map.get("IDX");
	 
	        System.out.println("file_parent="+(String)map.get("IDX"));

	        File file = new File(filePath);
	        if(file.exists() == false){
	        	file.mkdirs();
	        }
	        
	        while(iterator.hasNext()){
	        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	        	if(multipartFile.isEmpty() == false){
	        		originalFileName = multipartFile.getOriginalFilename();
	        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
	        		
	        		file = new File(filePath + storedFileName);
	        		multipartFile.transferTo(file);
	        		
	        		listMap = new HashMap<String,Object>();
	        		listMap.put("BOARD_NUM", file_parent);
	        		listMap.put("FILE_ORG", originalFileName);
	        		listMap.put("FILE_STD", storedFileName);
	        		listMap.put("FILE_SIZE", multipartFile.getSize());
	        		list.add(listMap);
	        	}
	        }
			return list;
		}
}
