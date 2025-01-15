<%@page import="com.travel.Model.placeDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Entity.Place"%>
<%@page import="com.travel.Entity.City"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%cityDAO city=new cityDAO(session);
    ArrayList<City> al=city.viewCity();
    int selectedCategory = request.getParameter("city")!=null ? Integer.parseInt(request.getParameter("city"))  : -1;
    placeDAO pl= new placeDAO(session);
    ArrayList<Place> place=pl.viewPlace();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.city-section
 {
	  display: flex;
	  justify-content: flex-start;
	  align-items: center;
	  padding: 5px 10px;
	  gap:15px;
	  width: 100%;
	  overflow-x: auto;
	  max-width: 1800px;
	  margin: 5px auto;
 }
 
 .city-section::placeholder
 {
    width: 2px;
  }
 
 .city-tag{
  padding: 4px 8px;
  border-radius: 30px;
  border:1px solid #efefef !important;
  background: white;
  font-size: 1.0rem;
  cursor: pointer;
  color: black !important;
  text-decoration:none;
  white-space: nowrap;
  box-shadow: 0px 1px 4px gray !important;
 }
 
 .city-tag-acive{
  background: black;
  color: white !important;
 }
 .not-found{
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 70vh;
 }
 .not-found  img{
  width: 200px;
  height: 200px;
 }
 
</style>
</head>
<body>
<%@include file="header.jsp" %>
<article class="city-section">
     
      <a class="city-tag <%=selectedCategory == -1 ? "city-tag-acive" :"" %>" href="<%="place.jsp?city=-1"%>">All</a>
      <%
         
         for(City c : al)
         {
        	 %>
        	  <a class="city-tag <%=selectedCategory == c.getCity_id() ? "city-tag-acive" :"" %>" href="<%= request.getContextPath()+"/place.jsp?city="+c.getCity_id()%>"><%=c.getCity_name()%></a>
        	 <% 
         }
      
      %>
      
  </article>
  
  <%if(place.size() ==0){%>
        <div class="not-found">
           <img alt="not-found" src="https://thumbs.dreamstime.com/b/oops-emoticon-vector-illustration-over-white-56744303.jpg">
          <p>No Place Found...!!!</p>
        </div>
     <%}%>
    
</body>
</html>