<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmute.fit.ex13.User" %>
<%@ page import="vn.edu.hcmute.fit.ex13.UserDB" %>

<%
    String message = "";
    String firstName = "";
    String lastName = "";
    String email = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        firstName = request.getParameter("firstName");
        lastName = request.getParameter("lastName");
        email = request.getParameter("email");

        if (firstName.isEmpty() || lastName.isEmpty() || email.isEmpty()) {
            message = "Vui lòng nhập đầy đủ thông tin.";
        } else if (UserDB.emailExists(email)) {
            message = "Email đã tồn tại trong hệ thống.";
        } else {
            User user = new User();
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            UserDB.insert(user);
            message = "Thêm người dùng thành công!";
            firstName = lastName = email = ""; // reset form
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm người dùng</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Thêm người dùng vào danh sách email</h2>
<form method="post" action="addUser.jsp">
    <label>Họ:</label>
    <input type="text" name="firstName" value="<%= firstName %>" required>

    <label>Tên:</label>
    <input type="text" name="lastName" value="<%= lastName %>" required>

    <label>Email:</label>
    <input type="email" name="email" value="<%= email %>" required>

    <input type="submit" value="Thêm người dùng">
</form>

<% if (!message.isEmpty()) { %>
<div class="message"><%= message %></div>
<% } %>
</body>
</html>