import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../AppException.dart';
import 'BaseApiService.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postResponse(String url, Map<String, dynamic> requestData) async {
    dynamic responseJson;
    final encodeBody = jsonEncode(requestData);
    final productsListURL = baseUrl + url;
    try {
      final response = await http
          .post(Uri.parse(productsListURL), body: encodeBody, headers: {
        'Content-Type': 'application/json',
      });
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server with status code : ${response.statusCode}');
    }
  }
}
