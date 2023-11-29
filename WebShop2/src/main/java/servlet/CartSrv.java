package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.BookDAO;
import model.CartBean;
import model.LoginBean;

@WebServlet("/CartSrv")
public class CartSrv extends HttpServlet{
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		ArrayList<CartBean> cartlist=(ArrayList<CartBean>)session.getAttribute("CartList");
		String mode=request.getParameter("mode");
		switch (mode) {
		case "add":
			CartBean cart=new CartBean();
			String bid=request.getParameter("bid");
			String title=request.getParameter("title");
			String price=request.getParameter("price");
			String numo=request.getParameter("numo");
			cart.setBid(bid);
			cart.setTitle(title);
			cart.setPrice(price);
			cart.setNumo(numo);
			cartlist.add(cart);
			System.out.println(cart.getTitle());
			session.setAttribute("CartList", cartlist);
			request.getRequestDispatcher("userBookDsp.jsp").forward(request, response);
			break;
		case "by" :
			int sum=0;
			for(CartBean cart2 : cartlist) {
				int price2=Integer.parseInt(cart2.getPrice());
				int numo2=Integer.parseInt(cart2.getNumo());
				sum=sum+(price2*numo2);
			}
			System.out.println(sum);
			request.setAttribute("sum", sum);
			request.getRequestDispatcher("WEB-INF/ListResult.jsp").forward(request, response);
			break;
		case "bought":
			Boolean flg=true;
			String nonum =null;//在庫がない商品の名前
			try {
				BookDAO dao=new BookDAO ();
				String status="失敗しました";
				LoginBean logbean = (LoginBean) session.getAttribute("UserLogin");
				String uid=logbean.getUid();
				for(CartBean cart3:cartlist) {
					String bid3=cart3.getBid();
					int numo3=Integer.parseInt(cart3.getNumo());
					//すべて在庫があるか確認する
					flg=dao.chack(bid3,numo3);
					if(!(flg)) {
						nonum=cart3.getTitle();
						break;
					}
					System.out.println(nonum);
				}
				if(flg) {
					for(CartBean cart3:cartlist) {
						String bid3=cart3.getBid();
						int numo3=Integer.parseInt(cart3.getNumo());
						dao.reduce(bid3,numo3);
					}
					LocalDate oday=LocalDate.now();
					System.out.println(oday);
					String oid=dao.byData(uid,oday);
					for(CartBean cart3 : cartlist) {
						String bid3=cart3.getBid();
						String num3=request.getParameter("sum");
						dao.order(oid,bid3,num3);
						status="成功しました";
					}
				}
					request.setAttribute("nonumbname", nonum);
					request.setAttribute("status", status);
					request.getRequestDispatcher("WEB-INF/byResult.jsp").forward(request, response);
				}catch(Exception e) {
				e.printStackTrace();
			}
			break;
		}
	}	

}
