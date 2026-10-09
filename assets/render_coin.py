"""Editable source for the coin choice illustration. Requires Pillow."""

from pathlib import Path

from PIL import Image, ImageChops, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[1]
SCALE = 4
SIZE = 512


def box(x0: int, y0: int, x1: int, y1: int) -> tuple[int, int, int, int]:
    return x0 * SCALE, y0 * SCALE, x1 * SCALE, y1 * SCALE


canvas = Image.new('RGBA', (SIZE * SCALE, SIZE * SCALE), (0, 0, 0, 0))
draw = ImageDraw.Draw(canvas)

# A simple coin silhouette with a visible lower edge.
draw.ellipse(box(64, 88, 448, 448), fill='#7D3C15')
draw.ellipse(box(64, 70, 448, 426), fill='#A85A1B')
draw.ellipse(box(76, 78, 436, 414), fill='#FFDD63')
draw.ellipse(box(91, 93, 421, 399), fill='#D58B27')
draw.ellipse(box(103, 102, 409, 387), fill='#FFE979')

# A restrained rim and glint keep the disc readable at card size.
draw.arc(box(83, 80, 428, 414), 202, 304, fill='#FFF5BF', width=13 * SCALE)
draw.arc(box(91, 94, 421, 399), 26, 139, fill='#A96021', width=8 * SCALE)
draw.arc(box(64, 88, 448, 448), 18, 158, fill='#8D481A', width=10 * SCALE)

font_path = next(path for path in [
    Path('C:/Windows/Fonts/segoeuib.ttf'),
    Path('/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf'),
] if path.exists())
font = ImageFont.truetype(str(font_path), 206 * SCALE)

# Build the relief from the glyph's visible bounds, then foreshorten and tilt it
# with the coin face. The highlights and shadows use the same gold palette.
letter = Image.new('L', canvas.size, 0)
ImageDraw.Draw(letter).text((0, 0), 'H', font=font, fill=255)
letter = letter.crop(letter.getbbox())
letter = letter.resize((132 * SCALE, 128 * SCALE), Image.Resampling.LANCZOS)
letter = letter.rotate(-10, Image.Resampling.BICUBIC, expand=True)
stamp = Image.new('L', canvas.size, 0)
stamp.paste(letter, ((canvas.width - letter.width) // 2,
                     244 * SCALE - letter.height // 2))

for mask, color in [
    (ImageChops.offset(stamp, 6 * SCALE, 7 * SCALE), '#B46C1F'),
    (ImageChops.offset(stamp, -5 * SCALE, -5 * SCALE), '#FFF7C2'),
    (stamp, '#EDBF4D'),
]:
    relief = Image.new('RGBA', canvas.size, color)
    canvas.paste(relief, (0, 0), mask)

canvas.resize((512, 512), Image.Resampling.LANCZOS).save(
    ROOT / 'entry/src/main/resources/base/media/coin.png'
)
