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
