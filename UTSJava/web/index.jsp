<%@ page import="java.util.*" %>
<%

    ArrayList<Map<String, Object>> daftarFilm = new ArrayList<>();

    Map<String, Object> film1 = new HashMap<>();
    film1.put("judul", "Mungkin Kita Perlu Waktu: Drama keluarga");
    film1.put("genre", "Drama");
    film1.put("durasi", 98);
    film1.put("harga", 50000);
    film1.put("gambar", "image/gmb1.jpg");
    film1.put("jamTayang", Arrays.asList("12:00", "15:00", "18:00"));
    daftarFilm.add(film1);

    Map<String, Object> film2 = new HashMap<>();
    film2.put("judul", "Ngeri ngeri sedap");
    film2.put("genre", "Comedy");
    film2.put("durasi", 114);
    film2.put("harga", 40000);
    film2.put("gambar", "image/gmb2.jpg");
    film2.put("jamTayang", Arrays.asList("13:00", "16:00", "19:00"));
    daftarFilm.add(film2);

    Map<String, Object> film3 = new HashMap<>();
    film3.put("judul", "Perayaan Mati Rasa");
    film3.put("genre", "Drama & Musik");
    film3.put("durasi", 123);
    film3.put("harga", 45000);
    film3.put("gambar", "image/gmb3.jpg");
    film3.put("jamTayang", Arrays.asList("14:00", "17:00", "20:00"));
    daftarFilm.add(film3);

    session.setAttribute("daftarFilm", daftarFilm);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Daftar Film</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: white;
        }
        .card {
            background-color: #1c1c1c;
            border: none;
        }
        .card-title {
            color: #f9d342;
        }
        .card-subtitle {
            font-size: 0.9rem;
            color: #bbb;
        }
    </style>
</head>
<body class="container mt-5">
    <h2 class="text-center mb-4">Daftar Film</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% 
            List<Map<String, Object>> filmList = (List<Map<String, Object>>) session.getAttribute("daftarFilm");
            for(Map<String, Object> f : filmList) { 
        %>
        <div class="col">
            <div class="card h-100">
                <img src="<%= f.get("gambar") %>" class="card-img-top" style="height: 300px; object-fit: cover;">
                <div class="card-body">
                    <h5 class="card-title"><%= f.get("judul") %></h5>
                    <p class="card-subtitle mb-2">
                        Genre: <%= f.get("genre") %><br>
                        Durasi: <%= f.get("durasi") %> menit<br>
                        Harga: Rp <%= f.get("harga") %>
                    </p>
                    <p class="card-text">
                        Jam Tayang: <%= String.join(", ", (List<String>) f.get("jamTayang")) %>
                    </p>
                    <a href="formPesan.jsp" class="btn btn-warning">Pesan Tiket</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</body>
</html>
