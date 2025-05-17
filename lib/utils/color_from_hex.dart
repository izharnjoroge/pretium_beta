import 'dart:ui';

Color colorFromHex(String hex) {
  hex = hex.replaceAll("#", "");
  if (hex.length == 6) {
    hex = "FF" + hex;
  }
  if (hex.length == 8) {
    return Color(int.parse("0x$hex"));
  }
  // Return black if invalid color
  return Color.fromRGBO(0, 0, 0, 0);
}
