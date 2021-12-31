package mvc.bb.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.database.DBConnection;

//싱글톤
public class BbDAO {
	//1.자신타입의 static 필드 선언
	private static BbDAO instance;
	//2.default생성자를 private으로 선언
	private BbDAO() {}
	//3.public 접근제어타입의 getInstance()메소드 선언, getInstance()로만 접근
	public static BbDAO getInstance() {
		if(instance==null) instance = new BbDAO(); //선언만해서 객체가 없기때문에 객체생성
		return instance;
	}
	
	//MySQL의 회원정보 얻기
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String name = null;
		String sql = "select * from member where cid like concat('%',?,'%')";
		
		try { //MySQL 접속용 DBConnection객체
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("cname"); //rs.getString(칼럼명);
			}
			return name; //값을 DB에서 얻어왔으면 name을 리턴, 아니면 null값 그대로 리턴
		} catch (Exception e) {
			System.out.println("에러0:"+e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return null;
	}
	//DB에 저장하는 메소드
	public void insertBb(BbDTO Bb) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="";
		String updateSql="";
		
		if(Bb.getRef()==0) {
			//원글 신규입력
			sql = "insert into Bb(num,writer,subject,content,password,reg_date,ip,ref,re_step,re_level) "
				+ " values((select num from(select max(num)+1 as num from bb) a),?,?,?,?,?,?,(select ref from(select max(ref)+1 as ref from bb) a),?,?)";
		}else {
			//원글중에 댓글이 있으면, 신규 댓글 입력 전에 등록하려는 댓글과 같은 ref 그룹의 기존 댓글 스텝을 1씩 증가 처리
			//->새로운 댓글이 추가되면 새로운 댓글이 1이 되고 전에 등록했던 댓글은 update처리로 +1이 되어 2가 됨
			updateSql = "update Bb set re_step=re_step+1 where ref=? and re_step > ? ";
			
			//원글에 대한 댓글 입력
			sql = "insert into Bb(num,writer,subject,content,password,reg_date,ip,ref,re_step,re_level) "
					+" values((select num from(select max(num)+1 as num from bb) a),?,?,?,?,?,?,?,?,?)";
		}
		try {
			//1. Oracle dbconnection 맺기
			conn = DBConnection.getConnection();
			if(Bb.getRef()==0) { //신규글 등록 처리
				//2. sql 전달객체 생성
				pstmt = conn.prepareStatement(sql);
				//3. sql문의 바인딩 변수 세팅
				pstmt.setString(1, Bb.getWriter());
				pstmt.setString(2, Bb.getSubject());
				pstmt.setString(3, Bb.getContent());
				pstmt.setString(4, Bb.getPassword());
				pstmt.setString(5, Bb.getReg_date());
				pstmt.setString(6, Bb.getIp());
				//신규 등록시 글번호=ref, re_step=0, re_level=0
				pstmt.setInt(7, 0); //신규등록시 re_step=0
				pstmt.setInt(8, 0); //신규등록시 re_level=0
				
				//4. 쿼리 객체 전달 및 실행
				pstmt.executeUpdate();
			}else {
				//기존 댓글 update처리
				pstmt = conn.prepareStatement(updateSql);
				pstmt.setInt(1, Bb.getRef());
				pstmt.setInt(2, Bb.getRe_step());
				
				//update처리
				pstmt.executeUpdate();
				
				//댓글 입력 처리
				pstmt = conn.prepareStatement(sql);
				System.out.println("sql:"+sql);
				
				pstmt.setString(1, Bb.getWriter());
				pstmt.setString(2, Bb.getSubject());
				pstmt.setString(3, Bb.getContent());
				pstmt.setString(4, Bb.getPassword());
				pstmt.setString(5, Bb.getReg_date());
				pstmt.setString(6, Bb.getIp());
				//신규 등록시 글번호=ref, re_step=0, re_level=0
				pstmt.setInt(7, Bb.getRef());
				pstmt.setInt(8, Bb.getRe_step()+1); //댓글 등록시 re_step=re_step+1
				pstmt.setInt(9, Bb.getRe_level()+1); //댓글 등록시 re_level=re_level+1
				
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("에러1:"+e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} //insertBb()메소드 끝.
	
	//BbList출력 메소드
	public List<BbDTO> getBbList(int pageNum, int limit, String items, String text) {
		List<BbDTO> bblist = new ArrayList<BbDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="";
		
		if((items==null && text==null)||( items.length()==0 || text.length()==0)) {//검색 조건이 파라미터로 넘어오지 않은 경우
			sql = "select * from bb where num  order by ref desc, re_step asc limit ?, ?";// limit num, 한 화면에 나타날 개수(10개)
			
		}else { //검색 조건이 파라미터로 넘어온 경우  //MySQL : concat('%',?,'%') = Oracle : '%'||%||'%'
			sql = "select * from bb where "+items+" like concat('%',?,'%') order by ref desc, re_step asc limit ?, ?";
		 }
		System.out.println("sql:"+sql);
		
		//페이지 번호로 해당 페이지의 시작 글번호와 끝 글번호 구하기
		int start = (pageNum-1)*limit; //예)3페이지 -> (3-1)*10=20, 1페이지 ->0
		int index = start +1; //예)index=21, 1
		int end = index +9; //예)21+9=30, 1+9=10

		System.out.println("index:"+index);
		System.out.println("end:"+end);
		
		try {
			//1.OracleDB 연결객체 생성
			conn = DBConnection.getConnection();
			if((items==null && text==null)||( items.length()==0 || text.length()==0)) {
				System.out.println("a");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start); //시작하는 화면 번호
				pstmt.setInt(2, 10); //한 화면에 나타낼 글 
			}else {
				System.out.println("b");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, text);
				pstmt.setInt(2, start);
				pstmt.setInt(3, 10);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BbDTO bb = new BbDTO();
				bb.setNum(rs.getInt(1));
				bb.setWriter(rs.getString(2));
				bb.setSubject(rs.getString(3));
				bb.setContent(rs.getString(4));
				bb.setReadcount(rs.getInt(5));
				bb.setPassword(rs.getString(6));
				bb.setReg_date(rs.getString(7));
				bb.setIp(rs.getString(8));
				bb.setRef(rs.getInt(9));
				bb.setRe_step(rs.getInt(10));
				bb.setRe_level(rs.getInt(11));

				//리스트에 추가
				bblist.add(bb);
			}
		}catch (Exception e) {
			System.out.println("에러2:"+e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close(); if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return bblist;
	}//getBbList() 끝
	
	public int getBbCount(int pageNum, int limit, String items, String text) {
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="";
		
		if((items==null && text==null)||( items.length()==0 || text.length()==0)) {//검색 조건이 파라미터로 넘어오지 않은 경우
			sql = "select count(*) from bb ";	
		}else { //검색 조건이 파라미터로 넘어온 경우 
			sql = "select count(*) "
				+ " from bb "
				+ " where "+items+" like concat('%',?,'%') ";
		 }
		System.out.println("sql:"+sql);
		
		//페이지 번호로 해당 페이지의 시작 글번호와 끝 글번호 구하기
		int start = (pageNum-1)*limit; //예)3페이지 -> (3-1)*10=20, 1페이지 ->0
		int index = start +1; //예)index=21, 1
		int end = index +9; //예)21+9=30, 1+9=10
		
		try {
			//1.OracleDB 연결객체 생성
			conn = DBConnection.getConnection();
			if((items==null && text==null)||( items.length()==0 || text.length()==0)) {
				pstmt = conn.prepareStatement(sql);
			}else {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, text);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//DB로부터 게시글 건수를 가져와서 count에 저장
				count = rs.getInt(1);
			}
		}catch (Exception e) {
			System.out.println("에러3:"+e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close(); if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return count;
	} //getBbCount() 끝

	//글 조회수 증가 처리
	public void updateBbReadcount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql ="update bb set readcount=readcount+1 where num=?";
		
		try { //조회수 증가 처리
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//update처리
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("에러4:"+e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} //updateBbReadcount() 끝
	
	//글번호에 해당하는 Bb정보 얻기
	public BbDTO getBbByNum(int num, int pageNum) {
		//조회한 게시글 정보 저장 객체 생성
		BbDTO bb=null;
		Connection conn=null;
	    PreparedStatement pstmt=null;
	    ResultSet rs = null;
	    
	    String sql="select * from bb where num=?";
	    System.out.println("sql:"+sql);
	    
	    //조회수 증가 처리
	    //updateBbReadcount(num);
	   
	    try {
	          //1.OracleDB 연결객체 생성
	    	 conn = DBConnection.getConnection();
	    	 pstmt = conn.prepareStatement(sql);
	    	 pstmt.setInt(1, num);//매개변수 넘어온 글번호 설정
	    	 
	    	 rs = pstmt.executeQuery();
	    	 
	    	 if(rs.next()) {
	    		 bb = new BbDTO();
	    		 bb.setNum(rs.getInt(1));
	    		 bb.setWriter(rs.getString(2));
	    		 bb.setSubject(rs.getString(3));
	    		 bb.setContent(rs.getString(4));
	    		 bb.setReadcount(rs.getInt(5));
	    		 bb.setPassword(rs.getString(6));
	    		 bb.setReg_date(rs.getString(7));
	    		 bb.setIp(rs.getString(8));
	    		 bb.setRef(rs.getInt(9));
	    		 bb.setRe_step(rs.getInt(10));
	    		 bb.setRe_level(rs.getInt(11));
	    	 }
	    }catch(Exception e) {
			  System.out.println("에러5:"+e.getMessage());
		  }finally {
			  try {
				    if(rs!=null) rs.close();
				    if(pstmt!=null) pstmt.close();
				    if(conn!=null)conn.close();
			  }catch(Exception e) {
				  throw new RuntimeException(e.getMessage());
			  }
		  } 
		return bb;
	} //getBbByNum() 끝
	
	public int getFirstNum() {
		int minNum=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select ifnull(min(num),0) from bb";	
		System.out.println("sql:"+sql);
		
		try {
			//1.OracleDB 연결객체 생성
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) minNum = rs.getInt(1);
		}catch (Exception e) {
			System.out.println("에러6:"+e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close(); if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return minNum;
	} //getFirstNum() 끝
	
	public int getLastNum() {
		int maxNum=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select ifnull(max(num),0) from bb";	
		System.out.println("sql:"+sql);
		
		try {
			//1.OracleDB 연결객체 생성
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) maxNum = rs.getInt(1);
		}catch (Exception e) {
			System.out.println("에러7:"+e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close(); if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return maxNum;
	} //getLastNum() 끝
	
	//Bb 수정 처리
	public void updateBb(BbDTO Bb) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql ="update Bb set writer=?, subject=?, content=?, ip=? where num=?";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Bb.getWriter());
			pstmt.setString(2, Bb.getSubject());
			pstmt.setString(3, Bb.getContent());
			pstmt.setString(4, Bb.getIp());
			pstmt.setInt(5, Bb.getNum());
			
			//update처리
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("에러8:"+e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} //updateBb() 끝
	
	//Bb 삭제 처리
	public void deleteBb(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String replyCountSql = "select count(*) from bb where ref = ? and re_step>0;";
		String sql ="delete from bb where num=?";
		
		try { //삭제 처리
			conn = DBConnection.getConnection();
			
			System.out.println("sql:"+sql);
			//댓글 존재 여부 확인
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			int replyCount = 0;
			if(rs.next()) replyCount = rs.getInt(1);
			if(replyCount == 0) { //댓글이 없는 글들만 삭제
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("에러9:"+e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} //deleteBb() 끝

}