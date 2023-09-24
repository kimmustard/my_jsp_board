package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.CommentVO;
import service.CommentSerivce;
import service.CommentServiceImpl;


@WebServlet("/cmt/*")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final Logger log = LoggerFactory.getLogger(CommentController.class);
	
	private CommentSerivce csv;
	private int isOk;
	

    public CommentController() {
       csv = new CommentServiceImpl();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String pathUri = uri.substring("/cmt/".length());
		String path = pathUri;
		String pathVar = "";
		if(pathUri.contains("/")) {
			path = pathUri.substring(0, pathUri.lastIndexOf("/"));
			pathVar = pathUri.substring(pathUri.lastIndexOf("/")+1);
		}
		
		log.info("uri = {}", uri);	///cmt/list/글번호
		log.info("path = {}", path);	//list 
		log.info("pathUri = {}", pathUri);	// list/글번호
		log.info("pathVar = {}", pathVar);	// 글번호
		
		
		
		switch(path) {
			case "post":
				
				try {
					log.info("post check 1 ");
					StringBuffer sb = new StringBuffer();
					String line = "";
					BufferedReader br = request.getReader();
					while((line = br.readLine()) != null) {
						sb.append(line);
					}
					log.info("sb = {} ", sb.toString());
					
					JSONParser parser = new JSONParser();
					JSONObject jsonObj = (JSONObject) parser.parse(sb.toString());
					
					int bno = Integer.parseInt(jsonObj.get("bno").toString());
					String writer = jsonObj.get("writer").toString();
					String content = jsonObj.get("content").toString();
					CommentVO cvo = new CommentVO(bno , writer, content);
					log.info("cvo = {}" , cvo);
					isOk = csv.post(cvo);
					log.info((isOk > 0) ? "Ok" : "Fail");
					
					PrintWriter pw = response.getWriter();
					pw.print(isOk);
	
					
				} catch (Exception e) {
					log.info("Comment Error");
					e.printStackTrace();
				}
				
				
				break;

				
			case "list":
				try {
					log.info("Comment List check 1");
					int bno = Integer.parseInt(pathVar);	//     list/ 타고 들어온 숫자를 캐치
					List<CommentVO> list = csv.getList(bno);
					log.info("Comment , List = {}" , list);
					
					//JSON 형태로 변환 -> 전송
					JSONObject[] jsonObjArr = new JSONObject[list.size()];
					
					JSONArray jsonList = new JSONArray();
					for (int i=0; i<list.size(); i++) {
						
						//JSON 보내기전 key : value 형태로...
						jsonObjArr[i] = new JSONObject();
						jsonObjArr[i].put("cno", list.get(i).getCno());
						jsonObjArr[i].put("bno", list.get(i).getBno());
						jsonObjArr[i].put("writer", list.get(i).getWriter());
						jsonObjArr[i].put("content", list.get(i).getContent());
						jsonObjArr[i].put("regdate", list.get(i).getRegdate());
						jsonObjArr[i].put("cmt_recommend", list.get(i).getCmt_recommend());
					
						//변경한것들 마지막으로 내보낼 리스트에 넣기
						jsonList.add(jsonObjArr[i]);
					}
					
					//JSON 값을 String으로 변환(전송용)
					String jsonData = jsonList.toJSONString();
					
					//전송 객체에 싣고 화면으로 전송
					PrintWriter out = response.getWriter();
					out.print(jsonData);
							
					
					
					
				} catch (Exception e) {
					log.info("list Error");
					e.printStackTrace();
				}
				
				break;

			case "modify":
				try {
					log.info("Commnet modify check 1");
					StringBuffer sb = new StringBuffer();
					String line = "";
					
					BufferedReader br = request.getReader();
					while((line = br.readLine()) != null) {
						sb.append(line);
					}
					log.info("Modify sb = {}" , sb.toString());
					
					JSONParser parser = new JSONParser();
					JSONObject jsonObj = (JSONObject) parser.parse(sb.toString());
					
					int cno = Integer.parseInt(jsonObj.get("cno").toString());
					String content = jsonObj.get("content").toString();
					
					CommentVO cvo = new CommentVO(cno, content);
					log.info("modify cvo = {}" , cvo);
					
					isOk = csv.modify(cvo);
					log.info((isOk > 0)? "Ok" : "Fail");
					
					PrintWriter out = response.getWriter();
					out.print(isOk);
					
	
				} catch (Exception e) {
					log.info("Comment modify Error");
					e.printStackTrace();
				}
				
				
				break;
				
				
			case "remove":
				try {
					log.info("Comment remove check 1");
					int cno = Integer.parseInt(pathVar);
					isOk = csv.remove(cno);
					log.info((isOk > 0)? "Ok" : "Fail");
					
					PrintWriter out = response.getWriter();
					out.print(isOk);
					
					
				} catch (Exception e) {
					log.info("Comment remove Error");
					e.printStackTrace();
				}
				
				break;
		
		}

		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
