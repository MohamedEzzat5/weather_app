import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) =>
            BlocBuilder<GetWeatherCubit, WeatherStates>(
              builder: (context, state){
                return MaterialApp(
                  theme: ThemeData(
                    primaryColor: getThemeColor(BlocProvider
                        .of<GetWeatherCubit>(context)
                        .weatherModel?.weatherCondition),
                  ),
                  debugShowCheckedModeBanner: false,
                  home:  HomePage(),
                );
              },
            ),
      ),
    );
  }


}


MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
    case 'mist':
    case 'fog':
    case 'freezing fog':
    case 'patchy rain possible':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'blowing snow':
    case 'blizzard':
      return Colors.grey;

    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.teal; // Adjust color as needed
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'ice pellets':
    // Adjust color as needed
    case 'light snow showers':
    case 'moderate or heavy snow showers':

    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets': // Adjust color as needed
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.amber; // Adjust color as needed

  // Adjust color as needed
    default:
      return Colors.blue; // Default color if the condition is not recognized
  }
}