import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:screl/bloc_observer.dart';
import 'package:screl/modules/home/cubit/home_cubit.dart';
import 'package:screl/modules/repo/home_repo.dart';
import 'package:screl/splash_screen.dart';
import 'package:screl/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
Bloc.observer = MyBlocObserver();
await  GetStorage.init();
  runApp(const MainApp());

 
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepo())..loadData(),
      child: MaterialApp(
        title: "Screl",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.blueGrey.withOpacity(.1)),
        navigatorKey: navigatorKey,
        home: const SplashScreen()),
    );
  }
}
