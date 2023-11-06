<%-- 
    Document   : check
    Created on : Aug 12, 2023, 1:42:18?PM
    Author     : CSFC-IT
--%>

<%@page contentType="text/html" import="java.sql.*"%> 
<html><body> <h2>Registration JSP Page</h2> 
        <%
            String uname = request.getParameter("txtName");
            String pass = request.getParameter("txtPass");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "admin");
                PreparedStatement stmt = con.prepareStatement(
                        "select password from user where uername=?");
                stmt.setString(1, uname);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    if (pass.equals(rs.getString(1))) {
                        out.println("<h1> LOGIN SUCCESSFULLL </h1>");
                    }
                } else {
                    out.println("<h3>User Name not exist !!!!!</h3>");
                }
        %> 
        <jsp:include page="home.html" ></jsp:include> }
        <%
            } catch (Exception e) {
                out.println(e);
            }
        %></body></html>