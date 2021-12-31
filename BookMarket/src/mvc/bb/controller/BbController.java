package mvc.bb.controller;

import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.bb.command.BookCommand;

public class BbController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//게시글 페이지당 조회결과 건수 상수 선언
	static final int LISTCOUNT = 10;
	
	//클래스들을 Key는 Command타입이고, 객체는 Command타입으로 저장하기 위한 map생성
	private Map<String, BookCommand> bbcommandMap = new HashMap<>();
	
	//tomcat 기동시 command객체들을 만들어서 commandMap에 저장
	@Override
	public void init() throws ServletException {
		//web.xml의 init-param값 읽어 처리
		String configFile = getInitParameter("BbconfigFile");
		System.out.println("BbconfigFile:"+configFile); //configFile:/WEB-INF/commandHandlerURI.properties

		//<문자열,문자열> 값 읽기 <- properties
		Properties prop = new Properties();
		//File system상의 물리적인 경로
		String configFilePath = getServletContext().getRealPath(configFile);
		//configFilePath:C:\jspWorkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebMarket\WEB-INF\commandHandlerURI.properties
		System.out.println("BbconfigFilePath:"+configFilePath);
		//FileReader:2바이트 문자단위로 읽기 위함/ File system의 properties파일과 문자단위의 입력 스트림 경로 설정(객체 생성)
		try(FileReader fis = new FileReader(configFilePath)) {
			//properties 객체로 저장하기
			prop.load(fis);
			
		/*	System.out.println(prop.get("/BoardListAction.do")); //mvc.command.BoardListAction
			Set keySet = prop.keySet();
			Iterator itor = keySet.iterator();
			while(itor.hasNext()) {
				String key = (String)itor.next();
				System.out.println(key+"="+prop.get(key)); 
			} */
			//properties파일로부터 읽어들인 정보를 추출하여 객체 생성
			Iterator keyItor = prop.keySet().iterator();
			while(keyItor.hasNext()) {
				String command = (String)keyItor.next();
				String className = prop.getProperty(command);
				//System.out.println(command+"="+className);
				Class<?> action = Class.forName(className); //<?> : 모든타입
				//properties의 value에 해당하는 문자열로 객체 생성 /newInstance():객체를 만들어주는 코드
				BookCommand bookCommand = (BookCommand) action.newInstance(); // new mvc.command.BoardUpdateAction();
				bbcommandMap.put(command, bookCommand);
			}
			/*
			System.out.println("저장된 객체수:"+commandMap.size()); //저장된 객체수:7
			
			Iterator it = commandMap.keySet().iterator();
			System.out.println("commandMap에 저장된 객체 정보 출력");
			while(it.hasNext()) {
				String c = (String)it.next();
				Command a = commandMap.get(c);
				System.out.println(c+"="+a.getClass().getName());
			}
			*/
			
			//출력
			Iterator itor = bbcommandMap.keySet().iterator();
			while(itor.hasNext()) {
				String command = (String)itor.next();
				System.out.println(command+"="
				+((BookCommand)bbcommandMap.get(command)).getClass().getName());
				
			}
			
		} catch (Exception e) {
			System.out.println("에러:"+e.getMessage());
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	//~~~.do로 요청하는 모든 request는 BoardController가 제일 먼저 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//문자셋 설정
		request.setCharacterEncoding("utf-8");
		
		//응답으로 생성되는 객체의 문서타입 설정
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		action(request, response);
	} //doGet() 끝
	
	//request요청을 처리하는 메소드
	private void action(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException,IOException {
		String requestURL = request.getRequestURL().toString();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		String queryString 
			= request.getQueryString()==null ? "":request.getQueryString(); //get방식일 때 쿼리스트링 얻기
		
		System.out.println("requestURL: "+requestURL);
		System.out.println("requestURI: "+requestURI);
		System.out.println("contextPath: "+contextPath);
		System.out.println("command: "+command);
		System.out.println("queryString: "+queryString); 
		
		//요청 uri command에 해당하는 클래스 얻기
		BookCommand bookCommand = bbcommandMap.get(command);
		//이동할 view페이지 변수
		String viewPage = null;
		try {
			//command에 해당하는 객체의 action메소드 실행(각 요청의 서비스로 분기 처리) 후 이동페이지 얻기
			viewPage = bookCommand.action(request, response); //다형성을 이용한 메소드 실행
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		if(viewPage!=null) {
			//forward처리
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}