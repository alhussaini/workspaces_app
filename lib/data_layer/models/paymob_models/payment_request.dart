class PaymentRequest {
  final String authToken;
  final String apiSource;
  final String amountCents;
  final String currency;
  final ShippingData shippingData;
  final List<int> integrations;
  final List<Item> items;
  final String deliveryNeeded;

  PaymentRequest({
    required this.authToken,
    required this.apiSource,
    required this.amountCents,
    required this.currency,
    required this.shippingData,
    required this.integrations,
    required this.items,
    required this.deliveryNeeded,
  });

  Map<String, dynamic> toJson() {
    return {
      'auth_token': authToken,
      'api_source': apiSource,
      'amount_cents': amountCents,
      'currency': currency,
      'shipping_data': shippingData.toJson(),
      'integrations': integrations,
      'items': items.map((item) => item.toJson()).toList(),
      'delivery_needed': deliveryNeeded,
    };
  }
}

class ShippingData {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;

  ShippingData({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'email': email,
    };
  }
}

class Item {
  final String name;
  final String amountCents;
  final String quantity;
  final String description;

  Item({
    required this.name,
    required this.amountCents,
    required this.quantity,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount_cents': amountCents,
      'quantity': quantity,
      'description': description,
    };
  }
}