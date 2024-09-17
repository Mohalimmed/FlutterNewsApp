import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/cubit/news_cubit.dart';
import 'package:news/cubit/news_states.dart';
import 'package:news/main_cubit/main_cubit.dart';
import 'package:news/main_cubit/main_states.dart';
import 'package:news/networks/local/cashe_helper.dart';
import 'package:news/networks/remote/dio_helper.dart';
import 'package:sqflite/utils/utils.dart';
import 'cubit/bloc_observer.dart';
import 'layout/news_layout.dart';
import 'moduels/search-screen/search_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Dio_Helper.init();
  await Cashe_helper.init();
  bool? isDark = Cashe_helper.getbool('isDark');

  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => NewsCubit()..getBusinessData(),),
        BlocProvider(create: (context) => MainCubit()..ChangeBrightnessButtom(fromShare: isDark),)
      ],
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepOrange,
              ),
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                scrolledUnderElevation: 0.0,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
              )),

            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepOrange,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                color: HexColor('333739'),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                scrolledUnderElevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('333739'),
                unselectedItemColor: Colors.grey,
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
              )),
            ),
            themeMode: MainCubit().get(context).appmode ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
