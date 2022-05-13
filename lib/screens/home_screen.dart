import 'dart:async';
import 'dart:convert';

import 'package:crypto_app/models/coins.dart';
import 'package:crypto_app/widgets/nav_bar.dart';
import 'package:crypto_app/widgets/total_balance.dart';
import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';
import 'package:http/http.dart' as http;

import '../widgets/design/coin_cards.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  //fetching coins
  Future<List<Coins>> fetchCoin() async {
    coinList = [];
    final reponse = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=zar&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (reponse.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(reponse.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coins.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception("Failed to load");
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(const Duration(seconds: 10), (((timer) => fetchCoin())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1b232A),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: TotalBalance(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 75,
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        text: "Coins",
                        onTap: () {},
                        active: true,
                      ),
                      ButtonWidget(
                        text: "Deposit",
                        onTap: () {},
                        active: false,
                      ),
                      ButtonWidget(
                        text: "Withdraw",
                        onTap: () {},
                        active: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: ListView.builder(
                    itemCount: coinList.length,
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return SingleChildScrollView(
                        child: CoinCard(
                            name: coinList[index].name,
                            symbol: coinList[index].symbol,
                            imageUrl: coinList[index].imageUrl,
                            price: coinList[index].price!.toDouble(),
                            change: coinList[index].change!.toDouble(),
                            changePercentage:
                                coinList[index].changePercentage!.toDouble()),
                      );
                    })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
