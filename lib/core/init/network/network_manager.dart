import 'dart:io';

import 'package:CatchTheGoal/core/base/model/base_error.dart';
import 'package:CatchTheGoal/core/base/model/base_model.dart';
import 'package:CatchTheGoal/core/constants/enums/locale_keys_enum.dart';
import 'package:CatchTheGoal/core/init/services/cache/local_manager.dart';
import 'package:CatchTheGoal/core/init/theme/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      headers: {
        "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      },
    );

    _dio = Dio(baseOptions);
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options) {
        options.path += "abc";
      }, onResponse: (e) {
        return e.data;
      }, onError: (e) {
        return BaseError(e.message);
      }),
    );
  }
  Dio _dio;
  Future<void> dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody);
        }
        return responseBody;

        break;
      default:
    }
  }
}
