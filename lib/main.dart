import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../resources/resources.dart';
import './di/injections.dart';
import './pages/dashboard/dashboard_page.dart';
import 'core/load_data_repository_exe.dart';
import 'cubits/load_data/load_data_cubit.dart';
import 'cubits/menu_item/menu_item_cubit.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Injections().registerModules();

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LoadDataCubit _loadDataCubit =
      LoadDataCubit(repository: LoadDataRepositoryExe());
  final MenuItemCubit _menuItemCubit = MenuItemCubit();

  @override
  void dispose() {
    _loadDataCubit.close();
    _menuItemCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (_, __) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _loadDataCubit,
              ),
              BlocProvider.value(
                value: _menuItemCubit,
              )
            ],
            child: MaterialApp(
              title: 'GitHub Search',
              theme: ThemeData(fontFamily: StringConstant.poppins),
              home: const Dashboard(),
            ),
          );
        });
  }
}
