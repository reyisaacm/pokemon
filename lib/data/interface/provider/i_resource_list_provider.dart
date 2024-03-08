abstract interface class IResourceListProvider {
  Future<String> getResourceList(int limit, int offset, String resourceName);
}
