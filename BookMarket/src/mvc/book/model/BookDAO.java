package mvc.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Product;
import mvc.database.DBConnection;
import mvc.model.BoardDTO;

//싱글톤 
public class BookDAO {
  //1.자신타입의 static 필드 선언
  private static BookDAO instance;
  //2.default생성자를 private로 선언
  private BookDAO() {}
  //3. public 접근제어타입의 getInstance()메소드 선언,getInstance()로만 접근 
  public static BookDAO getInstance() {
	  if(instance==null) instance = new BookDAO();
	return instance;
  }
  public List<Product> getProductByCategory(String category){
	  List<Product> booklist = new ArrayList<>();
	  Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		if(category==null ||category.length()==0) {//검색 조건이 파라미터로 넘어오지 않은 경우
			sql = "SELECT * FROM bookmarket.product";	
		}else { //검색 조건이 파라미터로 넘어온 경우 
			sql = "SELECT * FROM bookmarket.product where category like concat('%',?,'%')";
		 }
		
		/*
		 * //페이지 번호로 해당 페이지의 시작 글번호와 끝 글번호 구하기 int start = (pageNum-1)*limit; //예)3페이지
		 * -> (3-1)*10=20, 1페이지 ->0 int index = start +1; //예)index=21, 1 int end =
		 * index +9; //예)21+9=30, 1+9=10
		 */		
		try {
			//1.OracleDB 연결객체 생성
			conn = DBConnection.getConnection();
			if(category==null ||category.length()==0) {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
			}else {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				
				rs = pstmt.executeQuery();
			}
			while(rs.next()) {
				System.out.println("x");
				//DB로부터 결과 레코드를 하나씩 가져와서 boardDTO에 담은 후 리스트에 저장하기
				Product book = new Product();
				book.setProductId(rs.getString(1));
				book.setPname(rs.getString(2));
				book.setPwriter(rs.getString(3));
				book.setUnitPrice(rs.getInt(4));
				book.setCategory(rs.getString(5));
				book.setPublisher(rs.getString(6));
				book.setPublishDate(rs.getString(7));
				book.setDescription(rs.getString(8));
				book.setUnitsInStock(rs.getInt(9));
				book.setFilename(rs.getString(10));
				//book.setQuantity(rs.getInt(11));
				
				//리스트에 추가하기
				booklist.add(book);
			}
		}catch (Exception e) {
			System.out.println("에러:"+e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close(); if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		System.out.println(booklist.size());
		return booklist;
  }

}