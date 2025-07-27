import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Business Logic
import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
import 'package:workspace/busniess_logic_layer/edit_profle_cubit.dart/edit_profile_cubit.dart';
import 'package:workspace/busniess_logic_layer/home_cubit/home_cubit_cubit.dart';
import 'package:workspace/busniess_logic_layer/paymob_cubit/paymob_cubit.dart';
import 'package:workspace/busniess_logic_layer/regiestration_cubits/login_cubit/login_cubit.dart';
import 'package:workspace/busniess_logic_layer/regiestration_cubits/sigin_up/sigin_up_cubit.dart';
import 'package:workspace/busniess_logic_layer/space_details_cubit/space_details_cubit.dart';
import 'package:workspace/busniess_logic_layer/user_profile/user_profile_cubit.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';

// Data Layer
import 'package:workspace/data_layer/reopstries/booking_repo/booking_repo.dart';
import 'package:workspace/data_layer/reopstries/paymob_repo/payment_request_repo.dart';
import 'package:workspace/data_layer/reopstries/paymob_repo/token_repo.dart';
import 'package:workspace/data_layer/reopstries/regestration_repo/login_repo.dart';
import 'package:workspace/data_layer/reopstries/regestration_repo/sigin_up_repo.dart';
import 'package:workspace/data_layer/reopstries/user_profile_repo/user_progile_repo.dart';
import 'package:workspace/data_layer/reopstries/workspaces_repo/work_spaces_repo.dart';
import 'package:workspace/data_layer/web_servives/booking_services/book_request_service.dart';
import 'package:workspace/data_layer/web_servives/paymob_services/get_token_service.dart';
import 'package:workspace/data_layer/web_servives/paymob_services/payment_request_service.dart';
import 'package:workspace/data_layer/web_servives/regestration_services/login_service.dart';
import 'package:workspace/data_layer/web_servives/regestration_services/sigin_up_service.dart';
import 'package:workspace/data_layer/web_servives/user_profile_services/get_user_profile_data.dart';
import 'package:workspace/data_layer/web_servives/workspace_services/get_workspaces_data_service.dart';
import 'package:workspace/helpers/dio_helper.dart';

// Screens
import 'package:workspace/presention_layer/screens/book_screens/inforamtions_book_screen.dart';
import 'package:workspace/presention_layer/screens/details_screen.dart';
import 'package:workspace/presention_layer/screens/edit_profile_screen.dart';
import 'package:workspace/presention_layer/screens/home_screen.dart';
import 'package:workspace/presention_layer/screens/paymob_screen.dart';
import 'package:workspace/presention_layer/screens/regestrations_screens/login_screen.dart';
import 'package:workspace/presention_layer/screens/regestrations_screens/signup_screen.dart';

// Constants
import 'package:workspace/constants/my_strings.dart';

class AppRouter {
  late final HomeCubit homeCubit;
  late final LoginRepo loginRepo;
  late final WorkSpacesRepo workSpacesRepo;
  late final SiginUpRepo siginUpRepo;
  late final TokenRepo tokenRepo;
  late final PaymentRequestRepo paymentRequestRepo;
  late final UserProfileRepo userProfileRepo;

  // 👇 المتغير الجديد الذي سنستخدمه في MaterialApp.router
  late final GoRouter router;

  AppRouter() {
    _initRepos();
    _initCubits();
    _initRouter();
  }

  void _initRepos() {
    final dioHelper = DioHelper();
    loginRepo = LoginRepo(loginService: LoginService(dioHelper: dioHelper));
    siginUpRepo = SiginUpRepo(siginUpService: SiginUpService());
    workSpacesRepo =
        WorkSpacesRepo(getWorkspacesDataService: GetWorkspacesDataService(dioHelper: dioHelper));
    tokenRepo = TokenRepo(getTokenService: GetTokenService());
    paymentRequestRepo =
        PaymentRequestRepo(paymentRequestService: PaymentRequestService());
    userProfileRepo = UserProfileRepo(
      getUserProfileDataService: GetUserProfileDataService(dioHelper: dioHelper),
    );
  }

  void _initCubits() {
    homeCubit = HomeCubit(workSpacesRepo);
  }

  void _initRouter() {
    router = GoRouter(routes: <RouteBase>[
      GoRoute(
        path: MyStrings.loginScreen,
        name: MyStrings.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(loginRepo: loginRepo),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: MyStrings.homeScreen,
        name: MyStrings.homeScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: homeCubit),
            BlocProvider(
              create: (context) =>
                  UserProfileCubit(userProfileRepo: userProfileRepo),
            ),
          ],
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: MyStrings.registerScreen,
        name: MyStrings.registerScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => SiginUpCubit(signupRepo: siginUpRepo),
          child: const SignupScreen(),
        ),
      ),
      GoRoute(
        path: MyStrings.workSpaceDetailsScreen,
        name: MyStrings.workSpaceDetailsScreen,
        builder: (_, state) {
          print("dirty1");
           if (state.extra == null) {
      return const Scaffold(
        body: Center(child: Text('Workspace data not available')),
      );
    }

          final workspace = state.extra is Workspace
              ? state.extra as Workspace
              : Workspace.fromJson(state.extra as Map<String, dynamic>);
          return BlocProvider(
            create: (context) => SpaceDetailsCubit(workspace),
            child: DetailsScreen(workspace: workspace),
          );
        },
      ),
      GoRoute(
        path: MyStrings.bookingScreen,
        name: MyStrings.bookingScreen,
        builder: (context, state) {
          
          final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          final roomId = args['roomId'] as String;
          final workspaceId = args['workspaceId'] as String;
          final isCalender = args['isCalender'] as bool;

          return BlocProvider(
            create: (context) => BookingCubit(
              roomId: roomId,
              workspaceId: workspaceId,
              isCalender: isCalender,
              bookingRepo:
                  BookingRepo(BookRequestService(token: "")),// temp
            ),
            child: const InforamtionsBookScreen(),
          );
        },
      ),
      GoRoute(
        path: MyStrings.editScreen,
        name: MyStrings.editScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => EditProfileCubit(),
          child: const EditProfileScreen(),
        ),
      ),
      GoRoute(
        path: MyStrings.paymentScreen,
        name: MyStrings.paymentScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PaymobCubit(
                tokenRepo: tokenRepo,
                paymentRequestRepo: paymentRequestRepo,
              ),
            ),
            BlocProvider(
              create: (context) =>
                  UserProfileCubit(userProfileRepo: userProfileRepo),
            ),
          ],
          child: const PaymobScreen(),
        ),
      ),
    ]);
  }
}

// import 'package:flutter/material.dart';
// import 'package:workspace/busniess_logic_layer/booking_cubit/booking_cubit.dart';
// import 'package:workspace/busniess_logic_layer/edit_profle_cubit.dart/edit_profile_cubit.dart';
// import 'package:workspace/busniess_logic_layer/home_cubit/home_cubit_cubit.dart';
// import 'package:workspace/busniess_logic_layer/paymob_cubit/paymob_cubit.dart';
// import 'package:workspace/busniess_logic_layer/regiestration_cubits/login_cubit/login_cubit.dart';
// import 'package:workspace/busniess_logic_layer/regiestration_cubits/sigin_up/sigin_up_cubit.dart';
// import 'package:workspace/busniess_logic_layer/space_details_cubit/space_details_cubit.dart';
// import 'package:workspace/busniess_logic_layer/user_profile/user_profile_cubit.dart';
// import 'package:workspace/constants/my_strings.dart';
// import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';
// import 'package:workspace/data_layer/reopstries/booking_repo/booking_repo.dart';
// import 'package:workspace/data_layer/reopstries/paymob_repo/payment_request_repo.dart';
// import 'package:workspace/data_layer/reopstries/paymob_repo/token_repo.dart';
// import 'package:workspace/data_layer/reopstries/regestration_repo/login_repo.dart';
// import 'package:workspace/data_layer/reopstries/regestration_repo/sigin_up_repo.dart';
// import 'package:workspace/data_layer/reopstries/user_profile_repo/user_progile_repo.dart';
// import 'package:workspace/data_layer/reopstries/workspaces_repo/work_spaces_repo.dart';
// import 'package:workspace/data_layer/web_servives/booking_services/book_request_service.dart';
// import 'package:workspace/data_layer/web_servives/paymob_services/get_token_service.dart';
// import 'package:workspace/data_layer/web_servives/paymob_services/payment_request_service.dart';
// import 'package:workspace/data_layer/web_servives/regestration_services/login_service.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:workspace/data_layer/web_servives/regestration_services/sigin_up_service.dart';
// import 'package:workspace/data_layer/web_servives/user_profile_services/get_user_profile_data.dart';
// import 'package:workspace/data_layer/web_servives/workspace_services/get_workspaces_data_service.dart';
// import 'package:workspace/presention_layer/screens/book_screens/inforamtions_book_screen.dart';
// import 'package:workspace/presention_layer/screens/details_screen.dart';
// import 'package:workspace/presention_layer/screens/edit_profile_screen.dart';

// import 'package:workspace/presention_layer/screens/home_screen.dart';
// import 'package:workspace/presention_layer/screens/paymob_screen.dart';

// import 'package:workspace/presention_layer/screens/regestrations_screens/login_screen.dart';
// import 'package:workspace/presention_layer/screens/regestrations_screens/signup_screen.dart';

// class AppRouter {
//   late final HomeCubit homeCubit;
//   late final LoginRepo loginRepo;
//   late final WorkSpacesRepo workSpacesRepo;
//   late final SiginUpRepo siginUpRepo;
//   late final TokenRepo tokenRepo;
//   late final PaymentRequestRepo paymentRequestRepo;
//   late final UserProfileRepo userProfileRepo;

//   AppRouter() {
//     loginRepo = LoginRepo(loginService: LoginService());

//     siginUpRepo = SiginUpRepo(siginUpService: SiginUpService());
//     workSpacesRepo =
//         WorkSpacesRepo(getWorkspacesDataService: GetWorkspacesDataService());
//     tokenRepo = TokenRepo(getTokenService: GetTokenService());
//     paymentRequestRepo =
//         PaymentRequestRepo(paymentRequestService: PaymentRequestService());
//     homeCubit = HomeCubit(workSpacesRepo);
//   }

//   Route grenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case MyStrings.loginScreen:
//         return MaterialPageRoute(
//             builder: (context) => BlocProvider(
//                   create: (context) => LoginCubit(loginRepo: loginRepo),
//                   child: LoginScreen(),
//                 ));
//       case MyStrings.homeScreen:
//         return MaterialPageRoute(builder: (context) {
//           return MultiBlocProvider(
//             providers: [
//               BlocProvider(create: (context) => homeCubit),
//               BlocProvider(
//                   create: (context) => UserProfileCubit(
//                       userProfileRepo: UserProfileRepo(
//                           getUserProfileDataService:
//                               GetUserProfileDataService(MyStrings.token)))),
//             ],
//             child: HomeScreen(),
//           );
//         });

//       case MyStrings.workSpaceDetailsScreen:
//         final Workspace workspace = settings.arguments as Workspace;
//         return MaterialPageRoute(builder: (context) {
//           return BlocProvider(
//             create: (context) => SpaceDetailsCubit(workspace),
//             child: DetailsScreen(
//               workspace: workspace,
//             ),
//           );
//         });

//       case MyStrings.registerScreen:
//         return MaterialPageRoute(builder: (context) {
//           return BlocProvider(
//             create: (context) => SiginUpCubit(signupRepo: siginUpRepo),
//             child: SignupScreen(),
//           );
//         });

//       case MyStrings.bookingScreen:
//         final args = settings.arguments as Map<String, dynamic>;
//         final roomId = args['roomId'] as String;
//         final workspaceId = args['workspaceId'] as String;
//         final isCalender = args['isCalender'] as bool;
//         return MaterialPageRoute(builder: (context) {
//           return BlocProvider(
//             create: (context) => BookingCubit(
//                 roomId: roomId,
//                 workspaceId: workspaceId,
//                 isCalender: isCalender,
//                 bookingRepo:
//                     BookingRepo(BookRequestService(token: MyStrings.token))),
//             child: InforamtionsBookScreen(),
//           );
//         });

//       case MyStrings.editScreen:
//         return MaterialPageRoute(builder: (context) {
//           return BlocProvider(
//             create: (context) => EditProfileCubit(),
//             child: EditProfileScreen(),
//           );
//         });

//       case MyStrings.paymentScreen:
//         return MaterialPageRoute(builder: (context) {
//           return MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) => PaymobCubit(
//                     tokenRepo: tokenRepo,
//                     paymentRequestRepo: paymentRequestRepo),
//               ),
//               BlocProvider(
//                 create: (context) => UserProfileCubit(
//                     userProfileRepo: UserProfileRepo(getUserProfileDataService: GetUserProfileDataService(MyStrings.token))), // أضف المعاملات المطلوبة
//               ),
//             ],
//             child: PaymobScreen(),
//           );
//         });

//       default:
//         return MaterialPageRoute(
//             builder: (_) => Scaffold(
//                   body: Center(
//                     child: Text('No route defined for ${settings.name}'),
//                   ),
//                 ));
//     }
//   }
// }
