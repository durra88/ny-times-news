class ApiServices {
  Map<String, String> getHeaders() {
    final Map<String, String> header = {
      'Content-type': 'application/json; charset=UTF-8',
    };
    return header;
  }
}
