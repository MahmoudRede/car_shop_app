
class ProductModel {
  List<MainProducts>? mainProducts;
  List<SecondeProducts>? secondeProducts;

  ProductModel({this.mainProducts, this.secondeProducts});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['MainProducts'] != null) {
      mainProducts = <MainProducts>[];
      json['MainProducts'].forEach((v) {
        mainProducts!.add(new MainProducts.fromJson(v));
      });
    }
    if (json['SecondeProducts'] != null) {
      secondeProducts = <SecondeProducts>[];
      json['SecondeProducts'].forEach((v) {
        secondeProducts!.add(new SecondeProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainProducts != null) {
      data['MainProducts'] = this.mainProducts!.map((v) => v.toJson()).toList();
    }
    if (this.secondeProducts != null) {
      data['SecondeProducts'] =
          this.secondeProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainProducts {
  String? productModelGuide;
  String? factoryGuide;
  String? cardGuide;
  String? productName;
  String? latinName;
  String? statementName;
  String? barcode;
  String? productionDate;
  String? endDate;
  String? specification;
  String? productType;
  String? factory;
  String? productModel;
  String? brand;
  String? countryOrigin;
  Null side;
  Null manufacturingspecifications;
  Null color;
  Null colorTone;
  double? endUserPrice;
  double? price;
  bool? newItem;
  bool? bestSeller;
  String? imgUrl;
  num? quantity;

  MainProducts(
      {this.productModelGuide,
        this.factoryGuide,
        this.cardGuide,
        this.productName,
        this.latinName,
        this.statementName,
        this.barcode,
        this.productionDate,
        this.endDate,
        this.specification,
        this.productType,
        this.factory,
        this.productModel,
        this.brand,
        this.countryOrigin,
        this.side,
        this.manufacturingspecifications,
        this.color,
        this.colorTone,
        this.endUserPrice,
        this.price,
        this.newItem,
        this.bestSeller,
        this.imgUrl,
        this.quantity});

  MainProducts.fromJson(Map<String, dynamic> json) {
    productModelGuide = json['productModelGuide'];
    factoryGuide = json['factoryGuide'];
    cardGuide = json['CardGuide'];
    productName = json['ProductName'];
    latinName = json['LatinName'];
    statementName = json['StatementName'];
    barcode = json['Barcode'];
    productionDate = json['ProductionDate'];
    endDate = json['EndDate'];
    specification = json['Specification'];
    productType = json['ProductType'];
    factory = json['Factory'];
    productModel = json['ProductModel'];
    brand = json['Brand'];
    countryOrigin = json['CountryOrigin'];
    side = json['Side'];
    manufacturingspecifications = json['Manufacturingspecifications'];
    color = json['Color'];
    colorTone = json['ColorTone'];
    endUserPrice = json['EndUserPrice'];
    price = json['price'];
    newItem = json['NewItem'];
    bestSeller = json['BestSeller'];
    imgUrl = json['ImgUrl'];
    quantity = json['Quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productModelGuide'] = this.productModelGuide;
    data['factoryGuide'] = this.factoryGuide;
    data['CardGuide'] = this.cardGuide;
    data['ProductName'] = this.productName;
    data['LatinName'] = this.latinName;
    data['StatementName'] = this.statementName;
    data['Barcode'] = this.barcode;
    data['ProductionDate'] = this.productionDate;
    data['EndDate'] = this.endDate;
    data['Specification'] = this.specification;
    data['ProductType'] = this.productType;
    data['Factory'] = this.factory;
    data['ProductModel'] = this.productModel;
    data['Brand'] = this.brand;
    data['CountryOrigin'] = this.countryOrigin;
    data['Side'] = this.side;
    data['Manufacturingspecifications'] = this.manufacturingspecifications;
    data['Color'] = this.color;
    data['ColorTone'] = this.colorTone;
    data['EndUserPrice'] = this.endUserPrice;
    data['price'] = this.price;
    data['NewItem'] = this.newItem;
    data['BestSeller'] = this.bestSeller;
    data['ImgUrl'] = this.imgUrl;
    data['Quantity'] = this.quantity;
    return data;
  }
}

class SecondeProducts {
  String? itemGuide;
  String? productName;
  String? productModel;
  String? productionDate;
  String? endDate;
  num? quantity;

  SecondeProducts(
      {this.itemGuide,
        this.productName,
        this.productModel,
        this.productionDate,
        this.endDate,
        this.quantity});

  SecondeProducts.fromJson(Map<String, dynamic> json) {
    itemGuide = json['ItemGuide'];
    productName = json['ProductName'];
    productModel = json['ProductModel'];
    productionDate = json['ProductionDate'];
    endDate = json['EndDate'];
    quantity = json['Quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemGuide'] = this.itemGuide;
    data['ProductName'] = this.productName;
    data['ProductModel'] = this.productModel;
    data['ProductionDate'] = this.productionDate;
    data['EndDate'] = this.endDate;
    data['Quantity'] = this.quantity;
    return data;
  }
}