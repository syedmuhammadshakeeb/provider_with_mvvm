import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_provider/data/app_exception.dart';
import 'package:mvvm_provider/data/network/BaseApiResponse.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiServices(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiServices(String url, dynamic data)async {
    dynamic responseJson;
    try {
      final response = await post(
        Uri.parse(url),
        body: data
      ).timeout(const Duration(seconds: 10));;
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnathorisedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error accured while communicating with server" +
                "with status code" +
                response.statusCode.toString());
    }
  }
