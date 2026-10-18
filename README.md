# Pertemuan 1: Setup Environment & Hello World Flutter

## Identitas
- Nama : Dea Anggraini
- NIM : 4243250051
- Kelas : PSIK 24 C

## Versi Flutter
```
Flutter 3.47.7 • channel stable • https://github.com/flutter/flutter.git
Framework • revision abaf9c5237 (10 days ago) • 2026-10-08 09:51:21 -0700
Engine • hash d8a2d6c768c334d53e16277f837970ffa1e2de81 (revision deb287481e) (10 days ago) • 2026-10-07 17:09:12.000Z
Tools • Dart 3.13.5 • DevTools 2.60.0
```

## Hasil flutter doctor
![flutter doctor](docs/flutter-doctor.jpeg)

Flutter, Android toolchain, dan Connected device bertanda centang. Tanda silang pada Visual Studio tidak berpengaruh karena hanya dibutuhkan untuk aplikasi desktop Windows.

## Aplikasi Berjalan di Perangkat
Perangkat: Infinix X6728 (Android 15), tersambung lewat kabel USB dengan USB debugging aktif.

![Hello World](docs/hello-world.jpeg)

## Kendala dan Solusi

1. **Ruang disk di drive C hampir habis.**
   Saat dicek, sisa ruang di C hanya sekitar 8,9 GB, sedangkan Flutter dan Android SDK butuh puluhan GB. Drive D masih punya sekitar 73 GB, jadi semuanya saya pasang di D. Flutter SDK ada di `D:\dev\flutter`, Android Studio di `D:\Android\Android Studio`, dan Android SDK di `D:\Android\Sdk`. Cache Gradle dan Pub juga ikut dipindah dengan mengatur variabel lingkungan `GRADLE_USER_HOME`, `PUB_CACHE`, dan `ANDROID_AVD_HOME` sebelum instalasi. Hasilnya `flutter doctor` tetap lengkap dan C tidak penuh.

2. **Build pertama gagal karena NDK belum terpasang.**
   Saat menekan F5, build berjalan sekitar 10 menit lalu gagal dengan pesan `Android sdkmanager did not install NDK 28.2.13676358`. Ternyata proyek ini membutuhkan NDK dengan versi itu, dan Gradle gagal memasangnya otomatis. Saya membuka SDK Manager di Android Studio, masuk ke tab SDK Tools, mencentang "Show Package Details", memilih NDK (Side by side) versi 28.2.13676358, lalu menekan Apply. Setelah itu build berhasil dan aplikasi muncul di ponsel.

3. **Memilih perangkat uji.**
   RAM laptop saya sekitar 7,9 GB, di bawah rekomendasi modul untuk emulator, jadi saya memakai ponsel fisik. Menu di ponsel berbahasa Indonesia, sehingga "Build number" muncul sebagai "Nomor bentukan" dan "USB debugging" sebagai "Proses debug USB". Setelah diaktifkan dan dialog izin disetujui, ponsel terbaca di `flutter devices`.

## Pernyataan Penggunaan AI
Saya memakai Claude sebagai asisten AI selama pengerjaan tugas ini. Bantuannya mencakup cara membaca keluaran `flutter doctor` dan pesan error (termasuk error NDK). kode Hello World ada yang diperbaiki dari saran AI, lalu saya isi dengan identitas saya dan saya tambahkan widget Icon. Saya menjalankan sendiri semua perintah di laptop dan ponsel saya. Dari proses ini saya belajar bahwa pesan error asli ada di bagian "What went wrong" pada log, bahwa lokasi cache perlu diatur sebelum instalasi, dan bahwa hot reload mempertahankan state sedangkan hot restart tidak.

## Esai: Native, Hybrid, dan Cross-platform
Dalam pembuatan aplikasi ada tiga pendekatan yang umum dipakai, yaitu native, hybrid, dan cross platform, dan pilihan di antaranya memengaruhi biaya, waktu, serta hasil akhir aplikasi.
Native artinya aplikasi dibuat khusus untuk tiap sistem operasi, pakai Kotlin atau Java untuk Android dan Swift untuk iOS. Performanya paling bagus dan fitur perangkat seperti kamera atau sensor bisa diakses penuh. Konsekuensinya, ada dua kode terpisah yang harus dirawat, jadi biaya dan waktunya paling besar. Pendekatan ini cocok untuk game 3D dengan grafis berat, karena sedikit saja tersendat sudah langsung terasa oleh pemain.
Hybrid membungkus aplikasi web (HTML, CSS, JavaScript) dalam WebView, misalnya lewat Ionic dengan Capacitor. Satu kode bisa jalan di Android dan iOS, dan orang yang biasa membuat web bisa langsung ikut mengerjakan. Tapi karena tampilannya bergantung pada WebView, animasi yang berat sering kurang halus. Jadi hybrid lebih murah dan cepat daripada native, tetapi kalah di performa. Pendekatan ini cocok untuk aplikasi informasi kampus yang isinya kebanyakan teks dan daftar.
Cross platform seperti Flutter, yang saya pakai di tugas ini, juga cukup dengan satu kode untuk dua platform. Bedanya, kodenya dikompilasi ke kode mesin dan Flutter menggambar tampilannya sendiri, sehingga performanya mendekati native. Kekurangannya, beberapa fitur perangkat kadang perlu plugin tambahan. Pilihan ini masuk akal untuk aplikasi kasir UMKM yang harus ada di Android dan iOS dengan anggaran dan tim yang kecil.
Jadi tidak ada pendekatan yang paling benar, semuanya tergantung kebutuhan proyek, anggaran, dan keterampilan tim.