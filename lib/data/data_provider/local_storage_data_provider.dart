import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalStorageDataProvider {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    File file = File('$path/user.json');

    bool fileExists = await file.exists();

    if (!fileExists) {
      await file.create();
    }

    return file;
  }

  Future<String> read() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "";
    }
  }

  Future<File> write(String data) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(data);
  }
}
