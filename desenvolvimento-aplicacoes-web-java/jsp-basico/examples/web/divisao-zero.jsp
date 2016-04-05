<%@ page errorPage="divisao-zero-exception.jsp" %> 
<% 
int res= 10/0;
out.print("Output is: "+ res);
%>