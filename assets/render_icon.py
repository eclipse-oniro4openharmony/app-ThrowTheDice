"""Editable source for the launcher and startup icon PNGs.

Run with the bundled Python runtime or any Python installation with Pillow.
"""

from pathlib import Path

from PIL import Image, ImageColor, ImageDraw, ImageOps


ROOT = Path(__file__).resolve().parents[1]
SCALE = 4
SIZE = 512


def pt(x: int, y: int) -> tuple[int, int]:
    return x * SCALE, y * SCALE


def gradient_face(canvas: Image.Image, points: list[tuple[int, int]], top: str, bottom: str) -> None:
    mask = Image.new('L', canvas.size, 0)
    ImageDraw.Draw(mask).polygon([pt(x, y) for x, y in points], fill=255)
    gradient = ImageOps.colorize(Image.linear_gradient('L').resize(canvas.size),
                                 ImageColor.getrgb(top), ImageColor.getrgb(bottom)).convert('RGBA')
    canvas.paste(gradient, (0, 0), mask)


def render(size: int) -> Image.Image:
    canvas = Image.new('RGBA', (SIZE * SCALE, SIZE * SCALE), (0, 0, 0, 0))
    draw = ImageDraw.Draw(canvas)
    draw.rounded_rectangle(
        (0, 0, SIZE * SCALE - 1, SIZE * SCALE - 1),
        radius=112 * SCALE,
        fill='#0F0026',
    )

    # The die fills the launcher icon and has enough contrast at 41 px.
    top = [(256, 62), (452, 178), (256, 292), (60, 178)]
    left = [(60, 178), (256, 292), (256, 470), (60, 352)]
    right = [(256, 292), (452, 178), (452, 352), (256, 470)]
    gradient_face(canvas, top, '#78E7F2', '#00B4D4')
    gradient_face(canvas, left, '#FF64CB', '#C5168E')
    gradient_face(canvas, right, '#FFF59A', '#FFD332')

    draw = ImageDraw.Draw(canvas)
    for face in (top, left, right):
        draw.line([pt(x, y) for x, y in face + [face[0]]],
                  fill='#0F0026', width=10 * SCALE, joint='curve')
    draw.line([pt(82, 174), pt(256, 76), pt(428, 174)],
              fill='#D9FAFF', width=7 * SCALE, joint='curve')

    # One, three, and two pips make the faces legible when reduced.
    for x, y, radius, color in [
        (256, 174, 23, '#0F0026'),
        (116, 262, 22, '#FFFFFF'),
        (158, 324, 22, '#FFFFFF'),
        (204, 387, 22, '#FFFFFF'),
        (332, 284, 23, '#0F0026'),
        (386, 354, 23, '#0F0026'),
    ]:
        draw.ellipse(
            ((x - radius) * SCALE, (y - radius) * SCALE,
             (x + radius) * SCALE, (y + radius) * SCALE),
            fill=color,
        )

    return canvas.resize((size, size), Image.Resampling.LANCZOS)


OUTPUTS = {
    'AppScope/resources/base/media/app_icon.png': 41,
    'AppScope/resources/base/media/icon_dice.png': 512,
    'entry/src/main/resources/base/media/icon.png': 41,
    'entry/src/main/resources/base/media/icon_dice.png': 512,
}


for relative_path, size in OUTPUTS.items():
    render(size).save(ROOT / relative_path)
