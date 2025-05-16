<%@ page import="java.util.*" %>
<%
    List<Map<String, Object>> daftarFilm = (List<Map<String, Object>>) session.getAttribute("daftarFilm");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Form Pemesanan Tiket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to left, #141e30, #243b55);
            color: white;
        }
    </style>
</head>
<body class="container mt-5">
    <h2>Form Pemesanan Tiket</h2>
    <form action="struk.jsp" method="post">
        <div class="mb-3">
            <label>Nama Pemesan:</label>
            <input type="text" name="nama" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Jumlah Tiket:</label>
            <input type="number" name="jumlah" class="form-control" required min="1" max="10">
        </div>
        <div class="mb-3">
            <label>Pilih Film:</label>
            <select name="film" class="form-control" required>
                <% for (Map<String, Object> f : daftarFilm) { %>
                <option value="<%= f.get("judul") %>"><%= f.get("judul") %></option>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label>Jam Tayang:</label>
            <select name="jam" class="form-control" required>
                <option value="12:00">12:00</option>
                <option value="13:00">13:00</option>
                <option value="14:00">14:00</option>
                <option value="15:00">15:00</option>
                <option value="16:00">16:00</option>
                <option value="17:00">17:00</option>
                <option value="18:00">18:00</option>
                <option value="19:00">19:00</option>
                <option value="20:00">20:00</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Cetak Struk</button>
    </form>
</body>
</html>
