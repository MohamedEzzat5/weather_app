import 'package:bloc/bloc.dart';
import 'package:weather/models/weather_model.dart';
import '../../services/weather_service.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherStates>{
  GetWeatherCubit() : super(WeatherInitialState()) ;
 WeatherModel? weatherModel;
  getWeather({required String cityName})async{
    try {
       weatherModel =
      (await WeatherService().getCurrentWeather(cityName: cityName))!;
      emit(WaetherLoadedState(weatherModel!));
    }  catch (e) {
      emit(WeatherFailurState(
        e.toString()
      ));
    }
  }
}