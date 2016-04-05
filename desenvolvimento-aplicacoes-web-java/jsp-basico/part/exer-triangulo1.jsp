<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<pre><%
  int i1, i2;
  for (i1 = 1; i1 <= 5; i1++) {
    for (i2 = 1; i2 <= i1; i2++) {
      out.print("*");
    }
    out.println("");
  }
  %></pre>