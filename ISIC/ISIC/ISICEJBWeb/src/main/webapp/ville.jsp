<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
     integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
     crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
     integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
     crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
     integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
     crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>



<script>
        function refreshCities() {
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "/VilleController", true);
            xhttp.send();
        }

        window.onload = function () {
            refreshCities();
        };

        function validateForm() {
            var nom = document.getElementsByName("ville")[0].value;
            var valider = document.getElementsByName("valider")[0].value;
            var id = document.getElementsByName("id")[0].value;

            if (nom.trim() === '') {
                alert("Le champ Nom de ville ne peut pas être vide.");
                return false;
            }

            if (valider === "Modifier") {
                console.log(id);
                window.location.href = "VilleController?op=update&id=" + id
                    + "&ville=" + nom;
                ;
                return false;
            } else if (valider === "Ajouter") {
                return true;
            }
            return false;
        }

        function updateCity(id, nom) {
            document.getElementsByName("ville")[0].value = nom;
            document.getElementsByName("id")[0].value = id;
            document.getElementsByName("valider")[0].value = "Modifier";
        }
        
        function confirmDelete(id) {
            Swal.fire({
                title: 'Confirmation de suppression',
                text: 'Êtes-vous sûr de vouloir supprimer cette ville ?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Oui, supprimer',
                cancelButtonText: 'Annuler'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'VilleController?op=delete&id=' + id;
                }
            });
        }

        function openCityModal(id, nom) {
            document.getElementsByName("ville")[0].value = nom;
            document.getElementsByName("id")[0].value = id;
            document.getElementsByName("valider")[0].value = "Modifier";
            // Trigger the Bootstrap modal
            $('#cityModal').modal('show');
        }


        
    </script>
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
    <div class="container border mt-4 py-4 mx-auto">

<h1 class="text-center mb-3">Gestion des villes</h1>

        <!-- Table to display cities -->
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Nom</th>
                    <th scope="col">Supprimer</th>
                    <th scope="col">Modifier</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${villes}" var="v">
                    <tr>
                        <td>${v.nom}</td>
                        <td><button type="button" class="btn btn-danger" onclick="confirmDelete('${v.id}')">Supprimer</button></td>
<td><button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#cityModal" onclick="openCityModal('${v.id}', '${v.nom}')">Modifier</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Button to trigger the modal -->
        <div class="col">
            <button type="button" class="btn btn-warning btn-lg w-100" data-bs-toggle="modal" data-bs-target="#cityModal">Ajouter</button>
        </div>

        <!-- Modal for adding or updating cities -->
        <div class="modal fade" id="cityModal" tabindex="-1" aria-labelledby="cityModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cityModalLabel">Ajouter/Modifier une Ville</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="VilleController?op=add" class="mb-4" onsubmit="return validateForm()" method="post">
                            <div class="row mx-auto">
                                <div class="col">
                                    <input type="text" class="form-control" placeholder="Nom de la ville" name="ville" value="">
                                    <input type="text" name="id" value="" hidden />
                                </div>
                                <div class="col">
                                    <input type="submit" class="btn btn-warning btn-lg w-100" value="Ajouter" name="valider" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</main>
</body>
</html>
