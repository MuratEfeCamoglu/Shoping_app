# Shoping App

Bu proje, Flutter kullanılarak geliştirilmiş, **Provider** mimarisiyle güçlendirilmiş bir alışveriş uygulamasıdır [cite: 2, 3].

## 🚀 Özellikler
- **Ürün Listeleme:** Sneaker, saat, hoodie ve gözlük gibi ürünlerin listelenmesi [cite: 4].
- **Sepet Sistemi:** Ürünlerin sepete eklenmesi ve dinamik olarak güncellenmesi [cite: 4].
- **State Management:** `ChangeNotifierProvider` ile merkezi veri yönetimi [cite: 3].
- **Özel Temalar:** `light_mode.dart` ile tanımlanmış şık kullanıcı arayüzü [cite: 3].

## 🛠️ Teknik Detaylar
- **Framework:** Flutter (SDK: ^3.9.2) [cite: 2].
- **State Management:** Provider (^6.1.5+1) [cite: 2].
- **Veri Modeli:** `Shop` sınıfı üzerinden sepet ve ürün yönetimi [cite: 4].

## ⚙️ Kurulum
1. `flutter pub get` ile bağımlılıkları yükleyin [cite: 1].
2. `flutter run` komutuyla projeyi ayağa kaldırın.

## 📁 Proje Yapısı
- `lib/models/`: Veri modelleri ve iş mantığı [cite: 4].
- `lib/pages/`: Uygulama ekranları (Intro, Shop, Cart) [cite: 3].
- `lib/themes/`: Renk ve stil yapılandırmaları [cite: 5].
- `assets/`: Ürün görselleri [cite: 2].
