import 'dart:io';

void main() {
  // 01. Menyimpan daftar harga
  Map<String, int> daftarHarga = {
    'Nasi Putih': 5000,
    'Ayam Goreng': 12000,
    'Ayam Bakar': 13000,
    'Lele Goreng': 10000,
    'Sayur Sop': 4000,
    'Sayur Asem': 4000,
    'Sambal Matah': 3000,
    'Es Teh Manis': 4000,
    'Es Jeruk': 5000,
    'Kopi Hitam': 4000,
  };

  // Membuat List dari nama menu agar bisa diakses menggunakan nomor (index)
  List<String> listMenu = daftarHarga.keys.toList();

  print('=== MENU RESTORAN ===');
  for (int i = 0; i < listMenu.length; i++) {
    String menu = listMenu[i];
    int harga = daftarHarga[menu]!;
    print('${i + 1}. $menu (Rp $harga)');
  }
  print('0. Selesai Memesan / Cetak Struk');
  print('=====================\n');

  // 02. Menyimpan daftar belanjaan 
  // Menggunakan Map dengan key: nama menu, value: kuantitas
  Map<String, int> daftarBelanjaan = {};
  
  while (true) {
    stdout.write('Pilih nomor menu (0-${listMenu.length}): ');
    String? inputNomor = stdin.readLineSync();
    
    // Keluar dari perulangan jika user mengetik angka 0
    if (inputNomor == '0') {
      break;
    }
    
    int? nomor = int.tryParse(inputNomor ?? '');
    
    // Validasi input nomor (harus angka dan dalam jangkauan menu)
    if (nomor == null || nomor < 0 || nomor > listMenu.length) {
      print('  -> ❌ Pilihan tidak valid. Harap ketik angka 0 sampai ${listMenu.length}.\n');
      continue;
    }
    
    // Mendapatkan nama menu dari nomor yang diinput (dikurangi 1 karena index List dimulai dari 0)
    String menuTerpilih = listMenu[nomor - 1];
    
    // Meminta kuantitas
    stdout.write('Jumlah porsi untuk $menuTerpilih: ');
    String? inputKuantitas = stdin.readLineSync();
    int? kuantitas = int.tryParse(inputKuantitas ?? '');
    
    // Validasi kuantitas
    if (kuantitas == null || kuantitas <= 0) {
      print('  -> ❌ Jumlah tidak valid. Pesanan dibatalkan.\n');
      continue;
    }
    
    // Memasukkan ke daftar belanjaan
    // Jika menu sudah ada di keranjang, tambahkan kuantitasnya
    if (daftarBelanjaan.containsKey(menuTerpilih)) {
      daftarBelanjaan[menuTerpilih] = (daftarBelanjaan[menuTerpilih] ?? 0) + kuantitas;
    } else {
      daftarBelanjaan[menuTerpilih] = kuantitas;
    }
    
    print('  -> ✓ $kuantitas porsi $menuTerpilih berhasil ditambahkan.\n');
  }

  // Cek jika user tidak memesan apa-apa (langsung ketik 0 di awal)
  if (daftarBelanjaan.isEmpty) {
    print('\nAnda belum memesan apapun. Program dihentikan.');
    return;
  }

  print('\n=== Struk Belanja ===');
  int totalHarga = 0;
  
  // Looping daftar belanjaan untuk menghitung total dan mencetak struk
  daftarBelanjaan.forEach((item, kuantitas) {
    int hargaSatuan = daftarHarga[item] ?? 0;
    int subTotal = hargaSatuan * kuantitas;
    print('- $item (x$kuantitas) : Rp $subTotal');
    totalHarga += subTotal;
  });
  
  print('---------------------');
  print('Total Awal : Rp $totalHarga');

  // Memanggil function untuk hitung diskon dan total akhir
  hitungTotalAkhir(totalHarga);
}

// Function untuk memproses diskon dan total akhir
void hitungTotalAkhir(int total) {
  double diskon = 0.0;
  
  // 03. Menentukan case diskon belanjaan (if / else if / else & operator comparison)
  if (total >= 100000) {
    diskon = 0.20; // Diskon 20%
    print('Diskon     : 20% (Promo VIP!)');
  } else if (total >= 50000) {
    diskon = 0.10; // Diskon 10%
    print('Diskon     : 10% (Promo Hemat!)');
  } else {
    diskon = 0.0;
    print('Diskon     : 0%');
  }

  // 04. Menampilkan total akhir belanjaan
  double potongan = total * diskon;
  double totalAkhir = total - potongan;
  
  print('Potongan   : Rp ${potongan.toInt()}');
  print('---------------------');
  print('Total Akhir: Rp ${totalAkhir.toInt()}');
  print('=====================');
}
