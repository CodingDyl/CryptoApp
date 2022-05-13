class Coins {
  String? name;
  String? symbol;
  String? imageUrl;
  num? price;
  num? change;
  num? changePercentage;

  Coins(
      {this.name,
      this.symbol,
      this.imageUrl,
      this.price,
      this.change,
      this.changePercentage});

  factory Coins.fromJson(Map<String, dynamic> json) {
    return Coins(
        name: json['name'],
        symbol: json['symbol'],
        imageUrl: json['image'],
        price: json['current_price'],
        change: json['price_change_24h'],
        changePercentage: json['price_change_percentage_24h']);
  }
}

List<Coins> coinList = [];
