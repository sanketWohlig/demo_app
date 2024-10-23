import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiCall {
  static const String url = '';
  static Future setToken(token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('auth-token', token);
  }

  static Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('auth-token');
    return token ?? '';
  }

  static Future<Map<String, String>> headerWithAuth() async {
    final token = await getToken();
    return {
      "Content-Type": "application/json",
      "Authorization": token,
      "Accept": "application/json",
    };
  }

  static Map<String, String>? header() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  static postWithAuth(String path, Object body) async {
    final header = await headerWithAuth();
    return await http
        .post(
          Uri.parse(url + path),
          headers: header,
          body: body,
        )
        .timeout(const Duration(seconds: 20));
  }

  static postWithAuthAndTimer(
      String path, Object body, int timeInSecond) async {
    final header = await headerWithAuth();
    return await http
        .post(
          Uri.parse(url + path),
          headers: header,
          body: body,
        )
        .timeout(Duration(seconds: timeInSecond));
  }

  static postWithAuthWithoutBody(String path) async {
    final header = await headerWithAuth();
    return await http.post(
      Uri.parse(url + path),
      headers: header,
    );
  }

  static postWithOutAuth(String path, Object body) async {
    return await http.post(
      Uri.parse(url + path),
      headers: header(),
      body: body,
    );
  }

  static getWithAuth(String path) async {
    final header = await headerWithAuth();
    return await http.get(
      Uri.parse(url + path),
      headers: header,
    );
  }

  static getWithOutAuth(String path) async {
    return await http.get(
      Uri.parse(url + path),
      headers: header(),
    );
  }

  static deleteWithAuth(String path) async {
    final header = await headerWithAuth();
    return await http.delete(
      Uri.parse(url + path),
      headers: header,
    );
  }

  static putWithAuth(String path, Object body) async {
    final header = await headerWithAuth();
    return await http.put(Uri.parse(url + path), headers: header, body: body);
  }
}
