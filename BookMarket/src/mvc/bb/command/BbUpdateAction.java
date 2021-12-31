package mvc.bb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.bb.model.BbDAO;
import mvc.bb.model.BbDTO;


public class BbUpdateAction implements BookCommand {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNum = request.getParameter("pageNum");
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		int ref = request.getParameter("ref").equals("")?0:Integer.parseInt(request.getParameter("ref"));
		int re_step = request.getParameter("re_step").equals("")?0:Integer.parseInt(request.getParameter("re_step"));
		int re_level = request.getParameter("re_level").equals("")?0:Integer.parseInt(request.getParameter("re_level"));
		
		int num = Integer.parseInt(request.getParameter("num"));
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String reg_date = request.getParameter("reg_date");
		String password = request.getParameter("password");
		String ip = request.getRemoteAddr();
		
		BbDTO bb = new BbDTO();
		bb.setNum(num);
		bb.setWriter(writer);
		bb.setSubject(subject);
		bb.setContent(content);
		bb.setPassword(password);
		bb.setIp(ip);
		//원글의 글 그룹, 스텝, 레벨 셋팅
		bb.setRef(ref);
		bb.setRe_step(re_step);
		bb.setRe_level(re_level);
		
		//글 등록 처리
		BbDAO dao = BbDAO.getInstance();
		System.out.println("ref:"+ref+", re_step:"+re_step+", re_level:"+re_level);
		dao.updateBb(bb);
		
		return "/BbListAction.bo";
	}

}