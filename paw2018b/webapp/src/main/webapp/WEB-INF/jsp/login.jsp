
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title><spring:message code="brand.name"/></title>
        <meta name="description" content="Roughly 155 characters">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/select2-bootstrap4.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    </head>
    <body class="body-background">
        <nav class="navbar navbar-dark" style="background-color: #257CBF; padding-bottom: 0px;">
            <div class="container">
                <a class="navbar-brand" href="<c:url value="/"/>">
                    <h1><strong><spring:message code="brand.name"/></strong></h1>
                </a>
            </div>
        </nav>
        <div class="container">
            <div class="div-center">
                <h2><spring:message code="login.message"/></h2>
                <br>
                <c:url value="/showLogIn" var="loginUrl"/>
                <form:form action="${loginUrl}" method="POST" enctype="application/x-www-form-urlencoded">
                    <div>
                        <label for="username"><strong><spring:message code="login.user"/></strong></label>
                        <spring:message code="holder.mail" var="mail"/>
                        <input name="j_username" type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="${mail}">
                    </div>
                    <br>
                    <div>
                        <label for="password"><strong><spring:message code="login.password"/></strong></label>
                        <spring:message code="holder.newPassword" var="password"/>
                        <input name="j_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="${password}">
                    </div>
                    <br>
                    <div>
                        <label><input name="j_rememberme" type="checkbox"/> <spring:message code="login.remember_me"/></label>
                    </div>
                    <c:if test="${param.error != null}">
                        <p class="wrong"><spring:message code="login.invalid"/></p>
                    </c:if>
                    <c:if test="${param.logout != null}">
                        <c:redirect><c:url value="/"/></c:redirect>
                    </c:if>
                    <input type="submit" class="btn btn-primary custom-btn center-horizontal" value="Iniciar Sesión"/>
                    <br>
                    <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
                </form:form>
                <div class="center-horizontal">
                    <spring:message code="login.question"/>
                    <div class="center-horizontal">
                        <a href="<c:url value="/patientRegistration"/>"><spring:message code="dropdown.patientRegister"/></a> <spring:message code="login.or"/>
                        <a href="<c:url value="/doctorRegistration"/>"><spring:message code="dropdown.doctorRegister"/></a>
                    </div>
                </div>

            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
