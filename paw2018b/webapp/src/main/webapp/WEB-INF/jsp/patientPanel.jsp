<%--
  Created by IntelliJ IDEA.
  User: estebankramer
  Date: 26/09/2018
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><spring:message code="brand.name"/></title>
    <meta name="description" content="Waldoc">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- Pongo mi stylesheet despues de la de Bootstrap para poder hacer override los estilos -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/select2-bootstrap4.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
</head>
<body class="body-background">
<nav class="navbar navbar-dark" style="background-color: #257CBF; padding-bottom: 0px;">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/"/>">
            <h1><strong><spring:message code="brand.name"/></strong></h1>
        </a>
        <a>
            <security:authorize access="isAuthenticated()">
                <c:url value="/logout" var="logout"/>
                <form:form action="${logout}" method="post">
                    <security:authentication property="principal.username" var="userName"/>
                    <div class="dropdown">
                        <button class="btn btn-light dropdown-toggle" style="margin-right: 15px; background-color:transparent; border-color:white; color:white !important;" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><b><c:out value="${userName}"/></b></button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                            <button class="dropdown-item" type="submit"><spring:message code="logout.message"/></button>
                        </div>
                    </div>
                </form:form>
            </security:authorize>
        </a>
    </div>
</nav>

<div class="container">
    <div class="col-sm-12">
        <div class="card card-doctor flex-row">
            <div class="card-body">
                <div class="card-text">
                    <div class="row">
                        <div style="margin: 24px">
                            <p class="doctor-specialty"><spring:message code="welcome"/></p>
                            <h3 class="doctor-name"><c:out value="${patient.lastName}"/>, <c:out value="${patient.firstName}"/></h3>
                        </div>
                    </div>
                </div>
                <br>
                <div>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <%-- Future Appointments --%>
                        <li class="nav-item">
                            <a class="nav-link active" id="app-tab" data-toggle="tab" href="#appointments" role="tab" aria-controls="appointments" aria-selected="true"><spring:message code="patient.appointments"/></a>
                        </li>
                        <%-- Historical Appointments --%>
                        <li class="nav-item">
                            <a class="nav-link" id="history-pac-app" data-toggle="tab" href="#historical-appointments" role="tab" aria-controls="historical-appointments" aria-selected="false"><spring:message code="patient.historical"/></a>
                        </li>
                        <%-- Favorite Doctors --%>
                        <li class="nav-item">
                            <a class="nav-link" id="favorite-doctors-tab" data-toggle="tab" href="#fav-doc" role="tab" aria-controls="profile" aria-selected="false"><spring:message code="patient.favoriteDoctors"/></a>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">

                        <%-- Future Appointments --%>
                        <div class="tab-pane fade show active" id="appointments" role="tabpanel" aria-labelledby="app-tab">
                            <c:if test="${patientAppointments.size() == 0}">
                                <div>
                                    <div style="padding-top: 20px; padding-left: 20px; padding-right: 20px;">
                                        <div>
                                            <img class="center-img" src="https://i.imgur.com/qWxQY0d.png">
                                            <br>
                                            <h3 style="text-align: center;"><spring:message code="patient.noAppointments" /></h3>
                                            <p style="text-align: center;"><spring:message code="patient.noAppointmentsSub" /></p>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:forEach items="${patientAppointments}" var="appointment">
                                <div style="margin-left: 16px; margin-right: 16px;">
                                    <br>
                                    <h3>
                                            <%--<c:out value="${appointment.key}"></c:out>--%>
                                        <c:out value="${appointment.key.dayOfMonth}"/>-<c:out value="${appointment.key.monthValue}"/>-<c:out value="${appointment.key.year}"/>
                                    </h3>
                                    <br>
                                    <c:forEach items="${appointment.value}" var="listItems">
                                        <c:if test="${!listItems.appointmentCancelled}">
                                            <div>
                                                <div class="row" style="margin: 3px">
                                                    <div class="center-vertical">
                                                        <div>
                                                            <p style="margin-bottom: 0px"><c:out value="${listItems.appointmentTime}"/></p>
                                                            <c:set var="name" value="${listItems.doctor.firstName}"/>
                                                            <c:set var="lastName" value="${listItems.doctor.lastName}"/>
                                                            <h5><spring:message code="general.doctorName" arguments="${name}; ${lastName}" htmlEscape="false" argumentSeparator=";"/></h5>
                                                            <p style="margin-bottom: 0rem"><strong><spring:message code="registration.phone"/>:</strong> <c:out value="${listItems.doctor.phoneNumber}"/></p>
                                                            <p><strong><spring:message code="registration.address"/>:</strong> <c:out value="${listItems.doctor.address}"/></p>
                                                            <c:if test="${listItems.canCancel()}">
                                                                <form:form modelAttribute="appointment" method="POST" action="${specialist_id}" id="appointment">
                                                                    <c:set var="message"><spring:message code="patient.continue"/></c:set>
                                                                    <div class = "btn btn-primary custom-btn red" onclick="cancelAppointment('${listItems.doctor.id}','${listItems.appointmentDay}', '${listItems.appointmentTime}','${message}')">
                                                                        <spring:message code="patient.cancelAppointment"/>
                                                                    </div>
                                                                </form:form>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="hr-header-sidebar">
                                            </div>
                                        </c:if>
                                        <br>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>

                    <%-- Historical Appointments--%>
                    <div class="tab-pane fade" id="historical-appointments" role="tabpanel" aria-labelledby="history-pac-app">
                        <br>
                        <c:if test="${patientHistoricalAppointments.size() == 0}">
                            <div>
                                <div style="padding-top: 20px; padding-left: 20px; padding-right: 20px;">
                                    <div>
                                        <img class="center-img" src="https://i.imgur.com/qWxQY0d.png">
                                        <br>
                                        <h3 style="text-align: center;"><spring:message code="patient.noHistoricalAppointments" /></h3>
                                        <p style="text-align: center;"><spring:message code="patient.noHistoricalAppointmentsSub" /></p>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:forEach items="${patientHistoricalAppointments}" var="appointment">
                            <c:if test="${appointment.appointmentCancelled eq false}">
                                <div style="margin-left: 16px; margin-right: 16px;">
                                    <div>
                                        <div class="row" style="margin: 3px">
                                            <div class="center-vertical">
                                                <div>
                                                    <p style="margin-bottom: 0px"><c:out value="${appointment.appointmentDay}"/> <c:out value="${appointment.appointmentTime}"/></p>
                                                    <h5><b><c:out value="${appointment.doctor.lastName}"/></b>,  <c:out value="${appointment.doctor.firstName}"/></h5>
                                                    <p style="margin-bottom: 0rem;"><strong><spring:message code="registration.phone"/>:</strong> <c:out value="${appointment.doctor.phoneNumber}"/></p>
                                                    <p><strong><spring:message code="registration.address"/>:</strong> <c:out value="${appointment.doctor.address}"/></p>
                                                </div>
                                            </div>
                                            </div>
                                            <hr class="hr-header-sidebar">
                                        </div>
                                        <br>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <%-- Favorite Doctors--%>
                        <div class="tab-pane fade" id="fav-doc" role="tabpanel" aria-labelledby="favorite-doctors-tab">
                            <br>
                            <c:if test="${patient.favoriteDoctors.size() == 0}">
                                <div>
                                    <div style="padding-top: 20px; padding-left: 20px; padding-right: 20px;">
                                        <div>
                                            <img class="center-img" src="https://i.imgur.com/qWxQY0d.png">
                                            <br>
                                            <h3 style="text-align: center;"><spring:message code="patient.noFavorites" /></h3>
                                            <p style="text-align: center;"><spring:message code="patient.noFavoritesSub" /></p>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:forEach items="${patient.favorites}" var="favorite">
                                <c:if test="${favorite.favoriteCancelled eq false}">
                                    <div class="card card-doctor d-flex flex-row box"  onclick='window.location="<c:url value='/specialist/${favorite.doctor.id}'/>"'>
                                        <img src="<c:url value="/profile-image/${favorite.doctor.id}"/>" class="avatar">
                                        <div class="card-body">
                                            <div class="card-text">
                                                <h3 class="doctor-name">${favorite.doctor.lastName}, ${favorite.doctor.firstName}</h3>
                                                <div class="row container">
                                                    <c:forEach items="${favorite.doctor.specialties}" var="doctorSpecialty">
                                                        <p class="doctor-specialty" style="padding-right: 2em"><c:out value="${doctorSpecialty.speciality}"/></p>
                                                    </c:forEach>
                                                </div>
                                                <c:if test="${favorite.doctor.reviews.size() == 0}">
                                                    <br>
                                                </c:if>

                                                <c:if test="${favorite.doctor.reviews.size() > 0}">
                                                    <div style="margin-top:8px; margin-bottom:8px;" class="container row">
                                                        <c:forEach begin = "1" end = "${favorite.doctor.calculateAverageRating()}">
                                                            <i class="fas fa-star star-yellow star-small"></i>
                                                        </c:forEach>
                                                    </div>
                                                </c:if>

                                                <p class="doctor-text">${favorite.doctor.description.certificate}</p>
                                                <br>
                                                <p class="doctor-text"><i class="fas fa-map-marker-alt"></i> ${favorite.doctor.address}, CABA</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="<c:url value="/resources/javascript/patientPanel.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>