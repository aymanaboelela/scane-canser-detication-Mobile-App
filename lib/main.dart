import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scan_canser_detection/controllers/auth/auth_cubit.dart';
import 'package:scan_canser_detection/controllers/call/call_cubit.dart';
import 'package:scan_canser_detection/controllers/detiction/detiction_cubit.dart';
import 'package:scan_canser_detection/controllers/diagnosis/diagnosis_cubit.dart';
import 'package:scan_canser_detection/core/constants/constans.dart';
import 'package:scan_canser_detection/core/helper/cach_data.dart';
import 'package:scan_canser_detection/core/helper/simple_bloc_observer.dart';
import 'package:scan_canser_detection/core/localization/app_localizations.dart';
import 'package:scan_canser_detection/core/localization/language/language_cubit.dart';
import 'package:scan_canser_detection/core/utils/router/app_router.dart';
import 'package:scan_canser_detection/data/servies/detication_rebo.dart';
import 'package:scan_canser_detection/data/servies/diadnosos_repository_impl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: apiKey,
  );

  // bloc observer
  Bloc.observer = SimpleBlocObserver();
  // Ensure screen size is initialized for ScreenUtil

  // Initialize shared preferences or cache data
  await CacheData.cacheDataInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create: (context) => DiagnosisCubit(
            repository: DiagnosisRepositoryImpl(dio: Dio()),
          ),
        ),
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => DetictionCubit(DetectionService() )),
        BlocProvider(create: (context) => CallCubit(),),
        BlocProvider(create: (context) => CallCubit(),),
        
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp.router(
              // theme: AppTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              locale: locale,
              supportedLocales: const [
                Locale('en', ''), // English
                Locale('ar', ''), // Arabic
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerConfig: AppRouter.router,
            ),
          );
        },
      ),
    );
  }
}
