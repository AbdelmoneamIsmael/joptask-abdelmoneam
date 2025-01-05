abstract class ApiRepo {
  Future<Map<String, dynamic>> getRequest({
    required String uri,
    String? lang,
    Map<String, String>? additionalHeaders,
  });
  Future<Map<String, dynamic>> post({
    required String endPoint,
    Object? data,
    String? token,
    String? contentType,
  });
  Future<Map<String, dynamic>> put({
    required String endPoint,
    Object? data,
    String? token,
    String? contentType,
  });
  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Object? data,
    String? token,
    String? contentType,
  });
  Future<bool> cheekInterentConnection();
}
