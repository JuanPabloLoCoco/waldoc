(window.webpackJsonpfrontend=window.webpackJsonpfrontend||[]).push([[0],{119:function(e,a,t){"use strict";t.r(a);var n=t(0),r=t.n(n),c=t(27),l=t(25),s=t(56),i=(t(71),t(22)),o=(t(72),t(15)),m=t(16),u=t(18),d=t(17),p=t(19),E=function(e){function a(){return Object(o.a)(this,a),Object(u.a)(this,Object(d.a)(a).apply(this,arguments))}return Object(p.a)(a,e),Object(m.a)(a,[{key:"render",value:function(){var e=this.props.location.pathname;return r.a.createElement("nav",{className:"navbar navbar-dark",style:{backgroundColor:"/"===e?"#FFFFFF":"#257CBF",paddingBottom:0}},r.a.createElement("div",{className:"container"},r.a.createElement("a",{className:"navbar-brand",href:"/"},r.a.createElement("h1",{className:"/"===e?"navbar-brand-home":""},r.a.createElement("strong",null,"Waldoc"))),r.a.createElement("a",{href:"/login"},r.a.createElement("div",{className:"row"},r.a.createElement("div",{className:"center-vertical"},r.a.createElement("button",{className:"btn btn-light",style:{backgroundColor:"transparent",borderColor:"transparent",color:"#257CBF"},type:"button"},"Iniciar Sesion"))))))}}]),a}(r.a.Component),g=function(){return r.a.createElement("div",null,r.a.createElement("div",{class:"container"},r.a.createElement("p",{class:"footer-text"},"\xa9 Copyright 2019. Waldoc")))},h=t(40),v=t(38),f=t.n(v),b=t(43),y=t(41),j=t.n(y),N="http://localhost:8080/api/v1",O=function(e,a){var t=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{};return console.log("FETCHING FROM: "+N+e),"GET"===a?j()({url:N+e,method:"GET",headers:{"Content-Type":"application/json","Access-Control-Allow-Origin":"*"}}).then((function(e){return e.data})):j()({url:N+e,method:a,data:t,headers:{"Content-Type":"application/json","Access-Control-Allow-Origin":"*"}}).then((function(e){return e.data}))};function w(e,a){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);a&&(n=n.filter((function(a){return Object.getOwnPropertyDescriptor(e,a).enumerable}))),t.push.apply(t,n)}return t}function x(e){for(var a=1;a<arguments.length;a++){var t=null!=arguments[a]?arguments[a]:{};a%2?w(t,!0).forEach((function(a){Object(h.a)(e,a,t[a])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):w(t).forEach((function(a){Object.defineProperty(e,a,Object.getOwnPropertyDescriptor(t,a))}))}return e}var k=function(e){function a(){var e,t;Object(o.a)(this,a);for(var n=arguments.length,r=new Array(n),c=0;c<n;c++)r[c]=arguments[c];return(t=Object(u.a)(this,(e=Object(d.a)(a)).call.apply(e,[this].concat(r)))).state={insurances:[],selectedInsurance:null,specialties:[],selectedSpecialty:null,selectedName:""},t}return Object(p.a)(a,e),Object(m.a)(a,[{key:"componentDidMount",value:function(){var e=this;O("/insurances","GET").then((function(a){var t=[];a.insurances.map((function(e){return t.push({value:e.id,label:e.name})})),e.setState({insurances:t})})),O("/specialties","GET").then((function(a){var t=[];a.specialties.map((function(e){return t.push({value:e.id,label:e.speciality})})),e.setState({specialties:t})}))}},{key:"handleChange",value:function(e){console.log("handle",e);var a=e.target,t=a.name,n=a.value;this.setState(Object(h.a)({},t,n))}},{key:"handleSelect",value:function(e,a){"specialty"===a?this.setState({selectedSpecialty:e}):this.setState({selectedInsurance:e})}},{key:"render",value:function(){var e=this,a=this.state,t=a.insurances,n=a.selectedInsurance,l=a.specialties,s=a.selectedSpecialty,i=a.selectedName,o={option:function(e,a){return x({},e,{borderBottom:"1px dotted pink",color:a.isSelected?"red":"blue",padding:20})},control:function(){return{width:200}},singleValue:function(e,a){return x({},e,{opacity:a.isDisabled?.5:1,transition:"opacity 300ms"})}};return r.a.createElement("div",{className:"jumbotron jumbotron-background min-vh-100"},r.a.createElement("div",{className:"container",style:{marginBottom:120}},r.a.createElement(f.a,{top:!0,cascade:!0},r.a.createElement("p",{className:"jumbotron-subtitle fadeIn"},"\xbfTe sentis mal? Busca entre los mejores medicos"),r.a.createElement("div",{className:"navbar-search-home"},r.a.createElement("form",null,r.a.createElement("div",{className:"input-group container"},r.a.createElement("input",{type:"text","aria-label":"Buscar por nombre del m\xe9dico",placeholder:"Nombre",className:"form-control",name:"selectedName",value:i,onChange:function(a){return e.handleChange(a)}}),r.a.createElement(b.a,{value:s,onChange:function(a){return e.handleSelect(a,"specialty")},options:l,placeholder:"Especialidad",className:"custom-select",style:o,isLoading:l===[]}),r.a.createElement(b.a,{value:n,onChange:function(a){return e.handleSelect(a,"insurance")},options:t,placeholder:"Prepaga",className:"custom-select",isLoading:t===[]}),r.a.createElement("div",{className:"input-group-append"},r.a.createElement(c.b,{className:"btn btn-primary custom-btn",to:"/specialists",style:{textDecoration:"none",color:"#FFF"}},"Buscar"))))))))}}]),a}(r.a.Component),C=function(){return r.a.createElement("div",{class:"container"},r.a.createElement("div",{class:"margin-big"},r.a.createElement("p",{class:"jumbotron-subtitle"},"Titulo"),r.a.createElement("p",{class:"jumbotron-text"},"Subtitulo")),r.a.createElement("div",{class:"d-flex flex-row margin-bottom-medium"},r.a.createElement("img",{src:"https://i.imgur.com/StIDems.jpg",class:"image-rectangle"}),r.a.createElement("div",null,r.a.createElement("div",{class:"list-home"},r.a.createElement("h3",null,"Titulo"),r.a.createElement("p",{class:"doctor-text"},"Subtitulo")))),r.a.createElement("div",{class:"d-flex flex-row-reverse margin-bottom-medium"},r.a.createElement("img",{src:"https://i.imgur.com/N7X4FiE.jpg",class:"image-rectangle-right"}),r.a.createElement("div",null,r.a.createElement("div",{class:"list-home-right"},r.a.createElement("h3",null,"Titulo"),r.a.createElement("p",null,"Subtitulo")))),r.a.createElement("div",{class:"d-flex flex-row margin-bottom-medium"},r.a.createElement("img",{src:"https://i.imgur.com/yjHKj1P.jpg",class:"image-rectangle"}),r.a.createElement("div",null,r.a.createElement("div",{class:"list-home"},r.a.createElement("h3",null,"Titulo"),r.a.createElement("p",null,"Subtitulo")))))},S=function(e){function a(){return Object(o.a)(this,a),Object(u.a)(this,Object(d.a)(a).apply(this,arguments))}return Object(p.a)(a,e),Object(m.a)(a,[{key:"render",value:function(){return r.a.createElement("div",{className:"body-background"},r.a.createElement(k,null),r.a.createElement(C,null))}}]),a}(r.a.Component),P=t(44),T=t(65),F=t(62),A=t(63);P.a.use(F.a).use(A.a).use(T.a).init({fallbackLng:"sp",debug:!0,interpolation:{escapeValue:!1}});var B=P.a,D=t(35),R=t.n(D),G=t(64),I=t.n(G),H=function(e){function a(){var e,t;Object(o.a)(this,a);for(var n=arguments.length,c=new Array(n),l=0;l<n;l++)c[l]=arguments[l];return(t=Object(u.a)(this,(e=Object(d.a)(a)).call.apply(e,[this].concat(c)))).renderRating=function(){for(var e=t.props.data.averageRating,a=[],n=0;n<e;n++)a.push(r.a.createElement("i",{className:"fas fa-star star-yellow"}));for(var c=e+1;c<5;c++)a.push(r.a.createElement("i",{className:"fas fa-star star-grey"}));return a},t}return Object(p.a)(a,e),Object(m.a)(a,[{key:"render",value:function(){var e=this.props.data,a=e.profilePicture,t=e.firstName,n=e.lastName,c=(e.phoneNumber,e.specialties),l=e.averageRating,s=e.address;return r.a.createElement("div",{className:"card card-doctor d-flex flex-row box"},r.a.createElement("img",{class:"avatar big",src:"data:image/jpeg;base64,".concat(a),className:"avatar"}),r.a.createElement("div",{className:"card-body"},r.a.createElement("div",{className:"card-text"},r.a.createElement("h3",{className:"doctor-name"},t," ",n),r.a.createElement("div",{className:"row container"},r.a.createElement("p",{className:"doctor-specialty",style:{paddingRight:20}},c.specialties.map((function(e){return e.speciality+" "})))),r.a.createElement("p",{className:"doctor-text"},"Certificado"),0!==l&&r.a.createElement("div",{className:"row container"},this.renderRating()),r.a.createElement("p",{className:"doctor-text"},'"Muy buena atenci\xf3n, muy puntual"'),r.a.createElement("p",{className:"doctor-text"},r.a.createElement("i",{className:"far fa-clock"}),"8 - 20pm"),r.a.createElement("p",{className:"doctor-text"},r.a.createElement("i",{className:"fas fa-map-marker-alt"}),s,", CABA"))))}}]),a}(r.a.Component),L=function(e){function a(){var e,t;Object(o.a)(this,a);for(var n=arguments.length,c=new Array(n),l=0;l<n;l++)c[l]=arguments[l];return(t=Object(u.a)(this,(e=Object(d.a)(a)).call.apply(e,[this].concat(c)))).state={loading:!0,error:!1,specialists:null,insurances:null,specialties:null,currentPage:0,pages:null},t.renderPagePicker=function(){for(var e=t.state,a=e.pages,n=e.currentPage,c=[],l=0;l<a;l++)console.log(n===l),c.push(r.a.createElement("li",{className:"page-item"+n===l?" active":""},n===l?r.a.createElement("span",{class:"page-link"},l+1,r.a.createElement("span",{class:"sr-only"},"(current)")):r.a.createElement("a",{className:"page-link",href:"#"},l+1)));return c},t}return Object(p.a)(a,e),Object(m.a)(a,[{key:"componentDidMount",value:function(){var e=this,a=I.a.parse(this.props.location.search);O("/doctor/list?page="+a.page,"GET").then((function(a){console.log(a),e.setState({specialists:a,pages:a.totalPageCount,loading:!1})})).catch((function(){return e.setState({error:!0,loading:!1})}))}},{key:"render",value:function(){var e=this.state,a=e.error,t=e.loading,n=e.specialists;e.currentPage;return t?r.a.createElement("div",{className:"align-items-center justify-content-center"},r.a.createElement(R.a,{sizeUnit:"px",size:75,color:"rgb(37, 124, 191)",loading:!0})):a?r.a.createElement("p",null,"Hubo un error!"):r.a.createElement("div",{className:"body-background"},r.a.createElement("div",{className:"container"},r.a.createElement("div",{className:"row"},r.a.createElement("div",{className:"col-md-9"},n.doctors.map((function(e){return r.a.createElement(H,{data:e})}))),r.a.createElement("div",{className:"col-md-3"},r.a.createElement("div",{className:"sidebar-nav-fixed pull-right affix"},r.a.createElement("h3",{className:"sidebar-title"},B.t("prueba"))))),r.a.createElement("div",{className:"m-t-20 m-b-20"},r.a.createElement("ul",{className:"pagination justify-content-star"},this.renderPagePicker()))))}}]),a}(r.a.Component),M=function(e){function a(){var e,t;Object(o.a)(this,a);for(var n=arguments.length,r=new Array(n),c=0;c<n;c++)r[c]=arguments[c];return(t=Object(u.a)(this,(e=Object(d.a)(a)).call.apply(e,[this].concat(r)))).state={loading:!0,error:!1,specialist:null},t}return Object(p.a)(a,e),Object(m.a)(a,[{key:"componentDidMount",value:function(){var e=this,a=this.props.match.params.id;O("/doctor/"+a,"GET").then((function(a){console.log(a),e.setState({loading:!1,specialist:a})})).catch((function(){return e.setState({loading:!1,error:!0})}))}},{key:"render",value:function(){var e=this.state,a=e.error,t=e.loading,n=e.specialist;if(t)return r.a.createElement("div",{className:"align-items-center justify-content-center"},r.a.createElement(R.a,{sizeUnit:"px",size:75,color:"rgb(37, 124, 191)",loading:!0}));if(a)return r.a.createElement("p",null,"Hubo un error!");var c=n.address,l=(n.averageRating,n.district,n.firstName),s=(n.id,n.insurancesPlans,n.lastName),i=n.phoneNumber,o=n.profilePicture;n.reviews,n.sex,n.specialties,n.workingHours;return r.a.createElement("div",{className:"body-background"},r.a.createElement("div",{className:"main-container"},r.a.createElement("div",{class:"container"},r.a.createElement("div",null,r.a.createElement("div",{class:"card flex-row",style:{marginTop:30,marginLeft:0,marginRight:0}},r.a.createElement("div",{class:"card-body"},r.a.createElement("div",{class:"card-text"},r.a.createElement("div",{class:"row"},r.a.createElement("img",{class:"avatar big",src:"data:image/jpeg;base64,".concat(o)}),r.a.createElement("div",{class:"doctor-info-container"},r.a.createElement("div",null,r.a.createElement("div",{class:"row center-vertical"},r.a.createElement("p",null,l),r.a.createElement("p",null,s,'"'),r.a.createElement("h3",{class:"doctor-name",style:{marginLeft:14}},"sdfdsdfsdf")),r.a.createElement("div",{class:"row container"}),r.a.createElement("p",{class:"doctor-text"},r.a.createElement("i",{class:"fas fa-phone",style:{paddingRight:.5}}),i),r.a.createElement("p",{class:"doctor-text"},r.a.createElement("i",{class:"fas fa-map-marker-alt",style:{paddingRight:.5}}),c,", CABA"))))),r.a.createElement("div",null,r.a.createElement("div",{style:{backgroundColor:"#F3F3F4",borderRadius:5,padding:16,paddingBottom:0,marginTop:32,marginBottom:32}},r.a.createElement("h3",{class:"doctor-name"},"specialist.reserveAppointment"),r.a.createElement("form",{id:"appointment"},r.a.createElement("div",{class:"row"},r.a.createElement("div",{class:"col-sm-5"},r.a.createElement("label",{for:"day"},'specialist.appointmentDay"'),r.a.createElement("select",{class:"custom-select",id:"day",path:"day",cssStyle:"cursor: pointer;"})),r.a.createElement("div",{class:"col-sm-5"},r.a.createElement("label",{for:"time"},"specialist.appointmentTime"),r.a.createElement("select",{class:"custom-select",disabled:"false",id:"time",cssStyle:"cursor: pointer;"},r.a.createElement("option",{value:"no",label:"Elegi el Horario",selected:!0},"appointment.choose.time")))))),r.a.createElement("h3",{id:"information"},'"specialist.infoTitle"'),r.a.createElement("h4",null,'"specialist.education"'),r.a.createElement("h4",null,'"specialist.insurances"'),r.a.createElement("h4",null,'"specialist.languages"')),r.a.createElement("hr",null)))))))}}]),a}(r.a.Component),z=function(e){[].concat([{path:"/",component:S}]);var a=Object(i.e)(E);return r.a.createElement("div",null,r.a.createElement(a,null),r.a.createElement("main",null,r.a.createElement(i.a,{exact:!0,path:"/",component:S}),r.a.createElement(i.a,{exact:!0,path:"/specialists",component:L}),r.a.createElement(i.a,{exact:!0,path:"/specialist/:id",component:M})),r.a.createElement(g,null))};Boolean("localhost"===window.location.hostname||"[::1]"===window.location.hostname||window.location.hostname.match(/^127(?:\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/));var J=document.querySelector("#root");Object(l.render)(r.a.createElement(c.a,null,r.a.createElement(s.a,null,r.a.createElement(z,null))),J)},66:function(e,a,t){e.exports=t(119)},71:function(e,a,t){},72:function(e,a,t){}},[[66,1,2]]]);
//# sourceMappingURL=main.79513b35.chunk.js.map