<%--
  Created by IntelliJ IDEA.
  User: estebankramer
  Date: 12/09/2018
  Time: 19:54
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/select2-bootstrap4.css" />">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
</head>
<body class="body-background">
<nav class="navbar navbar-dark" style="background-color: #257CBF; padding-bottom: 0px;">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/"/>">
            <h1><strong><spring:message code="brand.name"/></strong></h1>
        </a>
        <div class="row">
            <security:authorize access="!isAuthenticated()">
            <div class="dropdown" style="z-index: 1000000 !important;">
                <button class="btn btn-light dropdown-toggle" style="margin-right: 8px; background-color:transparent; border-color:white; color:white !important;" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                        <div class="dropdown">
                            <button class="btn btn-light dropdown-toggle" style="margin-right: 15px; background-color:transparent; border-color:white; color:#ffffff !important;" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><b><c:out value="${userName}"/></b></button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                                <button class="dropdown-item" type="submit"><spring:message code="logout.message"/></button>
                                <security:authorize access="hasRole('ROLE_DOCTOR')">
                                    <button class="btn btn-light btn-primary custom-btn dropdown-item" style="margin-right: 8px; background-color:transparent; border-color:#257CBF; !important;" type="button" onclick="window.location='<c:url value="/doctorPanel"/>'">
                                        <spring:message code="dropdown.viewProfile"/>
                                    </button>
                                    <button class="btn btn-light btn-primary custom-btn dropdown-item" style="margin-right: 8px; background-color:transparent; border-color:#257CBF; !important;" type="button" onclick="window.location='<c:url value="/specialist/${doctorID}'"/>">
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
                <form:options items="${insuranceList}" itemValue="name" itemLabel="name" />
            </form:select>
            <div class="input-group-append">
                <input type="submit" class="btn btn-outline-light" value="Buscar" path="submit"/>
            </div>
        </div>
    </form:form>
    </div>

<div class="container">
    <div>
        <div class="card flex-row" style="margin-top: 30px; margin-left: 0px !important; margin-right: 0px !important; ">
            <div class="card-body">
                <div class="card-text">
                    <div class="row">
                        <img class="avatar big" src="<c:url value="/profile-image/${doctor.id}"/>"/>
                        <div class="doctor-info-container">
                            <div>
                                <div class="row center-vertical">
                                    <c:set var="name" value="${doctor.firstName}"/>
                                    <c:set var="lastName" value="${doctor.lastName}"/>
                                    <h3 class="doctor-name" style="margin-left: 14px;"><spring:message argumentSeparator=";" htmlEscape="false" arguments="${name}; ${lastName}" code="general.doctorName"/></h3>
                                    <security:authorize access="isAuthenticated()">
                                        <c:if test="${user.isFavorite(doctor) || isFavorite eq true}">
                                            <form:form FmodelAttribute="favorite" method="POST" action="${specialist_id}" id="favorite">
                                                <div class="heart-added" onclick="removeFavorite()"></div>
                                            </form:form>
                                        </c:if>
                                        <c:if test="${user.isFavorite(doctor) eq false || isFavorite eq false}">
                                            <form:form modelAttribute="favorite" method="POST" action="${specialist_id}" id="favorite">
                                                <div class="heart" onclick="addFavorite()"></div>
                                                <%--<div class="heart" onclick="addFavorite('${user.id}', '${doctor.id}')"></div>--%>
                                            </form:form>
                                        </c:if>
                                    </security:authorize>

                                </div>
                                <div class="row container">
                                    <c:forEach items="${doctor.specialties}" var="doctorSpecialty">
                                        <p class="doctor-specialty" style="padding-right: 2em"><c:out value="${doctorSpecialty.speciality}"/></p>
                                    </c:forEach>
                                </div>
                                <p class="doctor-text"><i class="fas fa-phone" style="padding-right: 0.5em"></i><c:out value="${doctor.phoneNumber}"/></p>
                                <%--<p class="doctor-text"><i class="far fa-clock" style="padding-right: 0.5em"></i>${doctor.workingHours}</p>--%>
                                <p class="doctor-text"><i class="fas fa-map-marker-alt" style="padding-right: 0.5em"></i><c:out value="${doctor.address}"/>, CABA</p>
                                <%--<button type="button" class="btn btn-danger">Cancelar turno</button>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div style="background-color: #F3F3F4; border-radius: 5px; padding: 16px; padding-bottom: 0px; margin-top: 32px; margin-bottom:32px">
                        <h3 class="doctor-name"><spring:message code="specialist.reserveAppointment" /></h3>
                        <c:url var="specialist_id"  value="/specialist/${doctor.id}" />
                        <form:form modelAttribute="appointment" method="POST" action="${specialist_id}" id="appointment">
                            <div class="row">
                                    <div class="col-sm-5">
                                        <label for="day"><spring:message code="specialist.appointmentDay" /></label>
                                        <select class="custom-select" id="day" path="day" cssStyle="cursor: pointer;">
                                            <option value="no" selected><spring:message code="appointment.choose.day"/></option>
                                            <c:forEach items="${appointmentsAvailable}" var="date">
                                                <option value="${date.key}" label="${date.key}"><c:out value="${date.key}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                <div class="col-sm-5">
                                    <label for="time"><spring:message code="specialist.appointmentTime"/></label>
                                    <select class="custom-select" disabled="false" id="time" path="time" cssStyle="cursor: pointer;">
                                        <option value="no" label="Elegi el Horario" selected><spring:message code="appointment.choose.time"/></option>
                                    <c:forEach items="${appointmentsAvailable}" var="date">
                                        <c:forEach items="${date.value}" var="listItem">
                                            <option value="${listItem.appointmentDay}_${listItem.appointmentTime}" day="${listItem.appointmentDay}" time="${listItem.appointmentTime}"><c:out value="${listItem.appointmentTime}"/></option>
                                            <%--<input type="hidden" id="time" name="time" value="${listItem.appointmentTime}">--%>
                                        </c:forEach>
                                    </c:forEach>
                                    </select>
                                </div>
                                <security:authorize access="!isAuthenticated()">
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-primary custom-btn" style="position: absolute; bottom: 0;" onclick="window.location='<c:url value="/showLogIn"/>'"><spring:message code="appointment.choose"/></button>
                                </div>
                                </security:authorize>
                                <security:authorize access="isAuthenticated()">
                                    <div class="col-sm-2">
                                        <button type="submit" class="btn btn-primary custom-btn" path="submit" style="position: absolute; bottom: 0;"><spring:message code="appointment.choose"/></button>
                                    </div>
                                </security:authorize>
                            </div>
                            <br>
                        </form:form>
                    </div>

                    <h3 id="information"><spring:message code="specialist.infoTitle" /></h3>
                    <br>
                    <c:if test="${not empty doctor.description.certificate}">
                        <h4><spring:message code="specialist.certificate" /></h4>
                        <c:forEach items="${doctor.description.certificate}" var="certificate">
                            <c:out value="${certificate}"/>
                        </c:forEach>
                        <br>
                        <br>
                    </c:if>
                    <c:if test="${not empty doctor.description.education}">
                        <h4><spring:message code="specialist.education" /></h4>
                        <c:forEach items="${doctor.description.education}" var="education">
                           <c:out value="${education}"/>
                        </c:forEach>
                        <br>
                        <br>
                    </c:if>
                    <h4><spring:message code="specialist.insurances" /></h4>
                    <div class="row container">
                        <c:forEach items="${doctor.insuranceListFromInsurancePlans}" var="insurance">
                            <div class="card col-sm-3" style="margin-right:2rem; padding-left: 0; padding-right: 0; margin-top:8px;">
                                <div class="card-header">
                                    <strong><c:out value="${insurance.name}"/></strong>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <c:forEach items="${doctor.getInsurancePlansFromInsurance(insurance)}" var="plan">
                                        <li class="list-group-item" style="max-height: 24rem"><c:out value="${plan.plan}"/></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:forEach>
                    </div>
                    </br>
                    <c:if test="${doctor.description.languages.length() > 0 && languagesNo eq false}">
                        <h4><spring:message code="specialist.languages" /></h4>
                        <c:forEach items="${doctor.description.languages}" var="languages">
                                <c:out value="${languages}"/>
                        </c:forEach>
                        <br>
                        <br>
                    </c:if>
                </div>
                <hr>
                <c:if test="${doctor.reviews.size() > 0}">
                <div>
                    <h4><spring:message code="panel.review"/></h4>
                    <br>
                    <c:forEach items="${doctor.reviews}" var="review">
                        <p style="margin-bottom: 4px"><strong><c:out value="${review.reviewerFirstName} ${review.reviewerLastName}"/></strong></p>
                        <div class="container row">
                            <c:forEach begin = "1" end = "${review.stars}">
                                <i class="fas fa-star star-yellow star-small"></i>
                            </c:forEach>
                        </div>
                        <p><c:out value="${review.description}"/></p>
                        <hr style="margin-top:8px; margin-bottom: 8px;">
                    </c:forEach>
                    <br>
                </div>
                </c:if>
                <security:authorize access="isAuthenticated()">
                    <div>
                        <h4><spring:message code="panel.leave.review"/></h4>
                        <br>
                        <c:url var="specialist_id"  value="/specialist/${doctor.id}" />
                        <form:form modelAttribute="review" method="POST" action="${specialist_id}" id="review">
                            <div class="form-group">
                                <label for="stars"><spring:message code="panel.review.stars"/></label>
                                <form:select class="form-control" id="stars" path="stars">
                                    <option><spring:message code="one"/></option>
                                    <option><spring:message code="two"/></option>
                                    <option><spring:message code="three"/></option>
                                    <option><spring:message code="four"/></option>
                                    <option><spring:message code="five"/></option>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label for="description"><spring:message code="panel.review.experience"/></label>
                                <form:textarea class="form-control" id="description" path="description" rows="3"/>
                            </div>
                            <button type="submit" class="btn btn-primary custom-btn mb-2"><spring:message code="panel.review.send"/></button>

                        </form:form>
                    </div>
                </security:authorize>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<%--select2 dropdown--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="<c:url value="/resources/javascript/specialist.js"/>"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>

