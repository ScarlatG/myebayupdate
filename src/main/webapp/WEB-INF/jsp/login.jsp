<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="it">
<head>
<meta charset="utf-8">
<title>Accedi</title>

<!-- Common imports in pages -->
<jsp:include page="./header.jsp" />


<!-- Custom styles for login -->
<link href="${pageContext.request.contextPath}/assets/css/signin.css"
	rel="stylesheet">
</head>

<body class="text-center">
	<main class="form-signin">

		<form class="form-signin" name='login'
			action="${pageContext.request.contextPath}/login" method='POST'
			novalidate="novalidate">

			<div
				class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}"
				role="alert">${errorMessage}</div>

			<div
				class="alert alert-success alert-dismissible fade show ${successMessage==null?'d-none': ''}"
				role="alert">${successMessage}</div>

			<div
				class="alert alert-info alert-dismissible fade show ${infoMessage==null?'d-none': ''}"
				role="alert">${infoMessage}</div>

			<input type="hidden" name="idAnnuncioWithNoAuth"
				value="${idAnnuncioWithNoAuth }"> <img class="mb-4"
				src="${pageContext.request.contextPath}/assets/img/logo.png" alt=""
				width="72">
			<h1 class="h3 mb-3 fw-normal">Please sign in</h1>


			<div class="form-floating mb-3">
				<input type="text" name="username" class="form-control"
					id="inputUsername" placeholder="Username" required> <label
					for="inputUsername">Username</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" name="password" class="form-control"
					id="inputPassword" placeholder="Password" required> <label
					for="inputPassword">Password</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" name="remember-me"
					value="true"> Remember me
				</label>
			</div>

			<div class="d-grid gap-2">
				<button class="btn btn-lg btn-primary" type="submit">Sign
					in</button>
				<a class="btn btn-lg btn-secondary"
					href="${pageContext.request.contextPath}/home">Home</a>
			</div>

			<p class="mt-3 mb-3 text-muted">&copy; 2022-2023</p>

			<div class="text-center">
				Not registered? <a
					href="${pageContext.request.contextPath}/utente/insert">Click
					here</a>
			</div>

		</form>

	</main>
</body>
</html>