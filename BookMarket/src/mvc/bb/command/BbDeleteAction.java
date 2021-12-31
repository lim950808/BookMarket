package mvc.bb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.bb.model.BbDAO;

public class BbDeleteAction implements BookCommand {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNum=request.getParameter("pageNum");
		String items=request.getParameter("items");
		String text = request.getParameter("text");
		int num = Integer.parseInt(request.getParameter("num"));
		 
		//글 삭제 처리
		BbDAO dao = BbDAO.getInstance();
		dao.deleteBb(num);

	    request.setAttribute("pageNum",request.getParameter("pageNum"));
	    request.setAttribute("items",request.getParameter("items"));
	    request.setAttribute("text",request.getParameter("text"));
	
		return "/BbListAction.do";
	}
}