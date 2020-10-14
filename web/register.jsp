<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="bootstrap.jsp"%>
</head>
<body>
<div class="container">
    <%@ include file="navbar.jsp"%>
</div>
<div class="container mt-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Register User</li>
        </ol>
    </nav>
</div>
<div class="container mt-3">
    <div class="row">
        <div class="col-sm-6 offset-3">
            <%
                String userError = request.getParameter("usererror");
                String email = request.getParameter("email");
                String fullName = request.getParameter("full_name");
                if (userError!=null){
            %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    User with this email "<%= email%>" exists! <!-- Ставим кавычки чтобы подчеркнуть email -->
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            <%
                }
            %>
            <%
                String passwordError = request.getParameter("passworderror");
                if (passwordError!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Passwords are not same!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                String success = request.getParameter("success");
                if (success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                User added successfully!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <form action="/register" method="post">
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="email" class="form-control" value="<%=(email!=null?email:"")%>" required>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Repeat Password:</label>
                    <input type="password" name="re_password" class="form-control" required >
                </div>
                <div class="form-group">
                    <label>Full Name:</label>
                    <input type="text" name="full_name" class="form-control" value="<%=(fullName!=null?fullName:"")%>" required >
                </div>
                <div class="form-group">
                    <button class="btn btn-success">Sign up</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
