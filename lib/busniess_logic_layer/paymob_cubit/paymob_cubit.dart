import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/data_layer/models/paymob_models/payment_request.dart';
import 'package:workspace/data_layer/reopstries/paymob_repo/payment_request_repo.dart';
import 'package:workspace/data_layer/reopstries/paymob_repo/token_repo.dart';

part 'paymob_state.dart';

class PaymobCubit extends Cubit<PaymobState> {
  final TokenRepo tokenRepo;
  final PaymentRequestRepo paymentRequestRepo;
  PaymobCubit({
    required this.tokenRepo,
    required this.paymentRequestRepo,
  }) : super(PaymobInitial());

  final String apiKey = MyStrings.payMobApiKey;
  String token = '';
  final String currency = "EGP";
   InAppWebViewController? inAppWebViewController;

  Future<void> getToken() async {
    emit(PaymobLoading());
    var result = await tokenRepo.getPayMobToken(apiKey);
    result.fold((fauiler) {
      emit(PaymobFauiler());
    }, (success) {
      token = success.token;
    });
  }

  Future<void> paymentRequest(
      String amount, String userName, String phoneNumber, String email) async {
   await getToken(); 
    final ShippingData shippingData = ShippingData(
        firstName: userName,
        lastName: "Account",
        phoneNumber: phoneNumber,
        email: email);
    final List<int> integrations = [5156075, 5076284];
    final List<Item> items = [
      Item(
          name: "workspace booking",
          description: "",
          amountCents: amount.toString(),
          quantity: "1")
    ];
    final String deliveryNeeded = "false";
    PaymentRequest paymentRequest = PaymentRequest(
        authToken: token,
        apiSource: "INVOICE",
        amountCents: amount,
        currency: currency,
        shippingData: shippingData,
        integrations: integrations,
        items: items,
        deliveryNeeded: deliveryNeeded);
    var result = await paymentRequestRepo.paymentRequest(paymentRequest);
    result.fold((fauiler) {
      emit(PaymobFauiler());
    }, (success) {
      emit(PaymobSuccess(url: success.url));
    });
  }
}
