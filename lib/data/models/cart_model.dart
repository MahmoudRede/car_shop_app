class CartModel {

  String? productName;
  String? productImage;
  String? productDescribtion;
  String? productPrice;

  CartModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDescribtion,
  });

  CartModel.fromJson(Map<String, dynamic> json)
      : this(
    productName: json['productName'],
    productImage: json['productImage'],
    productPrice: json['productPrice'],
    productDescribtion: json['productDescribtion'],
  );

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'productDescribtion': productDescribtion,
    };
  }
}
