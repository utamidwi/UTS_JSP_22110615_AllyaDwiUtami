<%@ page import="java.util.*" %>
<%
    List<Map<String, Object>> daftarFilm = (List<Map<String, Object>>) session.getAttribute("daftarFilm");

    String nama = request.getParameter("nama");
    String filmDipilih = request.getParameter("film");
    String jam = request.getParameter("jam");
    int jumlah = 1;
    try {
        jumlah = Integer.parseInt(request.getParameter("jumlah"));
    } catch(Exception e) {
        jumlah = 1;
    }

    Map<String, Object> filmPilihan = null;
    for (Map<String, Object> f : daftarFilm) {
        if (f.get("judul").equals(filmDipilih)) {
            filmPilihan = f;
            break;
        }
    }

    int harga = 0;
    if(filmPilihan != null){
        harga = (Integer) filmPilihan.get("harga");
    }
    int total = jumlah * harga;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Struk Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .receipt {
            background-color: #1e1e1e;
            padding: 30px;
            border-radius: 10px;
            max-width: 500px;
            margin: 50px auto;
        }
        .receipt h2 {
            color: #f9d342;
        }
    </style>
</head>
<body>
    <div class="receipt">
        <h2>Struk Pemesanan</h2>
        <p>Nama Pemesan: <strong><%= nama %></strong></p>
        <p>Film: <strong><%= filmDipilih %></strong></p>
        <p>Jam Tayang: <strong><%= jam %></strong></p>
        <p>Jumlah Tiket: <strong><%= jumlah %></strong></p>
        <p>Total Harga: <strong>Rp <%= total %></strong></p>
        <a href="index.jsp" class="btn btn-light mt-3">Kembali ke Daftar Film</a>
    </div>
</body>
</html>
