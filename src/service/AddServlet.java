package service;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import servlet.String;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String DRIVER = "com.mysql.cj.jdbc.Driver";  
	    String URL = "jdbc:mysql://localhost:3306/lotter?characterEncoding=utf8&useSSL=true&serverTimezone=UTC";
	    //问号后面分别解决了中文编码问题和连接驱动版本不一致问题和时差问题；
	    String USER = "root";
	    String PASS = "123456";
	    Connection conn = null;
        Statement stmt = null;
        try {
        	//加载驱动程序；
        	Class.forName(DRIVER);		
        	//连接数据库；
        	conn = DriverManager.getConnection(URL,USER,PASS);
        	//用来执行SQL语句
        	stmt = conn.createStatement();
        	String lotter_key=(String)request.getParameter("fname");
            String guize =request.getParameter("guolv");
            String lotter_start= request.getParameter("start_time");
            String lotter_stop= request.getParameter("end_time");
            String lotter_kj=request.getParameter("kaijiang");
            String lotter_nums=request.getParameter("subject");
            String lotter_prize=request.getParameter("prize");
            int i = Integer.parseInt(lotter_nums);
            int guize1=0;
            if("不过滤".equals(guize)) guize1=1;
            if("普通过滤".equals(guize)) guize1=2;
            if("深度过滤".equals(guize)) guize1=3;
        	String sql;
        	sql = "insert into Message(lotter_key,lotter_start,lotter_stop,lotter_law,lotter_pub,lotter_nums,lotter_pride)values('"+lotter_key+"','"+lotter_start+"','"+lotter_stop+"',"+guize1+",'"+lotter_kj+"',"+i+",'"+lotter_prize+"')";
        	stmt.executeUpdate(sql);
        	if(stmt!=null) {
        		out.println("  ");
        	}
        	out.print("<script language='javascript'>alert('发布成功！');window.location.href='index.jsp';</script>");
        	
        }catch(SQLException se){
            
            se.printStackTrace();
        }catch(Exception e){
            
            e.printStackTrace();
        }finally{
            
            try{
                if(stmt!=null) stmt.close();
            }catch(SQLException se2){
            }
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
