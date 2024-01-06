import 'package:weather/models/weather_model.dart';

class WeatherStates{}

class WeatherInitialState extends  WeatherStates{}

class WaetherLoadedState extends WeatherStates{
  final WeatherModel weatherModel;

  WaetherLoadedState(this.weatherModel);

}

class WeatherFailurState extends WeatherStates{
  final String errMessage;

  WeatherFailurState(this.errMessage);
}

