<%-- 
    Document   : Register
    Created on : Aug 12, 2023, 1:37:02?PM
    Author     : CSFC-IT
--%>

<%@page contentType="text/html" import="java.sql.*"%>

<html><body>

        <h1>Registration JSP Page</h1> <%

            String uname=request.getParameter("txtName");

            String pass1= request.getParameter("txtPass1");
            String pass2= request.getParameter("txtPass2");
            String email = request.getParameter("txtEmail");
            String ctry = request.getParameter("txtCon");
            if (pass1.equals(pass2)) {

                try {

                    Class.forName("com.mysql.jdbc.Driver");

                    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "admin");
                    PreparedStatement stmt = con.prepareStatement("insert into user values (?,?,?,?)");
                    stmt.setString(1, uname);
                    stmt.setString(2, pass1);
                    stmt.setString(3, email);
                    stmt.setString(4, ctry);
                    int row = stmt.executeUpdate();
                    if (row == 1) {
                        out.println("Registration Successful");
                    } else {
                        out.println("Registration FAIL !");
        %>
        <jsp:include page="index.html" ></jsp:include>
        <%        }
            } catch (Exception e) {
                out.println(e);
            }
        } else {
            out.println("<h1>Password Mismatch</h1>"); %>
        <jsp:include page="index.html" ></jsp:include> <% }
        %></body></html>