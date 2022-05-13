import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Balance: ",
                  style: TextStyle(
                      color: Colors.white.withOpacity(.55), fontSize: 15)),
              const SizedBox(height: 5),
              const Text("R7 896",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold))
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_card_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
