import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_canser_detection/controllers/auth/auth_cubit.dart';
import 'package:scan_canser_detection/core/constants/constans.dart';
import 'package:scan_canser_detection/core/helper/cach_data.dart';
import 'package:scan_canser_detection/core/helper/simple_bloc_observer.dart';
import 'package:scan_canser_detection/core/utils/router/app_router.dart';
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
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp.router(
          // theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
