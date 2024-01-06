import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '9b4596a809524c23a3a164429232511';

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'there is an error, tyr again!!';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there is an error, try later');
    }
  }
}
