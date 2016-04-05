<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%
  response.setContentType("image/png");
  
  String path = request.getServletContext().getRealPath("img");
  FileInputStream fis = new FileInputStream(new File(path + "/ok.png"));
  BufferedInputStream bis = new BufferedInputStream(fis);
  BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream());
  for (int data; (data = bis.read()) > -1;) {
    output.write(data);
  }
%>