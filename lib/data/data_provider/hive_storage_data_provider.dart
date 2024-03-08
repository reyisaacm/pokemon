import 'dart:async';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokemon_flutter/data/interface/provider/i_storage_provider.dart';

class HiveStorageDataProvider implements IStorageProvider {

  HiveStorageDataProvider(){
    await Hive.initFlutter();
  }
  @override
  Future<String> read() async {

  }

  @override
  Future<void> write(String data) async {
 
  }
}
