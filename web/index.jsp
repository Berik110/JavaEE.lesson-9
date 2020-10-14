<%@ page import="java.util.ArrayList" %>
<%@ page import="bitlab.javaee_lesson7.db.Hotels" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.TimeZone" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="bootstrap.jsp"%>
    <style>
        img{
            max-width: 100%;

        }
    </style>
</head>
<body>
<div class="container">
    <%@ include file="navbar.jsp"%>
</div>
    <div class="container mt-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Library</li>
            </ol>
        </nav>
    </div>
    <div class="container mt-3">
        <div class="row">
            <div class="col-sm-12">
                <%
                    SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss");
                    format.setTimeZone(TimeZone.getTimeZone("UTC"));

                    ArrayList<Hotels> hotels = (ArrayList<Hotels>)request.getAttribute("ht");
                    if (hotels!=null){
                        for (Hotels h: hotels){
                %>
                    <div class="jumbotron">
                        <h2><%=h.getName()%></h2>
                        <h3>For <%=h.getPrice()%> USD</h3>
                        <h4><%=h.getStars()%> stars</h4>

                        <hr class="my-4">
                        <b>
                            Added by <%=h.getAuthor().getFullName()%> at <%=format.format(h.getAddedDate())%>
                    <%--    <br>
                            <img src="<%=h.getAuthor().getPicture()%>" height="50px" style="border-radius: 50%">
                    --%>
                        </b>
                        <hr class="my-4">
                        <a class="btn btn-primary btn-sm" href="/details?id=<%=h.getId()%>" role="button">Details</a>
                    </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>


</body>
</html>
