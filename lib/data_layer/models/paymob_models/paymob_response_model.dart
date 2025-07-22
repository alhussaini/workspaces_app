class PaymobResponseModel {
  final String url;

  PaymobResponseModel({required this.url});

  factory PaymobResponseModel.fromJson(Map<String, dynamic> json) {
    // Extract only the 'url' field from the JSON response
    return PaymobResponseModel(
      url: json['url'] ?? '', // Default to an empty string if 'url' is null
    );
  }
}









// class PaymobResponseModel {
//   final int id;
//   final DateTime createdAt;
//   final bool deliveryNeeded;
//   final Merchant merchant;
//   final dynamic collector;
//   final int amountCents;
//   final ShippingData shippingData;
//   final dynamic shippingDetails;
//   final String currency;
//   final bool isPaymentLocked;
//   final bool isReturn;
//   final bool isCancel;
//   final bool isReturned;
//   final bool isCanceled;
//   final dynamic merchantOrderId;
//   final dynamic walletNotification;
//   final dynamic paidAmountCents;
//   final bool notifyUserWithEmail;
//   final List<Item> items;
//   final String orderUrl;
//   final dynamic commissionFees;
//   final dynamic deliveryFeesCents;
//   final dynamic deliveryVatCents;
//   final String paymentMethod;
//   final dynamic merchantStaffTag;
//   final String apiSource;
//   final dynamic pickupData;
//   final dynamic deliveryStatus;
//   final Map<String, dynamic> data;
//   final String token;
//   final String url;

//   PaymobResponseModel({
//     required this.id,
//     required this.createdAt,
//     required this.deliveryNeeded,
//     required this.merchant,
//     required this.collector,
//     required this.amountCents,
//     required this.shippingData,
//     required this.shippingDetails,
//     required this.currency,
//     required this.isPaymentLocked,
//     required this.isReturn,
//     required this.isCancel,
//     required this.isReturned,
//     required this.isCanceled,
//     required this.merchantOrderId,
//     required this.walletNotification,
//     required this.paidAmountCents,
//     required this.notifyUserWithEmail,
//     required this.items,
//     required this.orderUrl,
//     required this.commissionFees,
//     required this.deliveryFeesCents,
//     required this.deliveryVatCents,
//     required this.paymentMethod,
//     required this.merchantStaffTag,
//     required this.apiSource,
//     required this.pickupData,
//     required this.deliveryStatus,
//     required this.data,
//     required this.token,
//     required this.url,
//   });

//   factory PaymobResponseModel.fromJson(Map<String, dynamic> json) {
//     List<dynamic>? phonesList = json['merchant']['phones'];
//     List<String> phones = phonesList?.map((item) => item.toString()).toList() ?? [];

//     List<dynamic>? emailsList = json['merchant']['company_emails'];
//     List<String> emails = emailsList?.map((item) => item.toString()).toList() ?? [];

//     List<Item> itemsList = [];
//     if (json['items'] != null) {
//       var itemsJson = json['items'] as List;
//       itemsList = itemsJson.map((i) => Item.fromJson(i)).toList();
//     }

//     return PaymobResponseModel(
//       id: json['id'],
//       createdAt: DateTime.parse(json['created_at']),
//       deliveryNeeded: json['delivery_needed'],
//       merchant: Merchant(
//         id: json['merchant']['id'],
//         createdAt: DateTime.parse(json['merchant']['created_at']),
//         phones: phones,
//         companyEmails: emails,
//         companyName: json['merchant']['company_name'],
//         state: json['merchant']['state'] ?? '',
//         country: json['merchant']['country'],
//         city: json['merchant']['city'],
//         postalCode: json['merchant']['postal_code'] ?? '',
//         street: json['merchant']['street'] ?? '',
//       ),
//       collector: json['collector'],
//       amountCents: json['amount_cents'],
//       shippingData: ShippingData.fromJson(json['shipping_data']),
//       shippingDetails: json['shipping_details'],
//       currency: json['currency'],
//       isPaymentLocked: json['is_payment_locked'],
//       isReturn: json['is_return'],
//       isCancel: json['is_cancel'],
//       isReturned: json['is_returned'],
//       isCanceled: json['is_canceled'],
//       merchantOrderId: json['merchant_order_id'],
//       walletNotification: json['wallet_notification'],
//       paidAmountCents: json['paid_amount_cents'],
//       notifyUserWithEmail: json['notify_user_with_email'],
//       items: itemsList,
//       orderUrl: json['order_url'],
//       commissionFees: json['commission_fees'],
//       deliveryFeesCents: json['delivery_fees_cents'],
//       deliveryVatCents: json['delivery_vat_cents'],
//       paymentMethod: json['payment_method'],
//       merchantStaffTag: json['merchant_staff_tag'],
//       apiSource: json['api_source'],
//       pickupData: json['pickup_data'],
//       deliveryStatus: json['delivery_status'],
//       data: json['data'],
//       token: json['token'],
//       url: json['url'],
//     );
//   }
// }

// class Merchant {
//   final int id;
//   final DateTime createdAt;
//   final List<String> phones;
//   final List<String> companyEmails;
//   final String companyName;
//   final String state;
//   final String country;
//   final String city;
//   final String postalCode;
//   final String street;

//   Merchant({
//     required this.id,
//     required this.createdAt,
//     required this.phones,
//     required this.companyEmails,
//     required this.companyName,
//     required this.state,
//     required this.country,
//     required this.city,
//     required this.postalCode,
//     required this.street,
//   });
// }

// class ShippingData {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String street;
//   final String building;
//   final String floor;
//   final String apartment;
//   final String city;
//   final String state;
//   final String country;
//   final String email;
//   final String phoneNumber;
//   final String postalCode;
//   final String extraDescription;
//   final String shippingMethod;
//   final int orderId;
//   final int order;

//   ShippingData({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.street,
//     required this.building,
//     required this.floor,
//     required this.apartment,
//     required this.city,
//     required this.state,
//     required this.country,
//     required this.email,
//     required this.phoneNumber,
//     required this.postalCode,
//     required this.extraDescription,
//     required this.shippingMethod,
//     required this.orderId,
//     required this.order,
//   });

//   factory ShippingData.fromJson(Map<String, dynamic> json) {
//     return ShippingData(
//       id: json['id'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       street: json['street'],
//       building: json['building'],
//       floor: json['floor'],
//       apartment: json['apartment'],
//       city: json['city'],
//       state: json['state'],
//       country: json['country'],
//       email: json['email'],
//       phoneNumber: json['phone_number'],
//       postalCode: json['postal_code'],
//       extraDescription: json['extra_description'],
//       shippingMethod: json['shipping_method'],
//       orderId: json['order_id'],
//       order: json['order'],
//     );
//   }
// }

// class Item {
//   final String name;
//   final String description;
//   final int amountCents;
//   final int quantity;

//   Item({
//     required this.name,
//     required this.description,
//     required this.amountCents,
//     required this.quantity,
//   });

//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(
//       name: json['name'],
//       description: json['description'],
//       amountCents: json['amount_cents'],
//       quantity: json['quantity'],
//     );
//   }
// }