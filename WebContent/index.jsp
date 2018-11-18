<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>福大清晨的抽奖平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="./style.css" rel="stylesheet" type="text/css" media="all" />
<!--start lightbox -->
<script type='text/javascript' src='./jquery.min.js'></script>
<link rel="stylesheet" type="text/css" href="css/jquery.lightbox.css">
<script>
  // Initiate Lightbox
  $(function() {
    $('.gallery a').lightbox(); 
  });
</script>
</head>
<body>
<!-- start header -->
<div class="h_bg">
<div class="wrap">
<div class="wrapper">
	<div class="header">
		<div class="logo">
			 <a href="index.jsp"><h1>福大清晨的抽奖平台</h1></a>
		</div>
		<ul class="top-nav">
					<div id="lavalamp"> </div>
					<div class="clear"> </div>
				</ul>
		</div>
		<div class="clear"></div>
	<div class="header_btm">
	<div class="read_m">
		<a href="add.jsp"><button class="btn btn-2 btn-2h">发布抽奖</button></a>
	</div>
</div>
</div>
</div>
</div>
</div>
<!-- start  content -->
<div class="main_bg1">
<div class="wrap">
<div class="wrapper">
	<div class="main">
			<div class="section group">
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
//   								String sql2 = "select * from message where lotter_key=(select Max(lotter_key) from message )";
								
   								String sql2 = "SELECT * FROM message ORDER BY lotter_id DESC LIMIT 9 ";
   								
								//				out.println(sql);
								//				out.println("连接数据库成功！\n");
								ResultSet rs2=stmt.executeQuery(sql2);
//								String tmp_id =rs2.getObject(1).toString();
  								while(rs2.next()){
  									String tmp_id =rs2.getObject(1).toString();
  									int id=Integer.parseInt(tmp_id);
  						%>
				<div class="grid_1_of_3 images_1_of_3">
					  <p class="para">抽奖详情</p>
					  
					  	<table class="gridtable" id="mytable" cellspacing="0" summary="The technical specifications of the Apple PowerMac G5 series">
						<tr>
    						<th>抽奖关键词</th><th>抽奖开始时间</th><th>抽奖结束时间</th><th>抽奖规则</th><th>开奖时间</th><th>获奖人数</th><th>奖品</th>
						</tr>
						<tr>
    						<td><%=rs2.getObject(2) %></td><td><%=rs2.getObject(4) %></td><td><%=rs2.getObject(5) %></td><td><%=rs2.getObject(6) %></td><td><%=rs2.getObject(7) %></td><td><%=rs2.getObject(8) %></td><td><%=rs2.getObject(9) %></td>
						</tr>
					
						</table>
  	
  		
				     <div class="rd_more1">
						<a href="detail.jsp?lotter_id=<%=id %>">抽奖结果>></a>
					</div>					
				</div>
					  	<%
  								}
  					   			rs2.close();
  					   			stmt.close();
  					   			conn.close();
  					   		}catch(Exception e){
  					    		e.printStackTrace();
  					   		}
					  	%>
			    <div class="clear"></div>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>
