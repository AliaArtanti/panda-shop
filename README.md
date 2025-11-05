Tugas 7

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