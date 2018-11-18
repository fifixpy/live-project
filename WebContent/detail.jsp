<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="java.util.Iterator"%>
    <%@ page import="java.util.Map.Entry"%>
    <%@ page import="txtRead.*"%>
    <%@ page import="java.util.Date"%>
    <%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LIVE SOFTWARE</title>
    <link href="./demo.css" rel="stylesheet" type="text/css">
</head>
<body>
    <section id="getintouch" class="rotateInUpLeft animated">
        <div class="container" style="border-bottom: 0;">
            <h1>
                <span>抽奖结果!</span>
            </h1>
        </div>
        <div class="container">
            <form class="contact" method="post" id="form">
            <div class="row clearfix">
                <div class="ctrl">
                	<p>
              <%
  		        try{
  				String DRIVER = "com.mysql.cj.jdbc.Driver";  
    	    	String URL = "jdbc:mysql://localhost:3306/lotter?characterEncoding=utf8&useSSL=true&serverTimezone=UTC";
    	    	//问号后面分别解决了中文编码问题和连接驱动版本不一致问题和时差问题；
    	    	String USER = "root";
    	    	String PASS = "123456";
    	    	Connection conn = null;
            	Statement stmt = null;
            	Class.forName(DRIVER);		
            	//连接数据库；
            	conn = DriverManager.getConnection(URL,USER,PASS);
            	//用来执行SQL语句
            	stmt = conn.createStatement();
            	

				String str=request.getParameter("lotter_id");  
				int id=Integer.parseInt(str);  


            	//String tmp_id=request.getAttribute("tmp_id").toString();
          
			
            	//int id = Integer.parseInt(tmp_id);
   				String sql="select lotter_key,lotter_start,lotter_stop,lotter_law,lotter_nums,lotter_pub from message where lotter_id="+id;
   				String key=null;
   				String start=null;
   				String stop=null;
   				String pub=null;
   				int law=0;
   				int nums=0;
   				//int i = Integer.parseInt(lotter_nums);
   				ResultSet rs=stmt.executeQuery(sql);
  				 while(rs.next()){
  					key=rs.getString(1);
  					start=rs.getString(2);
  					stop=rs.getString(3);
  					law=Integer.parseInt(rs.getString(4));
  					nums=Integer.parseInt(rs.getString(5));
  					pub=rs.getString(6);
  				 }
  				 /*SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   		        Date curDate = new Date(System.currentTimeMillis());//获取当前时间       
   		        String ptime =formatter.format(curDate); 
   				ptime=ptime.substring(0,16);
   				if(pub.compareTo(ptime)<0){
   					out.print("当前未到开奖时间！");
   					nums=0;
   				}*///当前时间对比
  				
  				System.out.println(key);	
  				String filePath = "C://Users//Administrator//Downloads//record.txt";	
  				FinalImplement getArrayList = new FinalImplement(law, filePath, key, start, stop);	
  				ArrayList<Entry<String, Integer>> list = getArrayList.getArrayList();
  				int num=nums;						//输入获奖人数
  				System.out.println("以下是获奖名单：");
  				Iterator<Entry<String, Integer>> iterator = list.iterator();
  		        int i = 0;
  				for(Entry<String, Integer> m : list){
  					//if(nums==0) break;
  					i++; 					
  					out.println(m.getKey());
  					%>
  					<br/>
  					<% 
  		            if (i == num) {
  		            	break;
  		            }
  		        }
  	   			rs.close();
  	   			stmt.close();
  	   			conn.close();
  	   		}catch(Exception e){
  	    		e.printStackTrace();
  	   		}
  	%>
  		</p>
                </div>
            </div>
            </form>
        </div>
    </section>
</body>
</html>
