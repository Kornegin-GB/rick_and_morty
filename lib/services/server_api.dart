import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/services/answer_error.dart';
import 'package:rick_and_morty/services/backend_fields.dart';

/// Класс взаимодействия с сервером
class ServerApi {
  static final ServerApi _serverApi = ServerApi._internal();

  factory ServerApi() {
    _serverApi.initCacheDio();
    return _serverApi;
  }

  ServerApi._internal();

  final _dio = Dio(
    BaseOptions(
      baseUrl: BackendFields.baseUrl,
      contentType: Headers.jsonContentType,
    ),
  );

  Options? dioOptions;

  void initCacheDio() {
    DioCacheManager dioCacheManager = DioCacheManager(
      CacheConfig(databaseName: "rick_and_morty_cache"),
    );
    _dio.interceptors.add(dioCacheManager.interceptor);
    dioOptions = buildCacheOptions(Duration(days: 30), forceRefresh: true);
  }

  /// Получения списка персонажей
  Future<dynamic> loadCharactersList() async {
    try {
      Response response = Response(requestOptions: RequestOptions());
      response = await _dio.get(BackendFields.characters, options: dioOptions);
      if (response.statusCode == 200) {
        return characterModelFromJson(jsonEncode(response.data));
      }
      return AnswerError.noConnectionToServer;
    } on SocketException catch (e) {
      log("[--- $e ---]");
    }
  }

  /// Пагинация списка персонажей
  Future<dynamic> scrollLoadCharactersList({required String nextPage}) async {
    try {
      Response response = Response(requestOptions: RequestOptions());
      response = await _dio.get(nextPage, options: dioOptions);
      if (response.statusCode == 200) {
        return characterModelFromJson(jsonEncode(response.data));
      }
      return AnswerError.noConnectionToServer;
    } on SocketException catch (e) {
      log("[--- $e ---]");
    }
  }
}
