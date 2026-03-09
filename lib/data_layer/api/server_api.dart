import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rick_and_morty/data_layer/models/character_page_model.dart';

class ServerApi {
  final Dio _dio = Dio(
    BaseOptions(
      contentType: Headers.jsonContentType,
      baseUrl: dotenv.get("BASE_URL"),
    ),
  );

  Future<CharacterPageModel> getListCharacter({required int page}) async {
    Response response = Response(requestOptions: RequestOptions());

    try {
      response = await _dio.get("/character", queryParameters: {"page": page});
      // log("getListCharacter response $response");
      return CharacterPageModel.fromJson(response.data);
    } on DioException catch (e) {
      log("${e.response!.data}");
      throw DioException(
        requestOptions: RequestOptions(),
        message: e.response!.data,
      );
    }
  }
}
