package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import model.BookBean;
import model.LoginBean;

public class BookDAO {
	private final String JDBC_URL="jdbc:mysql://localhost/bookdb?";
	private final String DB_NAME="root";
	private final String DB_PASS="";
	
	
	//ドライバの接続
	private Boolean driver(){
		Boolean dri=false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			dri=true;
		}catch(ClassNotFoundException e) {
			throw new IllegalStateException(
			"JDBCドライバを読み込めませんでした");
		}
		return dri;
	}
	//本の追加
	public Boolean addData(String bid,String title,String cop,String auth,String price,String num) {
		Boolean flg=false;
		if(driver()) {
			try {
				Connection conn=null;
				PreparedStatement pstmt= null;
				conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);
				if(title != "" && cop != "" && auth != "" && price != "" && num != ""){
					String sql;
					if(bid==null) {
						sql="INSERT INTO book(title,cop,auth,price,num) VALUE ('"+title+"','"+cop+"','"+auth+"',"+price+",0 );";//新規登録
					}else {
						sql="INSERT INTO book(bid,title,cop,auth,price,num) VALUE ("+bid+",'"+title+"','"+cop+"','"+auth+"',"+price+","+num+" );";
						//変更
					}
				System.out.println(sql);	
				pstmt=conn.prepareStatement(sql);
				pstmt.execute();
				flg=true;
				pstmt.close();
				conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	return flg;
	}
	
	//本の削除用のメソッド
	public Boolean deleteData(String bid) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		Boolean flg=false;
		if(driver()) {
			try {
				conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);
				String sql="DELETE FROM book WHERE bid ="+ bid+";";
				pstmt=conn.prepareStatement(new String(sql));
				pstmt.execute();
				pstmt.close();
				conn.close();
				flg=true;
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return flg;
	}
	//本の検索用のメソッド
	public ArrayList<BookBean> searchData(String bid,String title,String cop,String auth){
				
				Connection conn=null;
				PreparedStatement pstmt=null;
				ResultSet rset =null;
				ArrayList<BookBean> array = new ArrayList<BookBean>();

				if(driver()) {
				try {	
					conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);
					StringBuffer sql=new StringBuffer();
					sql.append("SELECT bid,title,cop,auth,price,num FROM book WHERE title LIKE '%"+title+"%'");
					if(bid != "") {
						sql.append("and bid='"+bid+"'");
					}
					if(cop != "") {
						sql.append("and cop='"+cop+"'");
					}
					if(auth != "") {
						sql.append("and auth='"+auth+"'");
					}
					sql.append(";");
					System.out.println(sql);
					pstmt=conn.prepareStatement(new String(sql));
					pstmt.execute();
					rset=pstmt.executeQuery();
					while(rset.next()) {
						BookBean bookbean = new BookBean();
						bookbean.setBid(rset.getString("bid"));
						bookbean.setTitle(rset.getString("title"));
						bookbean.setCop(rset.getString("cop"));
						bookbean.setAuth(rset.getString("auth"));
						bookbean.setPrice(rset.getString("price"));
						bookbean.setNum(rset.getString("num"));
						array.add(bookbean);
					}
					pstmt.close();
					conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			return array;	
	}
	//在庫がある本だけを検索する
	public ArrayList<BookBean> searchData(String bid,String title,String cop,String auth,String numflg){
		System.out.println("1");

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rset =null;
		ArrayList<BookBean> array = new ArrayList<BookBean>();

		if(driver()) {
		try {	
			conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);
			StringBuffer sql=new StringBuffer();
			sql.append("SELECT bid,title,cop,auth,price,num FROM book WHERE title LIKE '%"+title+"%'");
			if(bid != "") {
				sql.append("and bid='"+bid+"'");
			}
			if(cop != "") {
				sql.append("and cop='"+cop+"'");
			}
			if(auth != "") {
				sql.append("and auth='"+auth+"'");
			}
			if(numflg.equals("1")) {
				sql.append("and num != 0");
			}
			sql.append(";");
			System.out.println(sql);
			pstmt=conn.prepareStatement(new String(sql));
			pstmt.execute();
			rset=pstmt.executeQuery();
			while(rset.next()) {
				BookBean bookbean = new BookBean();
				bookbean.setBid(rset.getString("bid"));
				bookbean.setTitle(rset.getString("title"));
				bookbean.setCop(rset.getString("cop"));
				bookbean.setAuth(rset.getString("auth"));
				bookbean.setPrice(rset.getString("price"));
				bookbean.setNum(rset.getString("num"));
				array.add(bookbean);
			}
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	return array;	
}
	
	//管理者でログインできるかのメソッド
	public Boolean execute(LoginBean logbean) {
		String uid=logbean.getUid();
		String pas=logbean.getPas();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rset =null;
		Boolean flg=false;
		if(driver()) {
			try {	
				conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);//データベースに接続
				String sql="SELECT uname,pas,num FROM bkuser WHERE uid='"+uid+"';";
				System.out.println(sql);
				pstmt=conn.prepareStatement(sql);//送るsql文
				pstmt.execute();//実行
				rset=pstmt.executeQuery();//ユーザーIDをもとにデータベースに乗っているパスワードを取得
				rset.next();
				if(!(rset.equals(null))) {
				String dbuname =rset.getString("uname");
				String dbpas=rset.getString("pas");
				String dbnum=rset.getString("num");
				if(pas.equals(dbpas) && dbnum.equals("1")) {
					flg=true;
					logbean.setUname(dbuname);
				}
				}
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
				}finally {
					try {
						conn.close();
					}catch(Exception e) {
					}
					}
				}
			return flg;
	}
	//ユーザーでログインできるか
	public Boolean userexecute(LoginBean logbean) {
		String uid=logbean.getUid();
		String pas=logbean.getPas();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rset =null;
		Boolean flg=false;
		if(driver()) {
			try {	
				conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);//データベースに接続
				String sql="SELECT uname,pas FROM bkuser WHERE uid='"+uid+"';";
				System.out.println(sql);
				pstmt=conn.prepareStatement(sql);//送るsql文
				pstmt.execute();//実行
				rset=pstmt.executeQuery();//ユーザーIDをもとにデータベースに乗っているパスワードを取得
				while(rset.next()) {
					String dbuname =rset.getString("uname");
					String dbpas=rset.getString("pas");
					
					if(pas.equals(dbpas)) {
						flg=true;
						logbean.setUname(dbuname);
					}
				}
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
				}finally {
					try {
						conn.close();
					}catch(Exception e) {
					}
					}
				}
			return flg;
	}
	//ユーザーを追加
	public Boolean useradd(LoginBean logbean) {
		Boolean flg=false;
		String uname=logbean.getUname();
		String pas=logbean.getPas();
		String adr=logbean.getAdr();
		if(driver()) {
			try {
				Connection conn=null;
				PreparedStatement pstmt= null;
				ResultSet rset =null;
				conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);
				if(uname != "" && pas != "" && adr != "" ){
				String sql="INSERT INTO bkuser(uname,pas,adr) VALUES ('"+uname+"','"+pas+"','"+adr+"');";
				System.out.println(sql);
				pstmt=conn.prepareStatement(new String(sql));
				pstmt.execute();
				sql="SELECT uid FROM bkuser WHERE uname='"+uname+"' ORDER BY uid DESC;";
				System.out.println(sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.execute();
				rset=pstmt.executeQuery();
				rset.next();
				logbean.setUid(rset.getString(1));
				flg=true;
				}
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	return flg;
	}
	//購入した人と時間の記録
	public String byData(String uid ,LocalDate oday){
		String oid=null;
		if(driver()) {
			try {
				Connection conn=null;
				PreparedStatement pstmt= null;
				ResultSet rset =null;
				conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);
				String sql="INSERT INTO bkorder(uid,oday) VALUES ('"+uid+"','"+oday+"');";
				System.out.println(sql);
				pstmt=conn.prepareStatement(new String(sql));
				pstmt.execute();
				sql="SELECT oid FROM bkorder WHERE uid='"+uid+"' ORDER BY oid DESC;";
				System.out.println(sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.execute();
				rset=pstmt.executeQuery();
				rset.next();
				oid=rset.getString(1);
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return oid;
	}
	//購入した商品の記録
	public void order(String oid,String bid,String num) {
		if(driver()) {
			try {
				Connection conn=null;
				PreparedStatement pstmt= null;
				conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);
				String sql="INSERT INTO bkdatail(oid,bid,num) VALUES ('"+oid+"','"+bid+"','"+num+"');";
				System.out.println(sql);	
				pstmt=conn.prepareStatement(sql);
				pstmt.execute();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	//商品の在庫があるか
	public Boolean chack(String bid,int numo) {
		Boolean flg=false;
		if(driver()) {
			try {
				Connection conn=null;
				PreparedStatement pstmt= null;
				ResultSet rset =null;
				conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);
				String sql="SELECT num FROM book WHERE bid='"+bid+"';";
				System.out.println(sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.execute();
				rset=pstmt.executeQuery();
				rset.next();
				int num=rset.getInt(1);
				if(num-numo>=0) {
					flg=true;
				}
				pstmt.close();
				conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	return flg;
	}
	//商品の在庫を減らす
	public void reduce(String bid,int numo) {
		if(driver()) {
			try {
				Connection conn=null;
				PreparedStatement pstmt= null;
				ResultSet rset =null;
				conn=DriverManager.getConnection(JDBC_URL,DB_NAME,DB_PASS);
				String sql="SELECT num FROM book WHERE bid='"+bid+"';";
				System.out.println(sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.execute();
				rset=pstmt.executeQuery();
				rset.next();
				int num=rset.getInt(1);
				sql="UPDATE book SET num='"+(num-numo)+"' WHERE bid='"+bid+"';";
				System.out.println(sql);
				pstmt=conn.prepareStatement(sql);
				pstmt.execute();
				pstmt.close();
				conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}