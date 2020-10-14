<%@ page import="bitlab.javaee_lesson7.db.Users" %>
<%
    Users currentUser = (Users)session.getAttribute("USER");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">
       NAVBAR <!-- <img src="logo_blue.png" style="width: 200px;"> -->
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <%
                if (currentUser!=null){
            %>
                <li class="nav-item active">
                    <a class="nav-link" href="/profile"><%=currentUser.getFullName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/addhotel">Add Hotel</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Log out</a>
                </li>
            <%
                } else {
            %>
                <li class="nav-item active">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/register">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Log in</a>
                </li>
            <%
                }
            %>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>