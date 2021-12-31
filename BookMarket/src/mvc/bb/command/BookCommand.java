package mvc.bb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BookCommand {
	public String action(HttpServletRequest request, HttpServletResponse response) throws Exception;
}