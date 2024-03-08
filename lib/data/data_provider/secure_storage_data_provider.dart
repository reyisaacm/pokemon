import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pokemon_flutter/data/interface/provider/i_storage_provider.dart';

class SecureStorageDataProvider implements IStorageProvider {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final String key = "16716c75-e862-4150-86cb-6e1f11a5e04a";

  @override
  Future<String> read() async {
    try {
      final String? contents = await storage.read(key: key);

      if (contents == null) return "";

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "";
    }
  }

  @override
  Future<void> write(String data) async {
    await storage.write(key: key, value: data);
  }
}
