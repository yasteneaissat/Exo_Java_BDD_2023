<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
    // Initialiser ou récupérer le tableau depuis la session
    ArrayList<Integer> tableau = (ArrayList<Integer>) session.getAttribute("tableau");
    if (tableau == null) {
        tableau = new ArrayList<Integer>();
        session.setAttribute("tableau", tableau);
    }

    String message = "";
    String action = request.getParameter("action");
    String valeurStr = request.getParameter("valeur");

    if ("ajouter".equals(action)) {
        if (tableau.size() >= 10) {
            message = "Erreur : Le tableau est plein.";
        } else {
            try {
                int valeur = Integer.parseInt(valeurStr);
                tableau.add(valeur);
                message = "Valeur ajoutée avec succès.";
            } catch (NumberFormatException e) {
                message = "Erreur : Veuillez entrer un entier valide.";
            }
        }
    } else if ("supprimer".equals(action)) {
        if (!tableau.isEmpty()) {
            tableau.remove(tableau.size() - 1);
            message = "Dernière valeur supprimée.";
        } else {
            message = "Erreur : Le tableau est déjà vide.";
        }
    } else if ("vider".equals(action)) {
        tableau.clear();
        message = "Tableau vidé.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion de Tableau</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
        }
        .box {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        input,
