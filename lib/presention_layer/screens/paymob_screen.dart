
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:workspace/busniess_logic_layer/book_poll_cubit/booking_boll_cubit.dart';
import 'package:workspace/busniess_logic_layer/paymob_cubit/paymob_cubit.dart';
import 'package:workspace/busniess_logic_layer/user_profile/user_profile_cubit.dart';

class PaymobScreen extends StatefulWidget {
  const PaymobScreen({super.key});

  @override
  State<PaymobScreen> createState() => _PaymobScreenState();
}

class _PaymobScreenState extends State<PaymobScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger the API call if user data is null
    if (context.read<UserProfileCubit>().myUserProfileModel == null) {
      context.read<UserProfileCubit>().getUserProfileData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserProfileLoaded) {
            context.read<PaymobCubit>().paymentRequest(
                  context.read<BookingBollCubit>().amount,
                  state.userProfileModel.user.fullName,
                  state.userProfileModel.user.contactNumber ?? "01224043314",
                  state.userProfileModel.user.emailAddress,
                );

            return BlocBuilder<PaymobCubit, PaymobState>(
              builder: (context, state) {
                if (state is PaymobSuccess) {
                  print("success from pay screen");
                  return PaymobWebView(cubit: context.read<PaymobCubit>());
                } else if (state is PaymobLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PaymobFauiler) {
                  return Center(
                    child: Text("Fauiler"),
                  );
                } else {
                  return Center(
                    child: Text("Payment Error"),
                  );
                }
              },
            );
          } else if (state is UserProfileFailure) {
            return Center(child: Text("Error loading user profile"));
          } else {
            return Center(child: Text("unknown error "));
          }
          // Add this explicit return (though it should never be reached)
          // return Container(); // This line might fix the error
        },
      ),
    );
  }
}

class PaymobWebView extends StatelessWidget {
  const PaymobWebView({
    super.key,
    required this.cubit,
  });

  final PaymobCubit cubit;

  @override
  Widget build(BuildContext context) {
   
      return BlocBuilder<PaymobCubit, PaymobState>(
        builder: (context, state) {
          if (state is PaymobSuccess) {
            return InAppWebView(
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                allowUniversalAccessFromFileURLs: true,
                mediaPlaybackRequiresUserGesture: false,
                useShouldOverrideUrlLoading: true,
                // Critical settings for keyboard input
                supportZoom:
                    false, // Disable zoom to prevent keyboard input issues
                builtInZoomControls: false, // Disable built-in zoom controls
                displayZoomControls: false, // Hide zoom control buttons

                // Android specific settings
                useHybridComposition:
                    true, // Use hybrid composition for better performance on Android
                allowContentAccess: true, // Allow access to content:// URLs
                allowFileAccess: true, // Allow access to file:// URLs
                allowFileAccessFromFileURLs:
                    true, // Allow file access from file URLs
                // Viewport and scaling settings
                loadWithOverviewMode:
                    true, // Load pages in overview mode (zoomed out to fit screen)
                useWideViewPort:
                    true, // Use wide viewport for better mobile rendering
                // Input handling
                verticalScrollBarEnabled: true, // Enable vertical scrolling
                horizontalScrollBarEnabled: true, // Enable horizontal scrolling

                // Additional settings for better compatibility
                clearCache: false, // Don't clear cache to maintain session
                clearSessionCache: false, // Don't clear session cache
                hardwareAcceleration:
                    true, // Enable hardware acceleration for smoother performance
              ),
              initialUrlRequest: URLRequest(
                url: WebUri(state.url),
              ),
              onWebViewCreated: (controller) {
                cubit.inAppWebViewController = controller;
              },
              onLoadStop: (controller, url) async {
                print("Page loaded: ${url.toString()}");

                // Check for success or failure URLs
                if (url.toString().contains("success")) {
                  print("Payment Success");
                  _showSuccessDialog(context);
                } else if (url.toString().contains("fail")) {
                  _showFailureDialog(context);
                }
              },
              onConsoleMessage: (controller, consoleMessage) {
                print("Console Message: ${consoleMessage.message}");
              },
              onLoadError: (controller, url, code, message) {
                print("Load Error: $url, Code: $code, Message: $message");
              },
              onProgressChanged: (controller, progress) {
                print("Loading Progress: $progress%");
              },
              shouldInterceptAjaxRequest: (controller, request) async {
                print("Intercepted AJAX Request: ${request.url}");
                return null; // Allow the request
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                var uri = navigationAction.request.url;

                // Prevent navigation away from the Paymob domain
                if (uri!.host.contains("paymobsolutions.com")) {
                  print("Blocking navigation to: $uri");
                  return NavigationActionPolicy.CANCEL;
                }

                return NavigationActionPolicy.ALLOW;
              },
            );
          } else if (state is PaymobLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PaymobFauiler) {
            return Center(
              child: Text("Failure"),
            );
          } else {
            return Center(
              child: Text("Payment Error"),
            );
          }
        },
      );
    }

    void _showSuccessDialog(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text("Payment Successful"),
          content: Text("Your payment has been processed successfully."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Optionally navigate to a success screen
              },
              child: Text("OK"),
            )
          ],
        ),
      );
    }

    void _showFailureDialog(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text("Payment Failed"),
          content: Text("Something went wrong with your payment."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Optionally retry or navigate to a failure screen
              },
              child: Text("OK"),
            )
          ],
        ),
      );
  }
}
