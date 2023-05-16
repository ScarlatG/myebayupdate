<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header>
  <!-- Fixed navbar -->
 <nav class="navbar navbar-expand-lg navbar-dark bg-primary" aria-label="Eighth navbar example">
    <div class="container">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample07">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a>
          </li>
          
          <sec:authorize access="isAuthenticated()">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown07" data-bs-toggle="dropdown" aria-expanded="false">Gestione Annunci</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown07">
              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/annuncio/search">Cerca tra gli annunci creati</a></li>
              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/annuncio/insert">Crea un nuovo annuncio</a></li>
            	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/acquisto/list">I tuoi acquisti</a></li>
            </ul> 
          </li>
          </sec:authorize>
           <sec:authorize access="hasRole('ADMIN')">
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gestione Utenti</a>
		        <div class="dropdown-menu" aria-labelledby="dropdown01">
		          <a class="dropdown-item" href="${pageContext.request.contextPath}/utente/search">Ricerca Utenti</a>
		          <a class="dropdown-item" href="${pageContext.request.contextPath}/utente/insert">Inserisci Utente</a>
		        </div>
		      </li>
		   </sec:authorize>
        </ul>
      </div>
      
      <!-- Sezione a destra -->
      <div>
      <sec:authorize access="isAuthenticated()">
      		<li class="nav-item dropdown text-primary">
		        <a class="nav-link dropdown-toggle text-light" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Utente: <sec:authentication property="name"/> (${userInfo.nome } ${userInfo.cognome })</a>
		        <div class="dropdown-menu " aria-labelledby="dropdown07">
		          <a class="dropdown-item" href="${pageContext.request.contextPath}/account/editPassword">Cambia Password</a>
		          <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a>
		        </div>
		    </li>    	 
      </sec:authorize>
      
      <sec:authorize access="!isAuthenticated()">
	      <div class="col-sm-1 text-end">
	        <p class="navbar-text"><a href="${pageContext.request.contextPath}/login">Login</a></p>
	      </div>
      </sec:authorize>
    </div>
    
    </div>
  </nav>
  
  
</header>
