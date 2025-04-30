<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ASCII Art</title>
    <style>
        body { font-family: monospace; background: #f0f0f0; padding: 20px; }
        .ascii { background: white; border: 1px solid #ccc; padding: 15px; white-space: pre; }
        input[type="text"] { font-family: monospace; width: 250px; }
    </style>
</head>
<body>
    <h2>Générateur ASCII Art (style CodinGame)</h2>
    <form method="post">
        <label>Texte :</label>
        <input type="text" name="text" value="<%= request.getParameter("text") != null ? request.getParameter("text") : "" %>" />
        <input type="submit" value="Générer" />
    </form>

<%
    String input = request.getParameter("text");
    if (input != null && !input.trim().isEmpty()) {
        input = input.toUpperCase().replaceAll("[^A-Z]", "?");

        int L = 4; // largeur de chaque lettre
        int H = 5; // hauteur

        String[] rows = {
            " #  ##   ##  # # ### ###  ##  ### ### # # ### ### ###  ##  ### ### # # # # ### ###  ? ",
            "# # # # #   # # #   #  # # #   #     # # # #   #     # # # #   #   # # # # #   #     ? ",
            "### ##  #   ### ### ### ##  ###   #  ### ### ###   #  ### ##  ### ### ### ### ###   ? ",
            "# # # # #   # # #   #  # #   #    #  # #   # # #   #  # # #     #   #   # # #   #    ? ",
            "# # ##   ## # # ### #   ##  ###   #  # # ### # #   #  # # ### ###   #   # # ### #    ? "
        };

        StringBuilder[] output = new StringBuilder[H];
        for (int i = 0; i < H; i++) output[i] = new StringBuilder();

        for (char c : input.toCharArray()) {
            int index = (c >= 'A' && c <= 'Z') ? c - 'A' : 26;
            int start = index * L;

            for (int i = 0; i < H; i++) {
                output[i].append(rows[i].substring(start, start + L));
            }
        }
%>
    <div class="ascii">
<%
        for (int i = 0; i < H; i++) {
            out.println(output[i].toString());
        }
%>
    </div>
<%
    }
%>
</body>
</html>
