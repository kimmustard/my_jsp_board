package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import handler.FileHandler;
import handler.PagingHandler;
import net.coobird.thumbnailator.Thumbnails;
import service.BoardServiceImpl;
import service.Service;


@WebServlet("/brd/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	private RequestDispatcher rdp;
	private Service bsv;
	private String destPage = "";
	private int isOk;
	
	private String savePath;
	private FileHandler fileHandler;

	
	
	
    
    public BoardController() {
    	bsv = new BoardServiceImpl();
    	fileHandler = new FileHandler();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1);
		log.info("path = {}", path);
		
		switch(path) {
		
			case "home":
				
				try {
					String writer = request.getParameter("writer");
					List<BoardVO> myList = bsv.getMyList(writer);
					request.setAttribute("mylist", myList);
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				destPage = "/index.jsp";
				
			break;
		
			case "register":
				destPage = "/board/register.jsp";
				break;
				
			case "insert":
				try {
					log.info("register check 1");
					savePath = getServletContext().getRealPath("/_fileUpload");
					File fileDir = new File(savePath);
					log.info("savePath = {}" , savePath);
					
					DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
					fileItemFactory.setRepository(fileDir);
					fileItemFactory.setSizeThreshold(2*1024*1024);
					BoardVO bvo = new BoardVO();
					
					ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
					List<FileItem> itemList = fileUpload.parseRequest(request);
					
					for (FileItem item : itemList) {
						switch(item.getFieldName()) {
							case "title":
								bvo.setTitle(item.getString("utf-8"));
								break;
							case "writer":
								bvo.setWriter(item.getString("utf-8"));
								break;
							case "content":
								bvo.setContent(item.getString("utf-8"));
								break;
							case "image_file":
								if(item.getSize()>0) {
									String fileName = item.getName().substring(item.getName().lastIndexOf("/")+1);
									fileName = System.currentTimeMillis()+"_"+fileName;
									File uploadFilePath = new File(fileDir+File.separator+fileName);
									log.info("uploadFilePath = {}", uploadFilePath);
									
									try {
										item.write(uploadFilePath);
										bvo.setImage_File(fileName);
										
										Thumbnails.of(uploadFilePath).size(60, 60)
										.toFile(new File(fileDir+File.separator+"_th_"+fileName));
									} catch (Exception e) {
										log.info("file writer on disk Error!");
										e.printStackTrace();
									}
									
									
								}
								
								break;
						}
						
					}
					
					isOk = bsv.register(bvo);
					log.info("insert " + (isOk>0 ? "Ok" : "Fail"));
					destPage = "pageList";
					
					
					
				} catch (Exception e) {
					log.info("insert Error!");
					e.printStackTrace();
				}	
				
				break;
				
				
			case "pageList":
				try {
					log.info("pageList check 1");
					PagingVO pgvo = new PagingVO();
					if(request.getParameter("pageNo")!= null) {
						int pageNo = Integer.parseInt(request.getParameter("pageNo"));
						int qty = Integer.parseInt(request.getParameter("qty"));
						pgvo = new PagingVO(pageNo, qty);
					}
				
				String type = request.getParameter("type");
				String keyword = request.getParameter("keyword");
				pgvo.setType(type);
				pgvo.setKeyword(keyword);
					
					
				int totalCount = bsv.getTotalCount(pgvo);	//DB 모든 게시물 숫자 요청
				log.info("totalCount  = {}", totalCount);
				List<PagingVO> list = bsv.getPageList(pgvo);
				request.setAttribute("list", list);
				
				PagingHandler ph = new PagingHandler(pgvo, totalCount);
				request.setAttribute("ph", ph);
				log.info("pageList check 4");
				destPage = "/board/list.jsp";
					
					
				} catch (Exception e) {
					log.info("page List Error!");
					e.printStackTrace();
				}
				
				
				break;
				
				
				
			case "list":
				try {
					log.info("list check 1");
					List<BoardVO> list = bsv.getList();
					request.setAttribute("list", list);
					log.info("list check 4");
					destPage= "/board/list.jsp";
					
				} catch (Exception e) {
					log.info("list Error!");
					e.printStackTrace();
				}
				
				break;
				
			case "detail":
				
				try {
					log.info("detail check 1");
					int bno = Integer.parseInt(request.getParameter("bno"));
					BoardVO bvo = bsv.detail(bno);
					request.setAttribute("bvo", bvo);
					log.info("detail check 4");
					destPage = "/board/detail.jsp";
					
					
				} catch (Exception e) {
					log.info("detail Error!");
					e.printStackTrace();
				}
				
				break;
				
				
			case "ncdetail":
				
				try {
					log.info("detail check 1");
					int bno = Integer.parseInt(request.getParameter("bno"));
					BoardVO bvo = bsv.ncdetail(bno);
					request.setAttribute("bvo", bvo);
					log.info("detail check 4");
					destPage = "/board/detail.jsp";
						
						
				} catch (Exception e) {
					log.info("detail Error!");
					e.printStackTrace();
				}
				
			break;
				

			case "recommend":
				try {
					
					destPage = "/board/detail.jsp";
				} catch (Exception e) {
					log.info("recommend Error!");
					e.printStackTrace();
				}
				
				
				break;
			
			case "modify":
				
				try {
					int bno = Integer.parseInt(request.getParameter("bno"));
					BoardVO bvo = bsv.detail(bno);
					request.setAttribute("bvo", bvo);
					destPage="/board/modify.jsp";
					
				} catch (Exception e) {
					log.info("modify Page Error!");
					e.printStackTrace();
				}
				
				
				break;
				
			case "edit":
				try {
					log.info("modify check 1");
					savePath = getServletContext().getRealPath("/_fileUpload");
					
					File fileDir = new File(savePath); 
					DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
					fileItemFactory.setRepository(fileDir);
					fileItemFactory.setSizeThreshold(2*1024*1024);
					
					BoardVO bvo = new BoardVO();
					
					ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
					List<FileItem> itemList = fileUpload.parseRequest(request);
					
					String old_file = null;
					
					for (FileItem item : itemList) {
						switch(item.getFieldName()) {
							case "bno":
								bvo.setBno(Integer.parseInt(item.getString("utf-8")));
								break;
							case "title":
								bvo.setTitle(item.getString("utf-8"));
								break;
							case "content":
								bvo.setContent(item.getString("utf-8"));
								break;
							case "image_file":
								old_file = item.getString("utf-8");
								break;
							case "new_file":
								if(item.getSize()>0) {
									if(old_file != null) {
										isOk = fileHandler.deleteFile(old_file, savePath);	
									}
									String fileName = item.getName()
											.substring(item.getName().lastIndexOf(File.separator)+1);
									
									log.info("fileName = {} ", fileName);
									
									fileName = System.currentTimeMillis()+"_"+fileName;
									
									File uploadFilePath = new File(fileDir+File.separator+fileName);
									
									try {
										item.write(uploadFilePath);
										bvo.setImage_File(fileName);
										
										Thumbnails.of(uploadFilePath)
										.size(60,60)
										.toFile(new File(fileDir+File.separator+"_th_"+fileName));
										
									} catch (Exception e) {
										log.info("new File save Error!");
										e.printStackTrace();
									}
									
								}else {
									bvo.setImage_File(old_file);
								}
								break;
						}
					}
					log.info("bvo = {}" , bvo);
					
					isOk = bsv.edit(bvo);
					log.info((isOk > 0)? "Ok" : "Fail");
					destPage = "list";
					
		
				} catch (Exception e) {
					log.info("modify Error!");
					e.printStackTrace();
				}
				break;
				
			case "remove":
				
				try {
					savePath = getServletContext().getRealPath("/_fileUpload");
					int bno = Integer.parseInt(request.getParameter("bno"));
					BoardVO bvo = bsv.detail(bno);
					String fileName = bvo.getImage_File();
					isOk = fileHandler.deleteFile(fileName, savePath);
					log.info("remove fileHandler :: " , (isOk > 0)? "Ok" : "Fail");
					
					isOk = bsv.remove(bno);
					log.info("remove DB :: " , (isOk > 0)? "Ok" : "Fail");
					destPage = "list";
					
				} catch (Exception e) {
					log.info("remove Error!");
					e.printStackTrace();
				}
				
				break;

		}
		
		rdp = request.getRequestDispatcher(destPage);
		rdp.forward(request, response);
		
	}
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request,response);
	}

}
