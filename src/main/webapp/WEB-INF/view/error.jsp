<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
     try {
         String errorType = (String) request.getAttribute("error");
         String referPage = (String) request.getAttribute("referPage");
         if (errorType.equals("adminPassword")) {
             out.println("<script>alert('비밀번호가 일치하지 않습니다.')</script>");
         } else {
             out.println("<script>alert('올바르지 못한 접근입니다.')</script>");
         }
         pageContext.forward(referPage);
     } catch(Exception e) {
         out.println("<script>alert('올바르지 못한 접근입니다.')</script>");
         response.sendRedirect("/");
     }
%>