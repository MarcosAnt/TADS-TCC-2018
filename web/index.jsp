<%-- 
    Document   : index
    Created on : 21/03/2018, 21:42:41
    Author     : onurb
--%>

<!-- Cabe�alho -->
<%@ include file="head.jsp" %>
<link href="assets/css/feed-style.css" rel="stylesheet">
<c:if test="${!(empty(user))}">
    <c:redirect url="home.jsp"/>
</c:if>
<c:choose>
    <c:when test="${(!empty(msg))}">
        <div class="alert alert-warning col-lg-12 col-sm-12 col-md-12 col-xs-12" role="alert">
            <h4 class="text-center"><c:out value="${msg}"/></h4>
        </div>
    </c:when>
    <c:when test="${(!empty(param.msg))}">
        <div class="alert alert-warning col-lg-12 col-sm-12 col-md-12 col-xs-12" role="alert">
            <h4 class="text-center"><c:out value="${param.msg}"/></h4>
        </div>
    </c:when>
</c:choose>
<div class="col-lg-3">
    <div class="list-group">
        <a class="list-group-item" href="login.jsp">Login</a>
        <a class="list-group-item" href="MainPageServlet?action=CLIENTE">Cadastrar</a>
    </div>
</div>
<div class="col-lg-9">
    <div class="jumbotron">
         <img src="img\logos\logo1.jpg" class="rounded border border-dark">      
    </div>
</div> <!-- End col-lg-9 -->

<!-- Rodap� -->
<%@ include file="footer.jsp" %>