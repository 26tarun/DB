<%@page import="java.util.List"%>
<%@page import="com.beans.StudentBean"%>
<%@page import="com.beans.EventsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.PersonBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<style>
input{
width:180px;
}
.button
{
  text-transform: uppercase;
  letter-spacing: 2px;
  text-align: center;
  color: #0C5;

  font-size: 24px;
  font-family: "Nunito", sans-serif;
  font-weight: 300;
  
  margin: 5em auto;
  
  position: absolute; 
  top:0; right:0; bottom:0; left:0;
  
  padding: 20px 0;
  width: 220px;
  height:30px;

  background: #0D6;
  border: 1px solid #0D6;
  color: #FFF;
  overflow: hidden;
  
  transition: all 0.5s;
}

.button:hover, .button:active 
{
  text-decoration: none;
  color: #0C5;
  border-color: #0C5;
  background: #FFF;
}

.button span 
{
  display: inline-block;
  position: relative;
  padding-right: 0;
  
  transition: padding-right 0.5s;
}

.button span:after 
{
  content: ' ';  
  position: absolute;
  top: 0;
  right: -18px;
  opacity: 0;
  width: 10px;
  height: 10px;
  margin-top: -10px;

  background: rgba(0, 0, 0, 0);
  border: 3px solid #FFF;
  border-top: none;
  border-right: none;

  transition: opacity 0.5s, top 0.5s, right 0.5s;
  transform: rotate(-45deg);
}

.button:hover span, .button:active span 
{
  padding-right: 30px;
}

.button:hover span:after, .button:active span:after 
{
  transition: opacity 0.5s, top 0.5s, right 0.5s;
  opacity: 1;
  border-color: #0C5;
  right: 0;
  top: 50%;
}

</style>



<title>SJSU Electronic Notice Board</title>

<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<div id="templatemo_background_section_top">
		<%
			StudentBean bean = (StudentBean) session.getAttribute("person");
			String username = (String) session.getAttribute("username");
			ArrayList<EventsBean> events = (ArrayList<EventsBean>) session
					.getAttribute("upcomingevents");
			List<String> categories=(ArrayList<String>)session.getAttribute("categories");
			List<String> department=(ArrayList<String>)session.getAttribute("department");
		%>
		<div class="templatemo_container">

			<div id="templatemo_header">
				<div id="templatemo_logo_section">
					<h1>
						<a href="studentindex.jsp">Electronic Student Notice Board</a>
					</h1>
					<h2>Find out happening events in the campus.</h2>
				</div>
				<div id="templatemo_user_section">
					Welcome
					<%=username%>!!<a href="index.jsp">Logout</a>
				</div>
			</div>
			<!-- end of headder -->
			<div id="templatemo_menu_panel">
				<div id="templatemo_menu_section">

					<ul>
						<li><a href="viewpastevents.jsp">View All Events </a></li>
						<li><a href="updatestudentinfo.jsp">Update Info </a></li>
						<li><a href="booktickets.jsp">Book Tickets</a></li>
						<li><a href="subscribecategory.jsp">Subscribe Category</a></li>
						<li><a href="changepassword.jsp">Change Password</a></li>
					</ul>

				</div>
			</div>
			<!-- end of menu -->
		</div>
		<!-- end of container-->

	</div>
	<!-- end of templatemo_background_section_top-->

	<div id="templatemo_background_section_middle">

		<div class="templatemo_container">

			<div id="templatemo_left_section">

				<div class="templatemo_post">
					
					<div class="templatemo_post_top">
						<h1>Welcome to the Electronic Student Notice Board</h1>
					</div>
					<div class="templatemo_post_mid" style="height: 400px">
						<form id="filter" action="eventServlet" method="post">
						<p>Filter Events based on criteria below</p>
						<table style="margin-left: 20px">
							<tr>
								<td>
									<table border="0">
										<tbody>

											<tr>
												<td><label for="ename">Event Name: </label></td>
												<td><input id="ename" maxlength="100" name="ename"
													type="text" /></td>
											</tr>

											<tr>
												<td><label for="place">Event Place: </label></td>
												<td><input id="place" maxlength="45" name="place"
													type="text" /></td>
											</tr>

											<tr>
												<td><label for="eventdate">Event Date From: </label></td>
												<td><input placeholder="YYYY-MM-DD HH:MM:SS"id="eventdatefrom" maxlength="45"
													name="eventdatefrom" type="text" /></td>
											</tr>
											<tr>
												<td></td>


											</tr>
										</tbody>
									</table>
								</td>
								<td>
									<table border="0">
										<tbody>

											<tr>
												<td><label for="category">Category: </label></td>
												<td><select name="category">
														<option value="Select">Select</option>
														<%
															if (categories != null && categories.size() != 0) {
														%>
														<%
															for (int i = 0; i < categories.size(); i++) {
														%>
														<option value="<%=categories.get(i)%>"><%=categories.get(i)%></option>
														<%
															}
														%>
														<%
															} 
														%>
												</select></td>
											</tr>
											<tr>
											<td><label for="eventdate">Event Date To: </label></td>
												<td><input id="eventdateto" maxlength="45"
													 placeholder="YYYY-MM-DD HH:MM:SS" name="eventdateto" type="text" /></td>
											</tr>
										</tbody>
									</table>
							</tr>
						</table>

						<div>
							<input  id ="button" name="Filter" type="submit" value="Filter"
								style="width: 100px; align: right; margin-left: 70px;  background: rgb(66, 184, 221); " />
						</div>
						<br /> <br />

						<div class="clear"></div>
						</form>

					</div>
					<div class="templatemo_post_bottom">

						<span class="post">Developed By: SJSU Students CMPE180-38
							batch</span> <span class="post">Category: <a href="#">java</a></span>
					</div>

				</div>
				<!-- end of templatemo_post-->

			</div>
			<!-- end of left section-->


		</div>
		<!-- end of container-->
	</div>
	<!-- end of background middle-->


	<div align=center>Created by SJSU Fall 2014 students for CMPE
		180-38 Class Project</div>
</body>


</html>