void main() {
  // 01 Menyimpan daftar harga
  Map<String, double> daftarHarga = {
    'Buku': 50000.0,
    'Pena': 10000.0,
    'Tas': 150000.0,
    'Sepatu': 250000.0
  };

  // 02 Menyimpan daftar belanjaan
  // Menyimpan nama barang dan kuantitasnya
  Map<String, int> daftarBelanjaan = {
    'Buku': 2,
    'Tas': 1,
    'Pena': 5
  };

  // Menghitung total belanjaan sebelum diskon
  double totalBelanja = hitungTotalBelanja(daftarHarga, daftarBelanjaan);
  print('Total belanja sebelum diskon: Rp$totalBelanja');

  // 03 Menentukan case diskon belanjaan
  double diskon = hitungDiskon(totalBelanja);
  print('Diskon yang didapat: Rp$diskon');

  // 04 Menampilkan total akhir belanjaan
  double totalAkhir = totalBelanja - diskon;
  print('Total akhir belanjaan: Rp$totalAkhir');
}

// Function untuk menghitung total belanjaan dari daftar harga dan daftar belanjaan
double hitungTotalBelanja(Map<String, double> harga, Map<String, int> belanjaan) {
  double total = 0.0;
  belanjaan.forEach((item, jumlah) {
    if (harga.containsKey(item)) {
      total += harga[item]! * jumlah;
    }
  });
  return total;
}

// Function untuk menentukan diskon dengan menggunakan if / else if / else
// dan menggunakan operator comparison (>=)
double hitungDiskon(double totalBelanja) {
  if (totalBelanja >= 300000.0) {
    // Diskon 20% jika total belanja >= 300.000
    return totalBelanja * 0.20;
  } else if (totalBelanja >= 150000.0) {
    // Diskon 10% jika total belanja >= 150.000
    return totalBelanja * 0.10;
  } else {
    // Tidak ada diskon
    return 0.0;
  }
}
