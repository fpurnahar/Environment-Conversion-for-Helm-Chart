# 📘 Environment Conversion for Helm Chart
---

## 📌 Deskripsi
Dokumentasi ini menjelaskan proses konversi file `.env` menjadi konfigurasi Helm Chart untuk aplikasi `microservice` yang berjalan di lingkungan Kubernetes.

Proses ini bertujuan untuk menyederhanakan pengelolaan environment serta menstandarkan konfigurasi deployment menggunakan Helm.

---

## 🔄 Alur Proses
Script `convert.sh` akan membaca file `.env` dan menghasilkan atau memperbarui file konfigurasi Helm yang sesuai dengan struktur direktori yang telah ditentukan.

---

## 🎯 Tujuan
Konversi ini bertujuan untuk:

- Menstandarkan konfigurasi deployment pada Kubernetes
- Mempermudah pengelolaan environment (development, staging, production)
- Mengurangi kesalahan konfigurasi manual
- Meningkatkan konsistensi antar environment
- Mempercepat proses deployment microservice

---

## 📦 Ruang Lingkup
Proses ini berlaku untuk:

- Aplikasi berbasis microservice
- Deployment menggunakan Helm
- Environment yang berjalan di Kubernetes
- Konversi file `.env` menjadi konfigurasi Helm (`values.yaml` dan `env.yaml`)

---

## ⚙️ Prasyarat
Pastikan Anda memiliki:

- Sistem berbasis Linux / macOS
- Bash shell
- Akses ke cluster Kubernetes
- Helm sudah terinstal
- File `.env` dengan format yang benar

### Contoh format `.env`:
APP_NAME=sample-service
APP_ENV=development
APP_DEBUG=true
DB_HOST=localhost
DB_PORT=5432

---

## 📁 Struktur Direktori

```
helm-chart/
├── bases.yaml
├── backend/
│   └── microservice-sample/
│       └── environment/
│           └── development/
│               ├── values.yaml
│               └── env.yaml
```
---

## 🚀 Cara Menjalankan Konversi
### Menjalankan untuk semua file `.env`

```bash
./convert.sh *.env
```

### Menjalankan spesifik file `.env`

```bash
./convert.sh sample1.env sample2.env
```

--- 

## 📄 Lisensi 
Created By [Fadhil Purnahar](https://www.linkedin.com/in/fpurnahar).

---