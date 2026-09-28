"""Uygulama simgesinin kaynak görsellerini üretir.

Simge, uygulama içinde kullanılan Material `Icons.shopping_bag` glyph'inden
ve temanın renklerinden (lib/themes/light_mode.dart) oluşur.

Kullanım (shoping_app klasöründe):
    python tool/generate_icon.py
    dart run flutter_launcher_icons
"""

import os
import shutil

from PIL import Image, ImageDraw, ImageFont

SIZE = 1024
BACKGROUND = "#E0E0E0"  # Colors.grey.shade300 (surface)
FOREGROUND = "#212121"  # Colors.grey.shade900 (inversePrimary)
SHOPPING_BAG = ""  # Icons.shopping_bag

OUT_DIR = os.path.join(os.path.dirname(__file__), "..", "assets", "icon")


def material_icons_font(size):
    flutter_bin = shutil.which("flutter")
    if flutter_bin is None:
        raise SystemExit("flutter bulunamadı (PATH)")
    flutter_root = os.path.dirname(os.path.dirname(os.path.realpath(flutter_bin)))
    path = os.path.join(
        flutter_root, "bin", "cache", "artifacts", "material_fonts",
        "materialicons-regular.otf",
    )
    return ImageFont.truetype(path, size)


def draw_glyph(image, glyph_size):
    draw = ImageDraw.Draw(image)
    font = material_icons_font(glyph_size)
    # Glyph'i gerçek sınırlarına göre tam ortala
    left, top, right, bottom = draw.textbbox((0, 0), SHOPPING_BAG, font=font)
    x = (SIZE - (right - left)) / 2 - left
    y = (SIZE - (bottom - top)) / 2 - top
    draw.text((x, y), SHOPPING_BAG, font=font, fill=FOREGROUND)


def main():
    os.makedirs(OUT_DIR, exist_ok=True)

    # Tam simge: iOS, web, Windows, macOS ve eski Android sürümleri
    icon = Image.new("RGB", (SIZE, SIZE), BACKGROUND)
    draw_glyph(icon, int(SIZE * 0.72))
    icon.save(os.path.join(OUT_DIR, "app_icon.png"))

    # Android adaptive ön plan: şeffaf zemin. flutter_launcher_icons ön plana
    # %16 inset eklediği için glyph tam simgeyle aynı oranda çizilir.
    foreground = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    draw_glyph(foreground, int(SIZE * 0.72))
    foreground.save(os.path.join(OUT_DIR, "app_icon_foreground.png"))


if __name__ == "__main__":
    main()
