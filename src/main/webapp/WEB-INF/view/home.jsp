<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%--
  Created by IntelliJ IDEA.
  User: Pasindu
  Date: 8/20/2021
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>

    <h2>Welcome Page</h2>

    <p>Welcome to home page!</p>

    <hr>

    <!--display user name and role-->
    <p>
        User: <security:authentication property="principal.username"/>
        <br><br>
        Role(s): <security:authentication property="principal.authorities"/>
    </p>



    <!-- add a link to point to /leaders.. this is for managers -->

    <security:authorize access="hasRole('MANAGER')">
        <hr>
        <p>
            <a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
            (Only for manager peeps)
        </p>
    </security:authorize>



    <!-- add a link to point to /systems.. this is for admins -->
    <security:authorize access="hasRole('ADMIN')">
        <hr>
        <p>
            <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
            (Only for Admin peeps)
        </p>
    </security:authorize>


    <hr>

    <!-- add a logout button-->
    <form:form action="${pageContext.request.contextPath}/logout" method="post">

        <input type="submit" value="Logout"/>

    </form:form>

</body>
</html>
