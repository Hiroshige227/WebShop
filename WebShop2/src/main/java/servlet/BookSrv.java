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
import model.BookBean;
import model.LoginBean;
@WebServlet("/BookSrv")
public class BookSrv extends HttpServlet{
	private static final long serialVersionUID=1L;
	
	protected void doGet (HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		LoginBean logbean=(LoginBean)session.getAttribute("KanriLogin");//管理側で起動しているか
		if(logbean.getUname().equals(null)) {
			response.sendRedirect("login.jsp");
		}else if(logbean!=null) {
			RequestDispatcher dispatcher=request.getRequestDispatcher("WEB-INF/bookad.jsp");
			dispatcher.forward(request, response);
		}
		logbean=(LoginBean)session.getAttribute("UserLogin");//ユーザー側で起動しているか
		if(logbean.getUname().equals(null)) {
			response.sendRedirect("userlogin.jsp");
		}else if(logbean!=null) {
			RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	
	
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String mode=request.getParameter("mode");
		String status ="成功しました";
		BookBean bookbean=new BookBean ();
		BookDAO dao = new BookDAO();
		ArrayList<BookBean> array;
		
		switch (mode) {
		case "add"://登録処理を起動
			try {
				//値を拾う
				String bid=request.getParameter("bid");
				String title=request.getParameter("title");
				String cop=request.getParameter("cop");
				String auth=request.getParameter("auth");
				String price=request.getParameter("price");
				String num=request.getParameter("num");
				if(dao.addData(bid,title,cop,auth,price,num)==false) {
					status="失敗しました";
				}
				request.setAttribute("status",status);
				request.getRequestDispatcher("WEB-INF/bookResult.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "delete"://削除処理を起動
			try {
				String bid=request.getParameter("bid");
				if(dao.deleteData(bid)==false) {
					status="失敗しました";
				}
					request.setAttribute("status",status);
					request.getRequestDispatcher("WEB-INF/bookResult.jsp").forward(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
		
			break;
			
		case "change"://変更処理を起動
			try {
				String bid=request.getParameter("bid");
				String title=request.getParameter("title");
				String cop=request.getParameter("cop");
				String auth=request.getParameter("auth");
				String price=request.getParameter("price");
				String num=request.getParameter("num");
				bookbean.setBid(bid);
				bookbean.setTitle(title);
				bookbean.setCop(cop);
				bookbean.setAuth(auth);
				bookbean.setPrice(price);
				bookbean.setNum(num);
				request.setAttribute("changeago",bookbean);
				request.getRequestDispatcher("WEB-INF/change.jsp")
				.forward(request,response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			break;
		case "del_add" :
			try {
				String bid   =request.getParameter("bid");
				String title =request.getParameter("title");
				String cop   =request.getParameter("cop");
				String auth  =request.getParameter("auth");
				String price =request.getParameter("price");
				String num   =request.getParameter("num");
				if(dao.deleteData(bid)) {
					if(!(dao.addData(bid, title, cop, auth, price, num))) {
						status="失敗しました";
					}
				}
					request.setAttribute("status",status);
					request.getRequestDispatcher("WEB-INF/bookResult.jsp").forward(request, response);
			}catch(Exception e) {
					e.printStackTrace();
			}
			break;
		case "search":
			try {
				//BookBeanに値を取得
				String bid=request.getParameter("bid");
				String title=request.getParameter("title");
				String cop=request.getParameter("cop");
				String auth=request.getParameter("auth");
				String numflg=request.getParameter("numflg");
				if(numflg.equals("1")) {
				array=dao.searchData(bid, title, cop, auth,numflg);
				//スコープに出してサーチ起動				
				request.setAttribute("kekka",array);
				request.getRequestDispatcher("WEB-INF/userbookList.jsp")
				.forward(request, response);
				}else if(numflg.equals("0")){
					array = dao.searchData(bid,title,cop,auth);//スコープに出してサーチ起動				
					request.setAttribute("kekka",array);
					request.getRequestDispatcher("WEB-INF/userbookList.jsp")
					.forward(request, response);
				}else {
					array = dao.searchData(bid,title,cop,auth);//スコープに出してサーチ起動				
					request.setAttribute("kekka",array);
					request.getRequestDispatcher("WEB-INF/bookList.jsp")
					.forward(request, response);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			break;
		}
	}		
}