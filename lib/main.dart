import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FontLoader, SystemChrome, SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/app_router.dart';
import 'package:workspace/busniess_logic_layer/book_poll_cubit/booking_boll_cubit.dart';
import 'package:workspace/busniess_logic_layer/theme_cubit/theme_cubit.dart';
import 'package:workspace/busniess_logic_layer/timer_cubit/timer_cubit.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/data_layer/reopstries/booking_repo/book_poll_repo.dart';
import 'package:workspace/data_layer/web_servives/booking_services/book_check.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:workspace/presention_layer/holde_tests/custom_cutdown_timer.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FontLoader('Cairo').load();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: MyColors.backgroundColor,
    statusBarIconBrightness: Brightness.dark,
  ));

  final appRouter = AppRouter();

  runApp(
    MyAppWithRouter(appRouter: appRouter),
  );
}

class MyAppWithRouter extends StatelessWidget {
  final AppRouter appRouter;

  const MyAppWithRouter({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    // Keep the global scaffoldMessengerKey at the top level
    final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  BookingBollCubit(BookingPollingRepo(BookCheckService())),
            ),
            BlocProvider(
              create: (context) => TimerCubit(),
            ),
            BlocProvider(
              create: (context) => ThemeCubit(),
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                routerConfig: appRouter.router,
                debugShowCheckedModeBanner: false,
                useInheritedMediaQuery: true,
                locale: const Locale('ar'),
                restorationScopeId: 'app',
                theme: context.read<ThemeCubit>().getThemeData(),
                scaffoldMessengerKey: scaffoldMessengerKey, // Global key
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                builder: (context, child) {
                  // Build proper widget hierarchy without reassigning child
                  return BlocListener<BookingBollCubit, BookingBollState>(
                    listener: (context, state) {
                      if (state is BookingBollApproved) {
                        scaffoldMessengerKey.currentState?.clearSnackBars();
                        context.read<TimerCubit>().stop();

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          context.pushReplacementNamed(MyStrings.paymentScreen);
                        });
                      } else if (state is BookingBollRejected) {
                        scaffoldMessengerKey.currentState?.clearSnackBars();
                        context.read<TimerCubit>().stop();
                      } else if (state is BookingBollPending &&
                          !state.hasShownPendingSnackBar) {
                        print('Attempting to show SnackBar for BookingBollPending');

                        if (scaffoldMessengerKey.currentState == null) {
                          print('Error: scaffoldMessengerKey.currentState is null');
                          return;
                        }

                        context.read<TimerCubit>().start(
                              durationSeconds: 240,
                              onComplete: () {
                                print('CountdownSnackBar completed');
                              },
                            );

                        scaffoldMessengerKey.currentState!.showSnackBar(
                          SnackBar(
                            content: CountdownSnackBar(
                              contentText: 'جاري معالجة الحجز...',
                              duration: const Duration(seconds: 240),
                              afterTimeExecute: () {
                                print('CountdownSnackBar completed');
                              },
                              onPressed: () {
                                scaffoldMessengerKey.currentState!
                                    .clearSnackBars();
                                context.read<TimerCubit>().stop();
                              },
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            margin: EdgeInsets.only(
                              top: 16.h,
                              left: 16.w,
                              right: 16.w,
                            ),
                            duration: const Duration(seconds: 240),
                          ),
                        );
                      } else {
                        scaffoldMessengerKey.currentState?.clearSnackBars();
                        context.read<TimerCubit>().stop();
                      }
                    },
                    child: child!, // Use the original child directly
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}


// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'
//     show FontLoader, SystemChrome, SystemUiOverlayStyle;
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:workspace/app_router.dart';
// import 'package:workspace/busniess_logic_layer/book_poll_cubit/booking_boll_cubit.dart';
// import 'package:workspace/busniess_logic_layer/theme_cubit/theme_cubit.dart';
// import 'package:workspace/busniess_logic_layer/timer_cubit/timer_cubit.dart';
// import 'package:workspace/constants/my_colors.dart';
// import 'package:workspace/constants/my_strings.dart';
// import 'package:workspace/data_layer/reopstries/booking_repo/book_poll_repo.dart';
// import 'package:workspace/data_layer/web_servives/booking_services/book_check.dart';
// import 'package:workspace/generated/l10n.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:workspace/presention_layer/holde_tests/custom_cutdown_timer.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FontLoader('Cairo').load();
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: MyColors.backgroundColor,
//     statusBarIconBrightness: Brightness.dark,
//   ));
//   runApp(
//     MyApp(
//       appRouter: AppRouter(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key, required this.appRouter});
//   final AppRouter appRouter;

//   @override
//   Widget build(BuildContext context) {
//     final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
//     final navigatorKey = GlobalKey<NavigatorState>();

//     return ScreenUtilInit(
//       designSize: const Size(390, 844),
//       builder: (context, child) {
//         return MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (context) =>
//                   BookingBollCubit(BookingPollingRepo(BookCheckService())),
//             ),
//             BlocProvider(
//               create: (context) => TimerCubit(),
//             ),
//             BlocProvider(
//               create: (context) => ThemeCubit(), // Add ThemeCubit here
//             ),
//           ],
//           child: BlocBuilder<ThemeCubit, ThemeState>(
//             builder: (context, state) {
//               return MaterialApp(
//                 navigatorKey: navigatorKey,
//                 theme:  context.read<ThemeCubit>().getThemeData(),
//                 debugShowCheckedModeBanner: false,
//                 useInheritedMediaQuery: true,
//                 locale: const Locale('ar'),
//                 builder: (context, child) {
//                   // First: Use DevicePreview.builder
//                   child = DevicePreview.appBuilder(context, child);

//                   // Second: Wrap with ScaffoldMessenger
//                   child = ScaffoldMessenger(
//                     key: scaffoldMessengerKey,
//                     child: child,
//                   );

//                   // Third: Add BlocListener here with Navigator access
//                   return BlocListener<BookingBollCubit, BookingBollState>(
//                     listener: (context, state) {
//                       if (state is BookingBollApproved) {
//                         scaffoldMessengerKey.currentState!.clearSnackBars();
//                         context.read<TimerCubit>().stop();

//                         WidgetsBinding.instance.addPostFrameCallback((_) {
//                           // Use the navigator key instead of context
//                           navigatorKey.currentState
//                               ?.pushReplacementNamed(MyStrings.paymentScreen);
//                         });
//                       } else if (state is BookingBollRejected) {
//                         // Handle rejected state
//                         scaffoldMessengerKey.currentState!.clearSnackBars();
//                         context.read<TimerCubit>().stop();
//                       } else if (state is BookingBollPending &&
//                           state.hasShownPendingSnackBar == false) {
//                         print(
//                             'Attempting to show SnackBar for BookingBollPending');

//                         if (scaffoldMessengerKey.currentState == null) {
//                           print(
//                               'Error: scaffoldMessengerKey.currentState is null');
//                           return;
//                         }

//                         context.read<TimerCubit>().start(
//                               durationSeconds: 240,
//                               onComplete: () {
//                                 print('CountdownSnackBar completed');
//                               },
//                             );

//                         scaffoldMessengerKey.currentState!.showSnackBar(
//                           SnackBar(
//                             content: CountdownSnackBar(
//                               contentText: 'جاري معالجة الحجز...',
//                               duration: const Duration(seconds: 240),
//                               afterTimeExecute: () {
//                                 print('CountdownSnackBar completed');
//                               },
//                               onPressed: () {
//                                 scaffoldMessengerKey.currentState!
//                                     .clearSnackBars();
//                                 context.read<TimerCubit>().stop();
//                               },
//                             ),
//                             behavior: SnackBarBehavior.floating,
//                             backgroundColor: Colors.transparent,
//                             elevation: 0,
//                             margin: EdgeInsets.only(
//                               top: 16.h,
//                               left: 16.w,
//                               right: 16.w,
//                             ),
//                             duration: const Duration(seconds: 240),
//                           ),
//                         );
//                       } else {
//                         scaffoldMessengerKey.currentState!.clearSnackBars();
//                         context.read<TimerCubit>().stop();
//                       }
//                     },
//                     child: child!,
//                   );
//                 },
//                 localizationsDelegates: [
//                   S.delegate,
//                   GlobalMaterialLocalizations.delegate,
//                   GlobalWidgetsLocalizations.delegate,
//                   GlobalCupertinoLocalizations.delegate,
//                 ],
//                 supportedLocales: S.delegate.supportedLocales,
//                 onGenerateRoute: appRouter.grenerateRoute,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

