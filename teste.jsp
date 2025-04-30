<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ASCII Art - Générateur JSP</title>
    <style>
        body { font-family: monospace; background-color: #f5f5f5; padding: 20px; }
        .ascii { background: white; border: 1px solid #ccc; padding: 15px; white-space: pre; }
        input[type="text"] { width: 200px; font-size: 1em; }
    </style>
</head>
<body>
    <h2>ASCII Art (style CodinGame)</h2>
    <form method="post">
        <label>Entrez du texte :</label>
        <input type="text" name="text" value="<%= request.getParameter("text") != null ? request.getParameter("text") : "" %>" />
        <input type="submit" value="Générer" />
    </form>

<%
    String input = request.getParameter("text");
    if (input != null && !input.trim().isEmpty()) {
        input = input.toUpperCase().replaceAll("[^A-Z]", "?");

        int L = 4;
        int H = 5;

        String[] rows = {
            " #  ##   ##  # # ### ###  ##  ### ### # # ### ### ###  ##  ### ### # # # # ### ###  ? ",
            "# # # # #   # # #   #  # # #   #     # # # #   #     # # # #   #   # # # # #   #     ? ",
            "### ##  #   ### ### ### ##  ###   #  ### ### ###   #  ### ##  ### ### ### ### ###   ? ",
            "# # # # #   # # #   #  # #   #    #  # #   # # #   #  # # #     #   #   # # #   #    ? ",
            "# # ##   ## # # ### #   ##  ###   #  # # ### # #   #  # # ### ###   #   # # ### #    ? "
        };

        StringBuilder[] output = new StringBuilder[H];
        for (int i = 0; i < H; i++) {
            output[i] = new StringBuilder();
        }

        for (char c : input.toCharArray()) {
            int index = (c >= 'A' && c <= 'Z') ? (c - 'A') : 26;
            int start = index * L;
            int end = start + L;

            for (int i = 0; i < H; i++) {
                output[i].append(rows[i], start, end);
            }
        }
%>
    <div class="ascii">
<%
        for (int i = 0; i < H; i++) {
%>
        <%= output[i].toString() %><br/>
<%
        }
    }
%>
    </div>
</body>
</html>


