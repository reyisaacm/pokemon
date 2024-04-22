abstract interface class IStorageReadProvider {
  Future<String> read();
}

abstract interface class IStorageWriteProvider {
  Future<void> write(String data);
}
