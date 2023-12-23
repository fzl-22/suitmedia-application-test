import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suitmedia_application_test/src/core/models/user.dart';

class UserService {
  static const String _baseUrl = "https://reqres.in";

  Future fetchData({
    required int page,
    required int perPage,
  }) async {
    final Uri url =
        Uri.parse("$_baseUrl/api/users?page=$page&per_page=$perPage");

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        return [];
      }

      final Map<String, dynamic> fetchedData = json.decode(response.body);

      final List<User> fetchedUserProfiles = (fetchedData['data'] as List)
          .map((userMap) => User.fromMap(userMap))
          .toList();

      return fetchedUserProfiles;
    } catch (error) {
      rethrow;
    }
  }
}
