<%@page import="entities.Hotel"%>
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
	
	
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-ezFRsUzKFMzJw7AweoASBaqyBUeFf3XqFnV3uwzW4I71R+oLUH4BkSYhv5o4qGIb" crossorigin="anonymous">
	
	

<script>
        function refreshCities() {
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "/HotelController", true);
            xhttp.send();
        }

        window.onload = function () {
            refreshCities();
        };

        function validateForm() {
            var nom = document.getElementsByName("nom")[0].value;
            var adresse = document.getElementsByName("adresse")[0].value;
            var numero = document.getElementsByName("numero")[0].value;
            var valider = document.getElementsByName("valider")[0].value;
            var ville = document.getElementsByName("ville")[0].value;
            var id = document.getElementsByName("id")[0].value;

            if (nom.trim() === '' && adresse.trim() === '' && numero.trim() === '' && ville.trim() === '') {
                alert("Les champs ne peut pas être vide.");
                return false;
            }

            if (valider === "Modifier") {
                console.log(id);
                window.location.href = "HotelController?op=update&id=" + id
                    + "&nom=" + nom + "&adresse=" + adresse + "&ville=" + ville + "&numero=" + numero;
                ;
                return false;
            } else if (valider === "Ajouter") {
                return true;
            }
            return false;
        }

        function updateCity(id, nom, adresse, numero, ville) {
            document.getElementsByName("nom")[0].value = nom;
            document.getElementsByName("id")[0].value = id;
            document.getElementsByName("adresse")[0].value = adresse;
            document.getElementsByName("numero")[0].value = numero;
            document.getElementsByName("ville")[0].value = ville;
            document.getElementsByName("valider")[0].value = "Modifier";
            $('#modifierModal').modal('show');
            
        }
        
        function confirmDelete(id) {
            Swal.fire({
                title: 'Confirmation de suppression',
                text: 'Êtes-vous sûr de vouloir supprimer cet hôtel ?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Oui, supprimer',
                cancelButtonText: 'Annuler'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'HotelController?op=delete&id=' + id;
                }
            })
        }

    </script>
 <style>
        body {
            background-color: #f8f9fa;
        }

        #sidebarMenu {
            background-color: #343a40;
            color: white;
        }

        #sidebarMenu a {
            color: white !important;
        }

        main {
            margin-top: 58px;
        }

        .container-border {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 20px;
            background-color: #fff;
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
		<div class="container border mt-4 py-4">
			
			
			  
<!-- Modal Modifier -->
<div class="modal fade" id="modifierModal" tabindex="-1" aria-labelledby="modifierModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modifierModalLabel">Modifier un Hôtel</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Formulaire de modification -->
                <form action="HotelController?op=update" class="mb-4" onsubmit="return validateForm()" method="post">
                    <div class="mb-3">
                        <label for="nom" class="form-label">Nom de l'hôtel</label>
                        <input type="text" class="form-control" id="nom" name="nom" value="">
                        <input type="text" name="id" value="" hidden />
                    </div>
                    <div class="mb-3">
                        <label for="adresse" class="form-label">Adresse de l'hôtel</label>
                        <input type="text" class="form-control" id="adresse" name="adresse" value="">
                    </div>
                    <div class="mb-3">
                        <label for="numero" class="form-label">Numero de téléphone</label>
                        <input type="text" class="form-control" id="numero" name="numero" value="">
                    </div>
                    <div class="mb-3">
                        <label for="ville" class="form-label">Sélectionner une ville</label>
                        <select class="form-select" id="ville" name="ville" aria-label="Default select example">
                            <option selected value="">Sélectionner une ville</option>
                            <c:forEach items="${villes}" var="v">
                                <option value="${v.id}">${v.nom}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <input type="submit" class="btn btn-primary" value="Modifier" name="valider" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



            <!-- Modal Ajouter -->
            <div class="modal fade" id="ajouterModal" tabindex="-1" aria-labelledby="ajouterModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ajouterModalLabel">Ajouter un Hôtel</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Formulaire d'ajout -->
                     
<form action="HotelController?op=add" class="mb-4" onsubmit="return validateForm()" method="post">
    <div class="mb-3">
        <label for="nom" class="form-label">Nom de l'hôtel</label>
        <input type="text" class="form-control" id="nom" name="nom" value="">
        <input type="text" name="id" value="" hidden />
    </div>
    <div class="mb-3">
        <label for="adresse" class="form-label">Adresse de l'hôtel</label>
        <input type="text" class="form-control" id="adresse" name="adresse" value="">
    </div>
    <div class="mb-3">
        <label for="numero" class="form-label">Numero de téléphone</label>
        <input type="text" class="form-control" id="numero" name="numero" value="">
    </div>
    <div class="mb-3">
        <label for="ville" class="form-label">Sélectionner une ville</label>
        <select class="form-select" id="ville" name="ville" aria-label="Default select example">
            <option selected value="">Sélectionner une ville</option>
            <c:forEach items="${villes}" var="v">
                <option value="${v.id}">${v.nom}</option>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3">
        <input type="submit" class="btn btn-primary" value="Ajouter" name="valider" />
    </div>
</form>
                        </div>
                       
                    </div>
                </div>
            </div>
			
			
			
			
			

			<h1 class="text-center mb-3">Gestion des Hôtels</h1>
  
<br><br>


			<table class="table table-bordered">
				<thead class="table-dark">
					<tr>
						<th scope="col">Nom</th>
						<th scope="col">Adresse</th>
						<th scope="col">Télephone</th>
						<th scope="col">Ville</th>
						<th scope="col">Supprimer</th>
						<th scope="col">Modifier</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${hotels}" var="v">
						<tr>
							<td>${v.nom}</td>
							<td>${v.adresse}</td>
							<td>${v.telephone}</td>
							<td>${v.ville.nom}</td>
							
							<td><button type="button" class="btn btn-danger"
									onclick="confirmDelete('${v.id}')">Supprimer</button></td>
							<td>
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modifierModal" onclick="updateCity('${v.id}', '${v.nom}', '${v.adresse}', '${v.telephone}', '${v.ville.id}')">Modifier</button>
</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- Bouton pour ouvrir la modal -->
<div class="d-flex justify-content-center mb-3">
    <button type="button" class="btn btn-warning btn-lg w-100" data-bs-toggle="modal" data-bs-target="#ajouterModal">
        Ajouter
    </button>
</div>
			
		</div>
	</main>
</body>
</html>