<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ASCII Art en JSP</title>
    <style>
        body { font-family: monospace; background: #f0f0f0; padding: 20px; }
        .ascii { background: white; border: 1px solid #ccc; padding: 10px; white-space: pre; }
    </style>
</head>
<body>
    <h2>Générateur d'ASCII Art</h2>
    <form method="post">
        <label>Texte :</label>
        <input type="text" name="text" value="<%= request.getParameter("text") != null ? request.getParameter("text") : "" %>" />
        <input type="submit" value="Générer" />
    </form>

<%
    String input = request.getParameter("text");
    if (input != null && !input.trim().isEmpty()) {
        input = input.toUpperCase();

        int L = 4;
        int H = 5;

        String[] rows = {
            " #  ##   ##  # # ### ###  ##  ### ### # # ### ### ###  ##  ### ### # # # # ### ###  ? ",
            "# # # # #   # # #   #  # # #   #     # # # #   #     # # # #   #   # # # # #   #     ? ",
            "### ##  #   ### ### ### ##  ###   #  ### ### ###   #  ### ##  ### ### ### ### ###   ? ",
            "# # # # #   # # #   #  # #   #    #  # #   # # #   #  # # #     #   #   # # #   #    ? ",
            "# # ##   ## # # ### #   ##  ###   #  # # ### # #   #  # # ### ###   #   # # ### #    ? "
        };

        String[] output = new String[H];
        for (int i = 0; i < H; i++) {
            StringBuilder line = new StringBuilder();
            for (char c : input.toCharArray()) {
                int index = c - 'A';
                if (index < 0 || index > 25) index = 26; // pour caractères non alphabétiques
                int start = index * L;
                int end = start + L;
                line.append(rows[i].substring(start, end));
            }
            output[i] = line.toString();
        }
%>
    <div class="ascii">
<%
        for (String line : output) {
%>
        <%= line %><br>
<%
        }
    }
%>
    </div>
</body>
</html>

