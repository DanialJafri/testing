<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>G-Icon Pickup System</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #4CAF50">
         <div>
            <a href="index.jsp" class="navbar-brand"> G-Icon Pickup System </a>
          </div>
         </nav>
      </header>
            <br>
			<div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">View Admin Details</h3>
                    <hr>
       <%
       
       String DB_DRIVER = "org.postgresql.Driver";
       String DB_HOST = "jdbc:postgresql://ec2-3-211-228-251.compute-1.amazonaws.com:5432" + "/d62s3r1ojavllj";
       String DB_USER = "geuftdhfelyjre";
       String DB_PASSWORD = "c8433b9dc0d4d4d9ec13f2a67b6c708e71cf96a24288fcf71ecbe899f03e3ffa";

       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       PreparedStatement stmt = null;
       Class.forName(DB_DRIVER).newInstance();
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       %>
       <form action="" method="post">
       <%
       stat = conn.createStatement();
       String u = request.getParameter("u");
       String data = "select * from crud where id='"+u+"'";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
            <input type="hidden" name="id" value='<%=res.getString("id") %>'/>
   			<div class="form-group">
     			<label>Name</label>
     			<input type="text" class="form-control" name="nm" value='<%=res.getString("name") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Email</label>
     			<input type="email" class="form-control" name="em" value='<%=res.getString("email") %>'/>
   			</div>
   			<div class="form-group">
     		<label>Phone Number</label>
     		<input type="tel" class="form-control" name="pn" value='<%=res.getString("phone") %>'/>
   			</div>
   			<div class="form-group">
     		<label>Address</label>
     		<textarea type="text" class="form-control" name="ad" value='<%=res.getString("address") %>'/></textarea>
   			</div>
   			<%
            }
   			%>
   			<button type="submit" class="btn btn-warning">Update</button>
   			<a href="index.jsp" class="btn btn-default">Back</a>
   			</form>
   			</div></div>
   			</body>
   			</html>
   			<%
   			String a = request.getParameter("id");
   			String b = request.getParameter("nm");
   			String c = request.getParameter("em");
   			String d = request.getParameter("pn");
   			String e = request.getParameter("ad");
   			if(a!=null && b!=null && c!=null && d!=null){
   				String query = "update crud set name=?, email=?, phone=?, address=? where id='"+a+"'";
   				stmt = conn.prepareStatement(query);
   				stmt.setString(1,b);
   				stmt.setString(2,c);
   				stmt.setString(3,d);
   				stmt.setString(4,e);
   				stmt.executeUpdate();
   				response.sendRedirect("index.jsp");
   			}
   			%>
   			
   			
       
       
       