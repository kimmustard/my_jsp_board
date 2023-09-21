package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
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
	
	
	
    
    public BoardController() {
    	bsv = new BoardServiceImpl();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1);
		log.info("path = {}", path);
		
		switch(path) {
		
			case "register":
				destPage = "/board/register.jsp";
				break;
				
			case "insert":
				try {
					log.info("register check 1");
					String title = request.getParameter("title");
					String writer = request.getParameter("writer");
					String content = request.getParameter("content");
					BoardVO bvo = new BoardVO(title, writer, content);
					isOk = bsv.register(bvo);
					
					log.info("insert :: " + (isOk>0 ? "Ok" : "Fail"));
					destPage= "/index.jsp";
					
				} catch (Exception e) {
					log.info("insert Error!");
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
