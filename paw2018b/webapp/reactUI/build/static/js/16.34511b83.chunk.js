(this.webpackJsonpfrontend=this.webpackJsonpfrontend||[]).push([[16],{119:function(e,a,t){"use strict";var r=t(16),n=t(25),o=t(78),i=t.n(o),s=t(60),c=t(63),l=t(64),u=t(65),d=t(66),m=t(0),p=t.n(m),h=t(18),g=t(117),v=t(72),f=t.n(v),b=t(87),y=t.n(b),E=t(71),S=t(69),w=function(e){function a(e){var t;return Object(s.a)(this,a),(t=Object(l.a)(this,Object(u.a)(a).call(this,e)))._isMounted=!1,t.API=new E.a,t.state={insurances:[],selectedInsurance:null,specialties:[],selectedSpecialty:null,selectedName:"",searchQuery:""},t}return Object(d.a)(a,e),Object(c.a)(a,[{key:"componentDidMount",value:function(){var e,a,t,r=this;return i.a.async((function(n){for(;;)switch(n.prev=n.next){case 0:return this._isMounted=!0,n.next=3,i.a.awrap(localStorage.getItem("lastUpdate"));case 3:if(e=n.sent,!(y.a.duration(y()().diff(e)).asMinutes()<3)){n.next=14;break}return n.next=7,i.a.awrap(localStorage.getItem("insurances"));case 7:return a=n.sent,n.next=10,i.a.awrap(localStorage.getItem("specialties"));case 10:t=n.sent,this._isMounted&&this.setState({insurances:JSON.parse(a),specialties:JSON.parse(t)}),n.next=15;break;case 14:this.API.get("/homeinfo").then((function(e){var a=[],t=[];e.data.specialties.map((function(e){return a.push({value:e,label:e})})),e.data.insurances.map((function(e){return t.push({value:e.name,label:e.name})})),r._isMounted&&(r.setState({insurances:t,specialties:a}),localStorage.setItem("insurances",JSON.stringify(t)),localStorage.setItem("specialties",JSON.stringify(a)),localStorage.setItem("lastUpdate",y()()))}));case 15:case"end":return n.stop()}}),null,this)}},{key:"componentWillUnmount",value:function(){this._isMounted=!1}},{key:"handleChange",value:function(e){var a,t,r;return i.a.async((function(o){for(;;)switch(o.prev=o.next){case 0:return a=e.target,t=a.name,r=a.value,o.next=3,i.a.awrap(this.setState(Object(n.a)({},t,r)));case 3:this.buildString();case 4:case"end":return o.stop()}}),null,this)}},{key:"handleSelect",value:function(e,a){return i.a.async((function(t){for(;;)switch(t.prev=t.next){case 0:if("specialty"!==a){t.next=5;break}return t.next=3,i.a.awrap(this.setState({selectedSpecialty:e}));case 3:t.next=7;break;case 5:return t.next=7,i.a.awrap(this.setState({selectedInsurance:e}));case 7:this.buildString();case 8:case"end":return t.stop()}}),null,this)}},{key:"buildString",value:function(){var e=this.state,a=e.selectedName,t=e.selectedInsurance,r=e.selectedSpecialty,n=""===a?null:a,o=t?t.label:null,i=r?r.label:null,s=f.a.stringify({name:n,insurance:o,specialty:i},{skipNull:!0});this.setState({searchQuery:s})}},{key:"render",value:function(){var e=this,a=this.state,t=a.insurances,n=a.selectedInsurance,o=a.specialties,i=a.selectedSpecialty,s=a.selectedName,c=this.props.dark,l={control:function(e,a){return Object(r.a)({},e,{boxShadow:(a.isFocused,0),borderColor:c?"#FFF":"#ced4da","&:hover":{borderColor:c?"#FFF":"#ced4da"}})}};return p.a.createElement("form",null,p.a.createElement("div",{className:"form-row"},p.a.createElement("div",{className:"form-group mb-0 col-md-5 mr-0"},p.a.createElement("input",{type:"text","aria-label":S.a.t("home.labelDoctor"),placeholder:S.a.t("home.placeHolderDoctor"),className:"form-control",name:"selectedName",value:s,style:c?{borderColor:"#FFF"}:{},onChange:function(a){return e.handleChange(a)}})),p.a.createElement("div",{className:"form-group mb-0 col-md-3"},p.a.createElement(g.a,{value:i,onChange:function(a){return e.handleSelect(a,"specialty")},options:o,placeholder:S.a.t("home.placeHolderSpeciality"),loadingMessage:function(){return p.a.createElement("p",{className:"w-text-light mb-0"},S.a.t("home.loadingSpecialties"))},styles:l,isLoading:0===o.length})),p.a.createElement("div",{className:"form-group mb-0 col-md-3"},p.a.createElement(g.a,{value:n,onChange:function(a){return e.handleSelect(a,"insurance")},options:t,placeholder:S.a.t("home.placeHolderInsurance"),styles:l,isLoading:0===t.length,loadingMessage:function(){return p.a.createElement("p",{className:"w-text-light mb-0"},S.a.t("home.loadingInsurances"))}})),p.a.createElement("div",{className:"col-md-1 pl-1 pr-0 mr-0"},p.a.createElement(h.b,{className:"btn btn-block "+(c?"btn-light":"btn-primary custom-btn"),to:"/specialists?"+this.state.searchQuery,style:{textDecoration:"none",color:c?"#000":"#FFF"}},S.a.t("home.searchButton")))))}}]),a}(p.a.Component);a.a=w},296:function(e,a,t){"use strict";t.r(a);var r=t(60),n=t(63),o=t(64),i=t(65),s=t(66),c=t(0),l=t.n(c),u=t(119),d=t(28),m=t.n(d),p=t(69),h=function(e){function a(){return Object(r.a)(this,a),Object(o.a)(this,Object(i.a)(a).apply(this,arguments))}return Object(s.a)(a,e),Object(n.a)(a,[{key:"render",value:function(){return l.a.createElement("div",{className:"jumbotron jumbotron-background min-vh-100"},l.a.createElement("div",{className:"container",style:{marginBottom:120}},l.a.createElement(m.a,{top:!0,cascade:!0},l.a.createElement("p",{className:"jumbotron-subtitle fadeIn"},p.a.t("home.jumbotronTitle")),l.a.createElement("div",{className:"navbar-search-home"},l.a.createElement(u.a,null)))))}}]),a}(l.a.Component),g=function(){return l.a.createElement("div",{className:"container"},l.a.createElement("div",{className:"margin-big"},l.a.createElement("p",{className:"jumbotron-subtitle smaller"},p.a.t("home.title")),l.a.createElement("p",{className:"jumbotron-text"},p.a.t("home.subtitle"))),l.a.createElement("div",{className:"d-flex flex-row margin-bottom-medium"},l.a.createElement("img",{src:"https://i.imgur.com/StIDems.jpg",className:"image-rectangle"}),l.a.createElement("div",null,l.a.createElement("div",{className:"list-home"},l.a.createElement("h3",null,p.a.t("home.searchTitle")),l.a.createElement("p",{className:"doctor-text"},p.a.t("home.searchSubtitle"))))),l.a.createElement("div",{className:"d-flex flex-row-reverse margin-bottom-medium"},l.a.createElement("img",{src:"https://i.imgur.com/N7X4FiE.jpg",className:"image-rectangle-right"}),l.a.createElement("div",null,l.a.createElement("div",{className:"list-home-right"},l.a.createElement("h3",null,p.a.t("home.chooseTitle")),l.a.createElement("p",null,p.a.t("home.chooseSubtitle"))))),l.a.createElement("div",{className:"d-flex flex-row pb-5"},l.a.createElement("img",{src:"https://i.imgur.com/yjHKj1P.jpg",className:"image-rectangle"}),l.a.createElement("div",null,l.a.createElement("div",{className:"list-home"},l.a.createElement("h3",null,p.a.t("home.reserveTitle")),l.a.createElement("p",null,p.a.t("home.reserveSubtitle"))))))},v=function(e){function a(){return Object(r.a)(this,a),Object(o.a)(this,Object(i.a)(a).apply(this,arguments))}return Object(s.a)(a,e),Object(n.a)(a,[{key:"render",value:function(){return l.a.createElement("div",{className:"body-background"},l.a.createElement(h,null),l.a.createElement(g,null))}}]),a}(l.a.Component);a.default=v},69:function(e,a,t){"use strict";var r=t(82),n=t(83);r.a.use(n.a).init({fallbackLng:"es",debug:!0,interpolation:{escapeValue:!1},resources:{es:{translation:{home:{jumbotronTitle:"\xbfBuscas un m\xe9dico?",placeHolderDoctor:"Nombre del m\xe9dico",labelDoctor:"Buscar por nombre del m\xe9dico",placeHolderSpeciality:"Especialidad",placeHolderInsurance:"Prepaga",searchButton:"Buscar",title:"Sacar un turno nunca fue tan f\xe1cil",subtitle:"Segu\xed estos simples pasos",searchTitle:"Busc\xe1",searchSubtitle:"en nuestro catalogo de m\xe9dicos",chooseTitle:"Eleg\xed",chooseSubtitle:"el m\xe9dico adecuado para tu condici\xf3n",reserveTitle:"Reserv\xe1",reserveSubtitle:"un turno con un solo click",loadingSpecialties:"Cargando especialidades...",loadingInsurances:"Cargando prepagas..."},navigation:{title:"Waldoc",patientRegistrationTitle:"Registrarse como paciente",doctorRegistrationTitle:"Registrarse como m\xe9dico",logInButton:"Iniciar Sesi\xf3n",myAccountTitle:"Mi Cuenta",logOutButton:"Cerrar Sesi\xf3n",noResults:"No hay resultados",changeFilters:"Intenta cambiar los filtros de b\xfasqueda",filters:"Filtros",register:"Registrarse"},specialist:{city:", CABA",favoriteTitle:"Doctores favoritos",description:"Descripci\xf3n",insurancesPlans:"Prepagas M\xe9dicas",list:"Cargar m\xe1s resultados",placeHolderName:"Nombre...",workingDay:"D\xeda de Atenci\xf3n",notAvailable:"no disponible",studies:"Estudios",certificate:"Certificados",languages:"Idiomas"},review:{reviewThanks:"\xa1Gracias por compartir tu rese\xf1a con nosotros!",register:"Registrate o inici\xe1 sesi\xf3n para dejar una rese\xf1a",appointment:"Solo podes dejar una rese\xf1a desp\xfaes de asistir a un turno",stars:"Estrellas",starsOption:"Elegir una opci\xf3n",comments:"Comentarios",placeHolderComments:"Ingres\xe1 tu comentario",button:"Dejar rese\xf1a",reviewTitle:"Rese\xf1as",leaveReview:"Dej\xe1 tu rese\xf1a"},appointment:{at:" a las ",cancel:"Cancelar Turno",futureTitle:"Turnos pendientes",historicalTitle:"Historial de turnos",reserve:"Reservar Turno",selectDateTime:"Seleccionar una fecha y horario disponible",date:"Fecha",time:"Horario",error:"No pudimos reservar el turno",reserved:"Turno Reservado",close:"Cerrar",register:"Registrate o inici\xe1 sesi\xf3n para poder reservar un turno"},error:{problem:"Hubo un problema",error:"Hubo un error",toHome:"Ir a la p\xe1gina principal"},login:{welcome:"Bienvenido",email:"Correo Electr\xf3nico",placeHolderEmail:"Ingres\xe1 tu correo electr\xf3nico",password:"Contrase\xf1a",placeHolderasPsword:"Ingres\xe1 tu contrase\xf1a",error:"Correo Electr\xf3nico o Contrase\xf1a inv\xe1lidos",accountQuestion:"\xbfNo tenes una cuenta?",register:"Registrate",registerPatient:"Registrate como paciente",registerDoctor:"registrate como m\xe9dico",or:"o",cancel:"Cancelar"},register:{emptyField:"El campo no puede quedar vac\xedo",studies:"Estudios",placeHolderStudies:"Ingres\xe1 tus estudios",descriptionStudies:"Ingres\xe1 informaci\xf3n sobre tus estudios",descriptionCertificate:"Ingres\xe1 informaci\xf3n sobre tus t\xedtulos",languages:"Idiomas",selectLanguages:"Seleccion\xe1 uno o m\xe1s idiomas",speciality:"Especialidades",placeHolderSpeciality:"Busc\xe1 tus especialidades",selectSpeciality:"Seleccion\xe1 una o m\xe1s especialidades",selectedSpeciality:"Estas son las especialidades que agregaste:",selectInsurance:"Seleccion\xe1 los planes de las prepagas con las que trabajas",selectInsuranceLabel:"Seleccion\xe1 al menos un plan",workingHours:"Ingres\xe1 tus horarios de atenci\xf3n",placeHolderWorkingHoursStart:"Inicio (Ej: 9Hs)",placeHolderWorkingHoursFinish:"Fin (Ej: 18Hs)",errorDay:"Complet\xe1 al menos un d\xeda",continueButton:"Continuar",backButton:"Atr\xe1s",me:"Registrarme",completeProfTitle:"Complet\xe1 tu informaci\xf3n profesional",problem:"Hubo un problema",notRegister:"No pudimos activar tu cuenta",toHome:"Ir a la p\xe1gina principal",activatedAccount:"Cuenta activada",activatedAccessAccount:"Ya podes acceder a tu cuenta",licenseValidation:"La licencia debe tener entre 0 y 10 d\xedgitos",emailValidation:"Ingrese una correo electr\xf3nico v\xe1lido",validEmail:"Correo Electr\xf3nico v\xe1lido",validPassword:"La contrase\xf1a debe tener al menos 6 caracteres",notMatchingPassword:"Las contrase\xf1as no coinciden",matchingPassword:"Las contrase\xf1as coinciden",confirmPassword:"Confirmar Contrase\xf1a",placeHolderPassword:"Ingres\xe1 tu contrase\xf1a",name:"Nombre",placeHolderName:"Ingres\xe1 tu nombre",validName:"Ingres\xe1 un nombre v\xe1lido",lastName:"Apellido",placeHolderLastName:"Ingres\xe1 tu apellido",validLastName:"Ingres\xe1 un apellido",address:"Direcci\xf3n",placeHolderAddress:"Ingres\xe1 tu Direcci\xf3n",validAddress:"Ingres\xe1 una direcci\xf3n v\xe1lida",phoneNumber:"Tel\xe9fono",placeHolderPhoneNumber:"Ingres\xe1 tu tel\xe9fono",validPhoneNumber:"Ingres\xe1 un n\xfamero de tel\xe9fono v\xe1lido",gender:"Sexo",optionGender:"Elegir una opci\xf3n",male:"Masculino",female:"Femenino",license:"Licencia Profesional",placeHolderLicense:"Ingres\xe1 tu licencia",asPatient:"Registrate como paciente",asDoctor:"Registrate como m\xe9dico",basicInfo:"Datos B\xe1sicos",personalInfo:"Datos Personales",welcome:"Bienvenido a Waldoc",emailMessage:"En breve, vas recibir un correo electr\xf3nico para confirmar tu cuenta",photo:"Foto de perfil",photoUpload:"Arrastr\xe1 tu foto ac\xe1 o hace click en la caja",photoUploadError:"El archivo debe ser de tipo imagen",certificate:"Titulos",placeHolderCertificate:"Ingres\xe1 tus titulos acad\xe9micos",repeatedEmail:"El email ya esta siendo utilizado",repeatedLicense:"La licencia ya esta siendo utilizada"},favorite:{remove:"Eliminar de favoritos",add:"Agregar a favoritos"},week:{monday:"Lunes",tuesday:"Martes",wednesday:"Mi\xe9rcoles",thursday:"Jueves",friday:"Viernes",saturday:"S\xe1bado",sunday:"Domingo"},account:{accountInfo:"Mi Cuenta",patientAppointments:"Turnos Como M\xe9dico",noResults:"No ten\xe9s"}}},en:{translation:{home:{jumbotronTitle:"Looking for a doctor?",placeHolderDoctor:"Doctor's name",labelDoctor:"Search by doctor's name ",placeHolderSpeciality:"Speciality",placeHolderInsurance:"Medical Care",searchButton:"Search",title:"Feeling ill? Waldoc has you covered",subtitle:"Booking appointments has never been easier",searchTitle:"Search",searchSubtitle:"our catalogue of qualified doctors",chooseTitle:"Choose",chooseSubtitle:"the doctor that's right for your condition",reserveTitle:"Book",reserveSubtitle:"an appointment with one click",loadingSpecialties:"Loading specialties...",loadingInsurances:"Loading medical care..."},navigation:{title:"Waldoc",patientRegistrationTitle:"Sign up as a patient",doctorRegistrationTitle:"Sign up as a doctor",logInButton:"Log In",myAccountTitle:"My Account",logOutButton:"Log Out",noResults:"There are no results",changeFilters:"Change search filters",filters:"Filters",register:"Sign Up"},specialist:{city:", CABA",favoriteTitle:"Favorite Doctors",description:"Description",insurancesPlans:"Medical Care",list:"Load more results",placeHolderName:"Name...",workingDay:"Day",notAvailable:"not available",studies:"Studies",certificate:"Certificate",languages:"Languages"},review:{reviewThanks:"Thank you for sharing your review with us!",register:"Sign up or log in to submit a review",appointment:"You can only leave a review after attending an appointment",stars:"Stars",starsOption:"Choose an option",comments:"Comments",placeHolderComments:"Leave your comment",button:"Leave Review",reviewTitle:"Reviews",leaveReview:"Leave your Review"},appointment:{at:" at ",cancel:"Cancel Appointment",futureTitle:"Pending Appointments",historicalTitle:"Previous Appointments",reserve:"Reserve an Appointment",selectDateTime:"Select an available date and time",date:"Date",time:"Time",error:"We couldn't reserve your appointment",reserved:"Reserved Appointment",close:"Close",register:"Sign up or log in to reserve an appointment"},error:{problem:"There was a problem",error:"There was an error",toHome:"Go to Home Page"},login:{welcome:"Welcome",email:"Email",placeHolderEmail:"Enter your email",password:"Password",placeHolderasPsword:"Enter your password",error:"Not valid email or password",accountQuestion:"Don't have an account?",register:"Sign up",registerPatient:"Sign up as a patient",registerDoctor:"sign up as a doctor",or:"or",cancel:"Cancel"},register:{emptyField:"Field can not be left empty",studies:"Academic Studies",placeHolderStudies:"Enter your academic studies",descriptionStudies:"Enter information about your academic studies",descriptionCertificate:"Enter information about your academic certificates",languages:"Languages",selectLanguages:"Choose one or more languages",speciality:"Specialities",placeHolderSpeciality:"Search your specialities",selectSpeciality:"Choose one or more specialities",selectedSpeciality:"These are the specialities you added:",selectInsurance:"Choose the insurance plans you work with",selectInsuranceLabel:"Choose at least one insurance plan",workingHours:"Enter your working hours",placeHolderWorkingHoursStart:"Start (Ex: 9Hs)",placeHolderWorkingHoursFinish:"Fin (Ex: 18Hs)",errorDay:"Complete at least one day",continueButton:"Continue",backButton:"Back",me:"Send",completeProfTitle:"Complete your professional information",problem:"There was a problem",notRegister:"We coulnd't activate your account",toHome:"Go to Home Page",activatedAccount:"Activated Account",activatedAccessAccount:"You can now access your account",licenseValidation:"The license must be between 0 and 10 digits",emailValidation:"Enter a valid email",validEmail:"Valid Email",validPassword:"Password must be at least 6 characters",notMatchingPassword:"Passwords do not match",matchingPassword:"Passwords match",confirmPassword:"Confirm Password",placeHolderPassword:"Enter your password",name:"Name",placeHolderName:"Enter your name",validName:"Enter a valid name",lastName:"Last Name",placeHolderLastName:"Enter your Last Name",validLastName:"Enter a valid Last Name",address:"Address",placeHolderAddress:"Enter your Address",validAddress:"Enter a valid Address",phoneNumber:"Phone Number",placeHolderPhoneNumber:"Enter your Phone Number",validPhoneNumber:"Enter a valid Phone Number",gender:"Gender",optionGender:"Choose an option",male:"Male",female:"Female",license:"Professional License",placeHolderLicense:"Enter your professional license",asPatient:"Sign up as a patient",asDoctor:"Sign up as a doctor",basicInfo:"Basic Data",personalInfo:"Personal Data",welcome:"Welcome to Waldoc",emailMessage:"Soon, you will receive an email to confirm your account",photo:"Profile picture",photoUpload:"Upload your photo by dragging it here or clicking on the box",photoUploadError:"The file must be an image",certificate:"Certificates",placeHolderCertificate:"Enter your academic certificates",repeatedEmail:"The email address is already being used",repeatedLicense:"The license is already being used"},favorite:{remove:"Remove from favorites",add:"Add to favorites"},week:{monday:"Monday",tuesday:"Tuesday",wednesday:"Wednesday",thursday:"Thursday",friday:"Friday",saturday:"Saturday",sunday:"Sunday"},account:{accountInfo:"Account Information",patientAppointments:"Appointments As Doctor",noResults:"No"}}}}});a.a=r.a},70:function(e,a,t){"use strict";t.d(a,"a",(function(){return r}));var r="http://pawserver.it.itba.edu.ar/paw-2018b-06/"},71:function(e,a,t){"use strict";var r=t(60),n=t(63),o=t(64),i=t(65),s=t(66),c=t(80),l=t.n(c),u=t(70),d=function e(a){var t;Object(r.a)(this,e),a&&a.user&&(t=a.user.auth);var n={"X-AUTH-TOKEN":t,"Content-Type":"application/json; charset=utf-8"};this.instance=l.a.create({baseURL:u.a,timeout:12e4,headers:n}),this.instance.interceptors.response.use((function(e){return e}),(function(e){var t=e.response;return t||a.history.push("/error/Error"),401===t.status&&a.history.push("/error/401"),403===t.status&&a.history.push("/error/403"),500===t.status&&a.history.push("/error/500"),Promise.reject(e)}))};t(72);t.d(a,"a",(function(){return m}));var m=function(e){function a(){return Object(r.a)(this,a),Object(o.a)(this,Object(i.a)(a).apply(this,arguments))}return Object(s.a)(a,e),Object(n.a)(a,[{key:"get",value:function(e){var a=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{};return this.instance.get(e,a).then((function(e){return Promise.resolve(e)})).catch((function(e){return Promise.reject(e)}))}},{key:"delete",value:function(e){var a=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{};return this.instance.delete(e,a).then((function(e){return Promise.resolve(e)})).catch((function(e){return Promise.reject(e)}))}},{key:"head",value:function(e){var a=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{};return this.instance.head(e,a).then((function(e){return Promise.resolve(e)})).catch((function(e){return Promise.reject(e)}))}},{key:"options",value:function(e){var a=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{};return this.instance.options(e,a).then((function(e){return Promise.resolve(e)})).catch((function(e){return Promise.reject(e)}))}},{key:"post",value:function(e){var a=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},t=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return this.instance.post(e,a,t).then((function(e){return Promise.resolve(e)})).catch((function(e){return Promise.reject(e)}))}},{key:"put",value:function(e){var a=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},t=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return this.instance.put(e,a,t).then((function(e){return Promise.resolve(e)})).catch((function(e){return Promise.reject(e)}))}},{key:"patch",value:function(e){var a=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},t=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return this.instance.patch(e,a,t).then((function(e){return Promise.resolve(e)})).catch((function(e){return Promise.reject(e)}))}}]),a}(d)}}]);
//# sourceMappingURL=16.34511b83.chunk.js.map