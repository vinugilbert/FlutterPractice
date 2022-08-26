final String tableProducts="products";

class ProductListFields
{
  static final List<String> values = [
    /// Add all fields
    id, itemName, desc, currency, price,expiryDate,quantity
  ];
  static final String id = "id";

  static final  String itemName= "itemName";
  static final  String desc="desc";
  static final String price="price";
  static final String currency="currency";
  static final String expiryDate="expiryDate";
  static final String quantity="quantity";




}
class DbProducts {
  String? itemName;
  String? desc;
  String? price;
  String? currency;
  String? expiryDate;
  String? quantity;

  DbProducts({this.itemName,
    this.desc,
    this.price,
    this.currency,
    this.expiryDate,
    this.quantity});

  DbProducts.fromJson(Map<String, dynamic> json) {
    itemName = json[ProductListFields.itemName];
    desc = json[ProductListFields.desc];
    price = json[ ProductListFields.price];
    currency = json[ ProductListFields.currency];
    expiryDate = json[ ProductListFields.expiryDate];
    quantity = json[ ProductListFields.quantity];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ProductListFields.itemName] = this.itemName;
    data[ProductListFields.desc] = this.desc;
    data[ ProductListFields.price] = this.price;
    data[ ProductListFields.currency] = this.currency;
    data[ ProductListFields.expiryDate] = this.expiryDate;
    data[ ProductListFields.quantity] = this.quantity;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      ProductListFields.itemName: this.itemName,
      ProductListFields.desc: this.desc,
      ProductListFields.price: this.price,
      ProductListFields.currency: this.currency,
      ProductListFields.expiryDate: this.expiryDate,
      ProductListFields.quantity: this.quantity
    };
  }
}