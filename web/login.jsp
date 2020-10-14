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
                <li class="breadcrumb-item active" aria-current="page">Login Page</li>
            </ol>
        </nav>
    </div>
    <div class="container mt-3">
        <div class="row">
            <div class="col-sm-6 offset-3">
                <%
                    String userError = request.getParameter("usererror");
                    String email = request.getParameter("email");
                    if (userError!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    User with this email "<%= email%>" doesn't exist! <!-- Ставим кавычки чтобы подчеркнуть email -->
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
                    Incorrect password!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%
                    }
                %>
                <form action="/login" method="post">
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" name="email" class="form-control" value="<%=(email!=null?email:"")%>" required>
                    </div>
                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-success">Sign in</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
