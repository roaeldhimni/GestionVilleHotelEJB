<%@page import="entities.Ville"%>
<%@page import="entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha384-ezFRsUzKFMzJw7AweoASBaqyBUeFf3XqFnV3uwzW4I71R+oLUH4BkSYhv5o4qGIb"
	crossorigin="anonymous">
<style type="text/css">
    body {
        background-color: #f8f9fa;
    }

    .container-border {
        border: 1px solid #dee2e6;
        border-radius: 8px;
        padding: 20px;
        background-color:#f2f3f5
        ;
        margin-left: 240px; /* Ajustez la valeur selon vos besoins */
    }

    @media (min-width: 991.98px) {
        main {
            padding-left: 0; /* Remove the left padding */
        }

        .container-border {
            margin-left: 0; /* Remove the left margin */
        }
    }

    .btn-outline-danger,
    .btn-outline-warning {
        border-color: #dc3545;
        color: #dc3545;
    }

    .btn-outline-danger:hover,
    .btn-outline-warning:hover {
        background-color: #dc3545;
        color: white;
    }

    .nav-icon {
        width: 35px; /* Ajustez la taille selon vos besoins */
        margin-right: 5px; /* Ajoute une marge à droite de l'icône pour l'espacement */
    }
</style>

<script type="text/javascript">
	function validateForm() {
		var ville = document.getElementsByName("ville")[0].value;

		if (ville.trim() === '') {
			alert("Selectionner une ville d'abbord.");
			return false;
		}
		return true;
	}
</script>
</script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Gestion des Hotels</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="HotelController">
                        <img src="images/hotel.png" alt="Icone Hotel" class="nav-icon"> Gestion des Hotels
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="VilleController">
                        <img src="images/ville.png" alt="Icone Ville" class="nav-icon"> Gestion des Villes
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="HotelVilleController">
                        <img src="images/carte.png" alt="Icone Liste" class="nav-icon"> Liste des Hotels par ville
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


	 <main style="margin-top: 58px;">
        <div class="container-border mt-4 py-4">
            <div class="row">
                <!-- Form on the left -->
                <div class="col-md-4 mb-4">
                    <br><br><br>
                    <form action="HotelVilleController" class="mb-4" onsubmit="return validateForm()" method="post">
                        <select class="form-select" aria-label="Default select example" name="ville">
                            <option selected value="">Sélectionner une ville</option>
                            <c:forEach items="${villes}" var="v">
                                <option value="${v.id}">${v.nom}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" class="btn btn-warning mt-2" value="Chercher" />
                    </form>
                </div>

                <!-- Table on the right -->
                <div class="col-md-8">
                    <div class="table-responsive">
                        <h1 class="text-center mb-3 text-black">Liste des Hotels par ville</h1>
                        <table class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Nom</th>
                                    <th scope="col">Adresse</th>
                                    <th scope="col">Télephone</th>
                                    <th scope="col">Ville</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${hotels}" var="v">
                                    <tr>
                                        <th scope="row">${v.id}</th>
                                        <td>${v.nom}</td>
                                        <td>${v.adresse}</td>
                                        <td>${v.telephone}</td>
                                        <td>${v.ville.nom}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>