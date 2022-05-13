import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  String? name;
  String? symbol;
  String? imageUrl;
  double? price;
  double? change;
  double? changePercentage;

  CoinCard(
      {this.name,
      this.price,
      this.symbol,
      this.change,
      this.changePercentage,
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xFF5ED5AB),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF5ED5AB),
              offset: Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color(0xFF5ED5AB),
              offset: Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 158, 158, 158),
                      offset: Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(imageUrl!),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(name!,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      symbol!,
                      style: TextStyle(color: Colors.grey[900], fontSize: 20),
                    ),
                    Text(
                        change!.toDouble() < 0
                            ? change!.toDouble().toString()
                            : "+ " + change!.toDouble().toString(),
                        style: TextStyle(
                            color: change!.toDouble() < 0
                                ? Colors.red
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text(
                      changePercentage!.toDouble() < 0
                          ? changePercentage!.toDouble().toString() + "%"
                          : '+ ' +
                              changePercentage!.toDouble().toString() +
                              '%',
                      style: TextStyle(
                          color: change!.toDouble() < 0
                              ? Colors.red
                              : Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'R ' + price!.toDouble().toString(),
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
