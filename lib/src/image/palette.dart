import 'dart:typed_data';

import '../color/format.dart';

abstract class Palette {
  /// The size of the palette data in bytes.
  int get lengthInBytes;
  /// The byte buffer storage of the palette data.
  ByteBuffer get buffer;
  /// The number of colors stored in the palette.
  final int numColors;
  /// The number of channels per color.
  final int numChannels;

  Palette(this.numColors, this.numChannels);

  /// Create a copy of the Palette.
  Palette clone();

  /// The format of the color data.
  Format get format;

  /// A Uint8List view of the palette buffer storage.
  Uint8List toUint8List() => Uint8List.view(buffer);

  /// Set the RGBA color of a palette entry at [index]. If the palette has fewer
  /// channels than are set, the unsupported channels will be ignored.
  void setColor(int index, num r, [num g = 0, num b = 0, num a = 0]);

  /// Set a specific [channel] [value] of the palette entry at [index]. If the
  /// palette has fewer channels than [channel], the value will be ignored.
  void set(int index, int channel, num value);

  /// Get the the value of a specific [channel] of the palette entry at [index].
  /// If the palette has fewer colors than [index] or fewer channels than
  /// [channel], 0 will be returned.
  num get(int index, int channel);

  /// Get the red channel of the palette entry at [index]. If the palette has
  /// fewer colors or channels, 0 will be returned.
  num getRed(int index);

  /// Get the green channel of the palette entry at [index]. If the palette has
  /// fewer colors or channels, 0 will be returned.
  num getGreen(int index);

  /// Get the blue channel of the palette entry at [index]. If the palette has
  /// fewer colors or channels, 0 will be returned.
  num getBlue(int index);

  /// Get the alpha channel of the palette entry at [index]. If the palette has
  /// fewer colors or channels, 0 will be returned.
  num getAlpha(int index);
}
