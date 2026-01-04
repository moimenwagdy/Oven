import 'dart:io';

Future<void> deleteCartImageFolder(String imagePath) async {
  final dir = Directory(imagePath).parent;

  if (await dir.exists()) {
    await dir.delete(recursive: true);
  }
}
