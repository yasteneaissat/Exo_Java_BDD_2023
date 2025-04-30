<%@ page import="AsciiArtGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ASCII Art Generator</title>
    <style>
        body { font-family: monospace; background: #f4f4f4; padding: 20px; }
        .ascii-art { white-space: pre; background: #fff; padding: 10px; border: 1px solid #ccc; }
    </style>
</head>
<body>
    <h2>ASCII Art Generator</h2>
    <form method="post">
        <label>Texte à afficher :</label><br>
        <input type="text" name="text" value="<%= request.getParameter("text") != null ? request.getParameter("text") : "" %>"/>
        <input type="submit" value="Générer"/>
    </form>

    <%
        String text = request.getParameter("text");
        if (text != null && !text.trim().isEmpty()) {
            String[] artLines = AsciiArtGenerator.generateAscii(text);
    %>
        <div class="ascii-art">
            <% for (String line : artLines) { %>
                <%= line %><br>
            <% } %>
        </div>
    <%
        }
    %>
</body>
</html>


