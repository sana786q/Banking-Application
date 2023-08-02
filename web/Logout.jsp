<%@include file="DBCON.jsp" %>
<html>
    <body>
        <% session.invalidate();
        con.close();
        %>
        <a href="Login.jsp"></a>
    </body>
</html>