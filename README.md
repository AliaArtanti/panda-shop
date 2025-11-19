TUGAS 7

1.  Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Answer : Struktur hierarki dari semua widget yang membentuk tampilan aplikasi Flutter, setiap elemen UI direpresentasikan sebagai sebuah node pada pohon. Hubungan parent-child (induk-anak) adalah widget induk yang menjadi outer layer atau "pembungkus" yang berisi widget anak untuk mengatur perilaku, tata letak, dan gaya. Jika ada perubahan di widget anak, maka dapat memengaruhi tampilan keseluruhan yang dikendalikan oleh induknya.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
Answer : 
- MaterialApp = Berfungsi mengatur struktur dasar dan tema dari aplikasi tersebut.
- Scaffold = Menyediakan struktur halaman seperti appbar dan body
- AppBar = Berfungsi untuk menampilkan judul aplikasi di bagian atas 
- Column dan Padding = Digunakan untuk mengatur jarak antar widget dan tata letak vertikal 
- Text = Untuk menampilkan teks-teks seperti judul dan keterangan
- ElevatedButton.icon = membuat tombol dengan ikon dan teks
- Icon = Menampilkan semua simbol visual
- SizedBox = Menambahkan jarak antar elemen
- SnackBar = Menampilkan notifikasi kecil saat suatu tombol ditekan

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Answer : Menyediakan kerangka kerja dasar berbasis material design seperti tema, navigasi dan manajemen tampilan page. Widget ini sering digunakan sebagai widget root karena menjadi starting point untuk membangun app logic yang konsisten dan membangun struktur visual 

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Answer : Stateless widget = tidak memiliki perubahan data internal pada widgetnya dan hanya dibuat sekali, sementara Statefulwidget = dapat berubah karena memiliki state yang bisa diperbarui selama runtime. 
Saat ingin menampilkan elemen statis seperti tampilan tombol tetap, gunakan Statelesswidget, dan ketika perlu merubah tampilan based on interaksi user/data dinamis, gunakan Statefulwidget

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
Answer : Sebuah objek yang menyimpan informasi lokasi widget dalam tree sehingga digunakan oleh Flutter untuk mengetahui posisi dan hubungan antar widget. Dalam metode build(), Buildcontext penting karena memungkinkan widget mengakses navigasi, tema, dan elemen-elemen lain dari hierarki di atasnya agar dapat membangun tampilan yang sesuai.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Answer : Memungkinkan developer untuk memperbarui kode dan langsung melihat perubahan UI tanpa kehilangan state aplikasi, sehingga mempercepat proses pengembangan. Sementara hot restart memuat ulang seluruh aplikasi dari awal dan menghapus semua state yang sudah tersimpan. Hot restart digunakan saat perubahan kode memengaruhi struktur utama atau logika yang tidak bisa diperbarui secara langsung.


TUGAS 8

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?			
Answer : Navigator.push() digunakan untuk menambah halaman baru ke stack navigasi tanpa menghapus halaman sebelumnya, sehingga user masih bisa kembali lagi ke halaman sebelumnya dengan tombol back. Implementasi navigator.push() di football shop dapat digunakan saat user membuka detail produk dari main page agar bisa langsung kembali setelah selesai membuka detail produk. Sementara Navigator.pushReplacement() digunakan untuk mengganti halaman sekarang dengan halaman baru, sehingga user tidak dapat kembali lagi ke halaman sebelumnya. Penggunaan Navigator.pushReplacement() dapat diterapkan saat navigasi dari drawer, ketika user berpindah dari main page ke halaman "Tambah Produk".

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Answer : Scaffold menjadi kerangka utama tiap halaman untuk menyimpan elemen-elemen penting seperti body, app bar, drawer. Appbar digunakan untuk menampilkan judul halaman seperti judul "Panda shop - football shop". Drawer digunakan sebagai menu samping berisi list halaman yang ada (halaman utama dan tambah produk). Dengan urutan ini setiap page bisa memiliki tampilan dan struktur navigasi yang seragam sehingga meningkatkan user experience. 


3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widgetseperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu. 
Answer : Memberi fleksibilitas tinggi dalam penataan antarmuka di web, padding membantu mengatur jarak antar elemen agar tampilan form lebih rapi dan teratur. Sementara SingleChildScrollview digunakan untuk menampilkan 1 konten panjang (melebihi 1 layar) agar bisa di-scroll oleh user. Listview digunakan untuk menata elemen-elemen form secara vertikal dengan jarak otomatis agar tidak terjadi overflow. Contoh penggunaan di Panda shop adalah halamana tambah produk, padding digunakan untuk merapihkan setiap textformfield, listview untuk menyusun semua input secara berurutan dan singlechildscrollview memastikan keseluruhan halaman form dapat di-scroll.


4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Answer : Menggunakan ThemeData dengan parameter colorSchemeSeed warna hijau sehingga semua elemen seperti tombol, appbar dan highlight otomatis mengikuti otomatis mengikuti palette warna yang konsisten. 



TUGAS 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Answer : 
Karena model memberikan struktur data yang aman, jelas dan tervalidasi untuk tiap field yang dikirim/diterima dari backend. Dengan model, setiap atribut memiliki tipe yang pasti (misalnya String, int, bool) sehingga kode menjadi null-safe, mudah di-debug, dan mudah di-maintain saat API berubah. Kalau hanya menggunakan Map<String, dynamic> tanpa model, maka validasi tipe jadi hilang dan muncul resiko terjadi runtime error seperti null yang tidak diinginkan atau cast error, sulit melacak field yang salah, dan struktur data program menjadi tidak konsisten karena setiap halaman bisa memakai key yang berbeda. Akibatnya, sistem menjadi rentan bug, sulit dikembangkan, dan tidak scalable.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Answer : Package http adalah library dasar Flutter untuk melakukan request HTTP biasa seperti GET, POST, PUT,  tetapi tidak menyimpan sesi/cookie, sehingga cocok untuk endpoint yang tidak memerlukan login. Sebaliknya, CookieRequest digunakan khusus untuk mengelola autentikasi berbasis session Django, karena menyimpan dan mengirim cookie sesi ke setiap request berikutnya. 

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Answer : Instance CookieRequest harus dibagikan karena cookie sesi Django hanya tersimpan pada satu objek tersebut; tanpa berbagi instance, setiap halaman akan membuat objek baru yang tidak memiliki cookie login, sehingga backend menganggap user selalu logout. Dengan membagikan instance yang sama, seluruh aplikasi memiliki status autentikasi yang konsisten, dapat mengakses endpoint yang butuh login, dan dapat mempertahankan sesi pengguna selama aplikasi berjalan.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Answer : Agar Flutter terhubung dengan Django, emulator Android mengakses host lokal menggunakan alamat khusus 10.0.2.2, sehingga Django perlu menambahkannya ke ALLOWED_HOSTS agar request tidak diblokir oleh Django Security. Selain itu, CORS harus diaktifkan untuk mengizinkan request dari origin aplikasi dan pengaturan cookie/SameSite perlu diperlonggar (SameSite=None, Secure=False saat development) agar cookie sesi dapat dikirim oleh Flutter. Android juga harus diberi izin internet melalui manifest, karena tanpa itu Flutter tidak dapat melakukan request HTTP sama sekali. Jika salah satu konfigurasi ini tidak dilakukan, hasilnya request akan gagal (blocked host), cookie tidak dikirim (autentikasi gagal), atau aplikasi tidak dapat terhubung ke jaringan sama sekali.
 
5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Answer : Prosesnya dimulai ketika pengguna mengisi form di Flutter, kemudian data tersebut dikumpulkan dalam bentuk Map atau model dan dikirim ke Django melalui POST request menggunakan CookieRequest atau http. Django menerima data di view, memvalidasi dan menyimpannya ke database, lalu mengirim respons JSON berisi status atau data yang baru dibuat. Flutter menerima JSON tersebut, mem-parsing-nya melalui model Dart, lalu menampilkan hasilnya pada UI (contoh: daftar item, detail item, atau pesan sukses).

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Answer : Saat register atau login, Flutter mengirim data akun (username, password, dan field lain) melalui CookieRequest.post() ke endpoint Django. Django memprosesnya menggunakan sistem autentikasi bawaan: untuk register membuat user baru, untuk login mencocokkan username–password dan membuat session cookie. Cookie ini dikirim kembali ke Flutter dan disimpan otomatis oleh CookieRequest, sehingga setiap request berikutnya dianggap sebagai user yang sudah login. Setelah login berhasil, Flutter menampilkan menu utama. Logout dilakukan dengan memanggil endpoint logout Django, Django menghapus sesi di server, dan CookieRequest juga menghapus cookie lokal sehingga status user kembali menjadi logout.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Answer : 
Berikut jawaban untuk pertanyaan implementasi checklist:

---

**Implementasi Integrasi Autentikasi Django-Flutter dan Fitur CRUD**

Pertama, buat app authentication di Django untuk menangani login dan registrasi dari Flutter. Tambahkan fungsi login_flutter dan register_flutter di authentication/views.py yang return response dalam format JSON. Fungsi login_flutter menggunakan authenticate() dan login() dari Django untuk memvalidasi kredensial dan membuat session, lalu mengembalikan status True dengan username jika berhasil. Lalu tambahkan path URL di authentication/urls.py dan meng-include-nya ke pandashop/urls.py. Di Flutter, gunakan package pbp_django_auth dan provider untuk mengelola cookie session. Wrap seluruh aplikasi dengan Provider di main.dart yang menyediakan instance CookieRequest ke seluruh widget tree, sehingga session tetap terjaga di semua halaman.

Selanjutnya buat halaman login dan register di Flutter dengan file login_page.dart dan register_page.dart. Di login_page.dart, gunakan method request.login() dari CookieRequest untuk mengirim kredensial ke endpoint http://localhost:8000/auth/login/. Setelah login berhasil, saya memastikan semua endpoint menggunakan URL yang konsisten yaitu localhost karena browser memperlakukan localhost dan 127.0.0.1 sebagai origin yang berbeda untuk cookie. Di settings.py Django, saya konfigurasi CORS.

Dan untuk menampilkan daftar produk, saya membuat endpoint JSON custom di Django yaitu product_json di main/views.py yang mengembalikan data produk dalam format yang sesuai dengan model Flutter. Di Flutter, saya membuat model Product di models/product.dart dengan factory constructor fromJson() untuk parsing data. Halaman ProductListPage menggunakan FutureBuilder untuk fetch data dengan request.get() dari endpoint http://localhost:8000/json/, lalu menampilkannya dalam ListView.builder menggunakan widget ProductCard yang custom saya buat. Setiap card menampilkan thumbnail, name, price, description, category, dan badge Featured jika isFeatured bernilai true. Ketika card di-tap, aplikasi navigate ke ProductDetailPage dengan membawa object Product.

Terakhir, untuk fitur add product, buat endpoint flutter_add_product di Django dengan decorator @csrf_exempt yang menerima POST request. Kemudian buat instance Product baru dengan owner sama dengan request.user. Di Flutter, saya membuat AddProductPage dengan form yang memiliki validasi menggunakan GlobalKey<FormState>. Sebelum mengirim data, saya tambahkan pengecekan request.loggedIn untuk mencegah request jika user belum authenticated. Data dikirim menggunakan request.post() ke endpoint http://localhost:8000/flutter/add/ dengan semua field produk. Saya juga menambahkan loading indicator dan error handling yang proper. Untuk halaman detail, ProductDetailPage menerima object Product melalui constructor dan menampilkan semua atribut termasuk owner dengan layout yang responsive, serta tombol Back to list untuk kembali ke halaman daftar produk. Dengan implementasi ini, filter berdasarkan user yang login sudah berjalan otomatis karena semua endpoint Django menggunakan filter berdasarkan owner request.user.
