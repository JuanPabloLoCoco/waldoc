<%--
  Created by IntelliJ IDEA.
  User: martinascomazzon
  Date: 25/8/18
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><spring:message code="brand.name"/></title>
    <meta name="description" content="Roughly 155 characters">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/select2-bootstrap4.css" />">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
</head>
<body class="body-background">
<nav class="navbar navbar-dark" style="background-color: #257CBF; padding-bottom: 0px;">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/"/>">
            <h1><strong><spring:message code="brand.name" /></strong></h1>
        </a>
        <a>
            <div class="row">
                <security:authorize access="!isAuthenticated()">
                <div class="dropdown" style="z-index: 1000000 !important;">
                    <button class="btn btn-light dropdown-toggle" style="margin-right: 8px; background-color:transparent; border-color:white; color:white !important;" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <spring:message code="register"/>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                        <button class="dropdown-item" type="button" onclick="window.location='<c:url value="/patientRegistration"/>'"><spring:message code="dropdown.patientRegister"/></button>
                        <button class="dropdown-item" type="button" onclick="window.location='<c:url value="/doctorRegistration"/>'"><spring:message code="dropdown.doctorRegister"/></button>
                    </div>
                </div>
                </security:authorize>
                <div>
                    <security:authorize access="!isAuthenticated()">
                        <button class="btn btn-secondary" style="background-color:transparent; border-color:transparent;" type="button" onclick="window.location='<c:url value="/showLogIn"/>'">
                            <spring:message code="login.message"/>
                        </button>
                    </security:authorize>
                    <security:authorize access="isAuthenticated()">
                        <c:url value="/logout" var="logout"/>
                        <form:form action="${logout}" method="post">
                            <security:authentication property="principal.username" var="userName"/>
                            <div class="dropdown" >
                                <button class="btn btn-light dropdown-toggle" style="margin-right: 15px; background-color:transparent; border-color:white; color:#ffffff !important;" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><b>${userName}</b></button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                                    <button class="dropdown-item" type="submit"><spring:message code="logout.message"/></button>
                                    <%--ARREGLAR !!! hay que arreglar el dropdown se ve por abajo del search form--%>
                                    <security:authorize access="hasRole('ROLE_DOCTOR')">
                                        <button class="btn btn-light btn-primary custom-btn dropdown-item" style="margin-right: 8px; background-color:transparent; border-color:#257CBF; !important;" type="button" onclick="window.location='<c:url value="/doctorPanel"/>'">
                                            <spring:message code="dropdown.viewProfile"/>
                                        </button>
                                        <button class="btn btn-light btn-primary custom-btn dropdown-item" style="margin-right: 8px; background-color:transparent; border-color:#257CBF; !important;" type="button" onclick="window.location='<c:url value="/specialist/${doctorID}"/>'">
                                            <spring:message code="dropdown.viewInfo"/>
                                        </button>
                                    </security:authorize>
                                    <security:authorize access="hasRole('ROLE_PATIENT') and !hasRole('ROLE_DOCTOR')">
                                        <button class="btn btn-light dropdown-item" style="margin-right: 8px; background-color:transparent; border-color:#257CBF; !important;" type="button" onclick="window.location='<c:url value="/patientPanel"/>'">
                                            <spring:message code="dropdown.viewProfile"/>
                                        </button>
                                    </security:authorize>
                                </div>
                            </div>
                        </form:form>
                    </security:authorize>
                </div>
            </div>
        </a>
    </div>
</nav>

<div class="navbar-search sticky-top">
    <%--action="${postPath}--%>
    <c:url value="/processForm/0" var="processForm"/>
    <form:form action="${processForm}" method="GET" modelAttribute="search" accept-charset="ISO-8859-1">
        <div id="search-bar" class="input-group container">
            <form:input type="text" aria-label="Buscar por especialista" placeholder="Buscar por nombre del médico" class="form-control" path="name"/>
            <form:select class="custom-select specialist-select" id="specialty" path="specialty" cssStyle="cursor: pointer;">
                <form:option value="noSpecialty" label="Especialidad" selected="Especialidad"/>
                <form:options items="${specialtyList}" itemValue="speciality" itemLabel="speciality" />
            </form:select>
                <%--<form:input type="text" aria-label="Buscar por especialidad" placeholder="Buscar por especialidad" class="form-control" path="specialty"/>--%>
            <form:select class="custom-select specialist-select" id="insurance" path="insurance" cssStyle="cursor: pointer;">
                <form:option value="no" label="Prepaga" selected="Prepaga"/>
                <form:options items="${insurances}" itemValue="name" itemLabel="name" />
            </form:select>
            <div class="input-group-append">
                <input type="submit" class="btn btn-outline-light" value="Buscar" path="submit"/>
            </div>
        </div>
</div>


<div class="main container">
    <div class="row">
        <div class="col-md-9">
            <c:if test="${notFound}">
            <div id="no-results" class="card card-doctor">
                <div style="padding-top: 20px; padding-left: 20px; padding-right: 20px;">
                    <div class="media">
                        <div class="media-left">
                            <i class="fas fa-exclamation-triangle" style="color:#CECECE; font-size: 24px; float: left; padding-right: 16px"></i>
                        </div>
                        <div class="media-body">
                            <h3><spring:message code="search.noResultsTitle" /></h3>
                            <p><spring:message code="search.noResultsSubtitle" /></p>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>
            <c:forEach items="${doctorList}" var="doctorListItem">
                <div class="card card-doctor d-flex flex-row box"  onclick='window.location="<c:url value='/specialist/${doctorListItem.id}'/>"'>
                    <img src="<c:url value="/profile-image/${doctorListItem.id}"/>" class="avatar">
                    <div class="card-body">
                        <div class="card-text">
                            <c:set var="name" value="${doctorListItem.firstName}"/>
                            <c:set var="lastName" value="${doctorListItem.lastName}"/>
                            <h3 class="doctor-name"><spring:message code="general.doctorName" arguments="${name}; ${lastName}" htmlEscape="false" argumentSeparator=";"/></h3>
                            <div class="row container">
                                <c:forEach items="${doctorListItem.specialties}" var="doctorSpecialty">
                                    <p class="doctor-specialty" style="padding-right: 2em"><c:out value="${doctorSpecialty.speciality}"/></p>
                                </c:forEach>
                            </div>
                            <c:if test="${doctorListItem.reviews.size() == 0}">
                                <br>
                            </c:if>

                            <c:if test="${doctorListItem.reviews.size() > 0}">
                                <div style="margin-top:8px; margin-bottom:8px;" class="container row">
                                    <c:forEach begin = "1" end = "${doctorListItem.calculateAverageRating()}">
                                        <i class="fas fa-star star-yellow star-small"></i>
                                    </c:forEach>
                                </div>
                            </c:if>

                            <p class="doctor-text">${doctorListItem.description.certificate}</p>
                            <br>
                            <p class="doctor-text"><i class="fas fa-map-marker-alt"></i> ${doctorListItem.address}, <spring:message code="city"/></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </br>
            <c:if test="${totalPages > 0}">
                <nav aria-label="...">
                    <ul class="pagination">
                        <c:forEach var="page" begin="${1}" end="${totalPages-1}">
                            <c:if test="${currentPage+1 == page}">
                                <li class="page-item active">
                              <span class="page-link" style="background-color: #257CBF; border-color: transparent;">
                                      ${page}
                              </span>
                                </li>
                            </c:if>
                            <c:if test="${currentPage+1 != page}">
                                <li class="page-item"><a class="page-link" style="color: #257CBF;" href="<c:url value="/processForm/${page-1}?name=&specialty=${qSpecialty}&insurance=${qInsurance}&_insurancePlan=no&sex=${qSex}&days=${qDay}"/>">${page}</a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </nav>
            </c:if>
        </div>
        <div class="col-md-3">
            <div class="sidebar-nav-fixed pull-right affix">
                <h3 class="sidebar-title"><spring:message code="filter.title" /></h3>
                <%--<c:choose>--%>
                    <%--<c:when test="${insuranceNameList.size() == 1 && sexList.size() != 1}">--%>
                        <hr class="hr-header-sidebar">
                        <c:choose>
                            <c:when test="${search.insurance != 'no' || sexes.size() != 1 || futureDays.size() > 0}">
                                <div>
                                    <c:if test="${search.insurance != 'no'}">
                                        <h4 class="sidebar-title"><spring:message code="specialist.insurancesPlan.title"/></h4>
                                            <div class="form-check">
                                                <b> ${searchInsurance.name} <br> </b>
                                                    <form:checkboxes path="insurancePlan" items="${searchInsurance.plans}" itemValue="plan" itemLabel="plan" delimiter="<br>" />
                                                <br>
                                            </div>
                                    </c:if>
                                        <%--<hr class="hr-sidebar">--%>
                                    <div>
                                        <c:if test="${sexes.size() > 1 }">
                                            <h4 class="sidebar-title"><spring:message code="specialist.sex"/></h4>
                                            <div class="form-check">
                                                <form:radiobutton path="sex" value="ALL"/> <spring:message code="specialist.all"/><br>
                                                <c:forEach items="${sexes}" var="sex">
                                                    <form:radiobutton path="sex" value="${sex}"/>
                                                    <c:if test="${sex.equals('M')}"><spring:message code="registration.male"/><br></c:if>
                                                    <c:if test="${sex.equals('F')}"><spring:message code="registration.female"/><br></c:if>
                                                </c:forEach>
                                            </div>
                                        </c:if>
                                    </div>
                                    <c:if test="${futureDays.size() > 0}">
                                        <div>
                                            <br>
                                            <h4 class="sidebar-title">
                                                <spring:message code="specialist.futureDays"/>
                                                <br>
                                            </h4>
                                            <div class="form-check">
                                                <form:radiobutton path="days" value="no"/> <spring:message code="specialist.anyDay"/><br>
                                                <c:forEach items="${futureDays}" var="day">
                                                    <form:radiobutton path="days" value="${day}"/>
                                                    <c:out value="${day}"/><br>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="center-horizontal">
                                    <i class="fas fa-exclamation-triangle center-horizontal" style="color:#CECECE; font-size: 36px; margin-bottom: 16px; margin-top: 16px "></i>
                                    <p><spring:message code="filter.notApplicable" /></p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                </form:form>
            </div>
    </div>
</div>

<%--<footer class="footer-grey">--%>
    <%--<div class="container">--%>
        <%--<p class="footer-text">© Copyright 2018. Waldoc</p>--%>
    <%--</div>--%>
<%--</footer>--%>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

    <%--select2 dropdown--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script src="<c:url value="/resources/javascript/dropdowns.js"/>"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>
