class PaymobLoginModel {
  
  final String token;
  

  PaymobLoginModel({
   
    required this.token,

  });

  factory PaymobLoginModel.fromJson(Map<String, dynamic> json) {
    return PaymobLoginModel(
      token: json['token'],
     
    );
  }
}
