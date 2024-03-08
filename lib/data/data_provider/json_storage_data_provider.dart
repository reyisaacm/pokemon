import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_flutter/data/interface/provider/i_storage_provider.dart';

class JsonStorageDataProvider implements IStorageProvider {
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

  @override
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

  @override
  Future<void> write(String data) async {
    final file = await _localFile;

    // Write the file
    await file.writeAsString(data);
  }
}
