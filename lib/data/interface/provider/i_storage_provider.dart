abstract interface class IStorageProvider {
  Future<String> read();
  Future<void> write(String data);
}
