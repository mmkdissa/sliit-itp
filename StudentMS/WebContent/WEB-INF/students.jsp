<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sms.bean.Student"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Management System</title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <body>
  <%
   List<Student> students = (List<Student>)request.getAttribute("data");
  
  %>
   <nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="images/logo.png"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="/StudentMS/StudentServlet">Add Student</a></li>
        <li class="active"><a href="/StudentMS/StudentServlet?view=all">View Student</a></li>       
      </ul>   
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	<div class="container">
    	<div class="row">
        	<div class="page-header">
              <h2>View Student</small></h2>
            </div>
        	<div class="col-lg-12 col-md-12 col-sm-12">
            	<table class="table table-hover">
  					<thead>
                    	<tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Address</th>
                            <th>Contact No</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                       <%
                        for(Student student : students){
                        	
                       
                       %>
                    	<tr>
                        	<td><%=student.getFirstName() %></td>
                            <td><%=student.getLastName() %></td>
                            <td><%=student.getAddress() %></td>
                            <td><%=student.getPhone() %></td>
                           
                            <td><button type="button" class="btn btn-danger">Delete</button></td>
                        </tr>
                        <% } %>
                       
                    </tbody>
				</table>
            </div>
        </div>
    </div>
    <footer>
    	<div class="container">
        	<div class="row">
            	<div class="col-lg-12 col-md-12 col-sm-12">
                	&copy; 2014 Student Management Systems. All Rights Reserved.
                </div>
            </div>
        </div>
    </footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
