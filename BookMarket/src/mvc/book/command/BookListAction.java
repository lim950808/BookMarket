package mvc.book.command;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductRepository;
import dto.Product;
import mvc.book.model.BookDAO;
import mvc.command.Command;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BookListAction implements Command{
	//게시글 페이지당 조회결과 건수 상수 선언
	static final int LISTCOUNT = 10;
	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) 
			    throws Exception {
		
		//등록된 글 목록 가져오기
			//DB억세스 객체 생성
		//	ProductRepository dao = ProductRepository.getInstance();
		   BookDAO dao = BookDAO.getInstance();
		   List<Product> bookList = new ArrayList<>();
			
			
			
			String category = request.getParameter("category");		
			
			bookList = dao.getProductByCategory(category);
			
			
			request.setAttribute("booklist", bookList);
			request.setAttribute("category", category);
			
		 //이동할 view페이지 경로
		 return "/products.jsp";
	}

}