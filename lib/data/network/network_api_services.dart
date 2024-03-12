import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:lms/data/exception/app_exception.dart';
import 'package:lms/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw ServerException('Server error');
    }
  }

  @override
  Future getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(
            const Duration(
              seconds: 15,
            ),
          );

      responseJson = returnResponse(response);
      return responseJson;
    } on InternetException {
      throw InternetException();
    } on RequestTimeoutEception {
      throw RequestTimeoutEception();
    } on ServerException {
      throw ServerException();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future postApi(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
      );

      responseJson = returnResponse(response);
      return responseJson;
    } on InternetException {
      throw InternetException();
    } on RequestTimeoutEception {
      throw RequestTimeoutEception();
    } on ServerException {
      throw ServerException();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
