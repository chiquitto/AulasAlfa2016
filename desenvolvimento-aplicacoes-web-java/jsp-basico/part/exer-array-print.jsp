<ul><%
  int n[] = new int[10];
  int i;
  
  for (i = 0; i < n.length; i++) {
    n[i] = i % 2;
  }
  
  for (i = 0; i < n.length; i++) {
    %><li><%= n[i] %></li><%
  }
%></ul>