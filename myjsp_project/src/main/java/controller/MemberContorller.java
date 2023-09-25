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
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.MemberVO;
import handler.FileHandler;
import net.coobird.thumbnailator.Thumbnails;
import service.MemberService;
import service.MemberServiceImpl;


@WebServlet("/mem/*")
public class MemberContorller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger log = LoggerFactory.getLogger(MemberContorller.class);
	
	private RequestDispatcher rdp;
	private String destPage = "";
	private int isOk;
	
	private MemberService msv;
	private String savePath;	//프로필 파일 저장 변수
	private FileHandler fileHandler;
	
    public MemberContorller() {
       msv = new MemberServiceImpl();
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
			case "join":
				destPage = "/member/join.jsp";
			break;
			
			case "register":
				try {
					log.info("member register check 1");
					savePath = getServletContext().getRealPath("/_profileUpload");
					File fileDir = new File(savePath);
					log.info("파일 저장 위치 : " + savePath);
					
					DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
					fileItemFactory.setRepository(fileDir);
					fileItemFactory.setSizeThreshold(2*1024*1024);
					MemberVO mvo = new MemberVO();
					
					ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
					List<FileItem> itemList = fileUpload.parseRequest(request);
					
					for (FileItem item : itemList) {
						switch(item.getFieldName()) {
							case "id":
							mvo.setId(item.getString("utf-8"));
								break;
							
							case "pwd":
								mvo.setPwd(item.getString("utf-8"));
								break;
							
							case "email":
								mvo.setEmail(item.getString("utf-8"));
								break;
							
							case "age":
								mvo.setAge(Integer.parseInt(item.getString("utf-8")));
								break;
							
							case "introduce":
								mvo.setIntroduce(item.getString("utf-8"));
								break;
							
							case "profile":
								if(item.getSize() > 0) {
									String fileName = item.getName()
													.substring(item.getName().lastIndexOf("/")+1);
									fileName = System.currentTimeMillis()+"_"+fileName;
									
									File uploadFilePath = new File(fileDir+File.separator+fileName);
									log.info("uploadFilePath = {}" , uploadFilePath);
									
									try {
										item.write(uploadFilePath);
										mvo.setProfile(fileName);
										
										Thumbnails.of(uploadFilePath).size(30, 30)
										.toFile(new File(fileDir+File.separator+"_th_"+fileName));
										
									} catch (Exception e) {
										log.info("profile writer on disk Error!");
										e.printStackTrace();
									}
									
								}
								break;
								
						}
					}
					
					log.info("Member register mvo = {}" , mvo);
					isOk = msv.register(mvo);
					log.info("register " + (isOk>0 ? "Ok" : "Fail"));
					destPage = "/index.jsp";
					
				} catch (Exception e) {
					log.info("member register error!");
					e.printStackTrace();
				}
				break;
				
				
			case "login":
				try {
					log.info("login check 1");
					String id = request.getParameter("id");
					String pwd = request.getParameter("pwd");
					MemberVO mvo = new MemberVO(id, pwd);
					MemberVO loginmvo = msv.login(mvo);
					log.info("loginmvo = {}", loginmvo);
					log.info("login check 4");
					
					
					if(loginmvo != null) {
						HttpSession ses = request.getSession();
						ses.setAttribute("ses", loginmvo);
						ses.setMaxInactiveInterval(600); //로그인 지속 10분
					}else {
						request.setAttribute("msg_login", 0);
					}
					String writer = id;
					List<BoardVO> myList = msv.getMyList(writer);
					request.setAttribute("mylist", myList);
					log.info("myList = {}" , myList);
					
					destPage = "/index.jsp";
					
				} catch (Exception e) {
					log.info("login check error!");
					e.printStackTrace();
				}
				
				
				break;
				
			case "logout":
				try {
					HttpSession ses = request.getSession();
					MemberVO mvo = (MemberVO) ses.getAttribute("ses");
					String id = mvo.getId();
					log.info("id = {} ", id);
					isOk = msv.lastLogin(id);
					log.info("login check4");
					log.info((isOk > 0)? "Ok" : "Fail");
					ses.invalidate();	//세션 끊기
				
					destPage="/index.jsp";

					
				} catch (Exception e) {
					log.info("logout check error!");
					e.printStackTrace();
				}
				break;
				

			case "modify":
				destPage = "/member/modify.jsp";
				break;
				
				
			case "update":
				try {
					log.info("member update check1");

					savePath = getServletContext().getRealPath("/_profileUpload");
					File fileDir = new File(savePath);
					log.info("파일 저장 위치 : " + savePath);
					
					DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
					fileItemFactory.setRepository(fileDir);
					fileItemFactory.setSizeThreshold(2*1024*1024);
					MemberVO mvo = new MemberVO();
					
					ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
					List<FileItem> itemList = fileUpload.parseRequest(request);
					
					String old_profile = null;
					
					for (FileItem item : itemList) {
						switch(item.getFieldName()) {
							case "id":
							mvo.setId(item.getString("utf-8"));
								break;
							
							case "pwd":
								mvo.setPwd(item.getString("utf-8"));
								break;
							
							case "email":
								mvo.setEmail(item.getString("utf-8"));
								break;
							
							case "age":
								mvo.setAge(Integer.parseInt(item.getString("utf-8")));
								break;
							
							case "introduce":
								mvo.setIntroduce(item.getString("utf-8"));
								break;
							
							case "profile":
								old_profile = item.getString("utf-8");
								log.info("old_profile = {}" + old_profile);
								break;
								
							case "new_profile":
								if(item.getSize() > 0) {
									if(old_profile != null ) {
										isOk = fileHandler.deleteFile(old_profile, savePath);
									}
									String fileName = item.getName()
											.substring(item.getName().lastIndexOf(File.separator)+1);
									
									log.info("fileName = {} ", fileName);
									
									fileName = System.currentTimeMillis()+"_"+fileName;
									
									File uploadFilePath = new File(fileDir+File.separator+fileName);
									
									try {
										item.write(uploadFilePath);
										mvo.setProfile(fileName);
										
										Thumbnails.of(uploadFilePath)
										.size(30,30)
										.toFile(new File(fileDir+File.separator+"_th_"+fileName));
										
									} catch (Exception e) {
										log.info("new File save Error!");
										e.printStackTrace();
									}
								}else {
									mvo.setProfile(old_profile);
								}
								break;
								
						}
					}	
					log.info("mvo = {}" , mvo);
					isOk = msv.modify(mvo);
					log.info((isOk > 0)? "Ok" : "Fail");
					destPage = "logout";
					
					
					
				} catch (Exception e) {
					log.info("member update check error!");
					e.printStackTrace();
				}
				break;
				
			case "remove":
				try {
					HttpSession ses = request.getSession();
					MemberVO mvo = (MemberVO) ses.getAttribute("ses");
					savePath = getServletContext().getRealPath("/_profileUpload");
					String fileName = msv.getImage_File(mvo.getId());
					log.info("fileName = {}" , fileName);
					log.info("remove fileName GET check 4");
					isOk = fileHandler.deleteFile(fileName, savePath);
					log.info((isOk > 0)? "Ok" : "Fail");
					
					
					
					log.info("remove check 1");
					isOk = msv.remove(mvo.getId());
					ses.invalidate();
					log.info((isOk > 0)? "Ok" : "Fail");
					destPage = "/index.jsp";
					
					
				} catch (Exception e) {
					log.info("remove check error!");
					e.printStackTrace();
				}
				
				break;
				
				
			case "list":
				
				try {
					log.info("Member List check 1");
					List<MemberVO> list = msv.getList();
					request.setAttribute("list", list);
					
					destPage = "/member/list.jsp";
					
				} catch (Exception e) {
					log.info("list member Error !");
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
