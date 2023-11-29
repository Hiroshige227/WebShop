package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.BookDAO;
import model.CartBean;
import model.LoginBean;
@WebServlet("/Login")
public class Login extends HttpServlet{
	private static final long serialVersionUID=1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		LoginBean logbean=new LoginBean ();
		BookDAO dao = new BookDAO();
		
		String uid=(request.getParameter("uid"));
		logbean.setUid(uid);
		String pas=(request.getParameter("pas"));
		logbean.setPas(pas);
		String mode =(request.getParameter("mode"));
		
		if(mode.equals("kanri")) {
		//データベースでログイン
		boolean isLogin=dao.execute(logbean);
		if(isLogin) {
			HttpSession session=request.getSession();
			session.setAttribute("KanriLogin", logbean);
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("WEB-INF/loginResult.jsp");
		dispatcher.forward(request, response);
		}else if(mode.equals("user")){
			//データベースでログイン
			boolean isLogin=dao.userexecute(logbean);
			
			
			if(isLogin) {
				HttpSession session=request.getSession();
				session.setAttribute("UserLogin", logbean);
				ArrayList<CartBean> cartlist =new ArrayList<CartBean>();
				session.setAttribute("CartList", cartlist);
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher("WEB-INF/userResult.jsp");
			dispatcher.forward(request, response);
		}else if(mode.equals("add")) {
			String uname=request.getParameter("uname");
			logbean.setUname(uname);
			String adr=request.getParameter("adr");
			logbean.setAdr(adr);
			boolean isLogin=dao.useradd(logbean);
			//ここから
			  //HttpSession session = request.getSession(true);

			if(isLogin) {
				System.out.println(logbean.getUname());
				System.out.println(logbean.getAdr());
				System.out.println(logbean.getPas());
				request.setAttribute("uidreturn", logbean);
			}
			//ここまで追加
			RequestDispatcher dispatcher=request.getRequestDispatcher("userMnte.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		doPost(request,response);
	}
}
