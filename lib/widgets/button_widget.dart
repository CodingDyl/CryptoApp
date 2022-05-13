import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, this.text, this.onTap, this.active})
      : super(key: key);

  final String? text;
  final Function()? onTap;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width / 3.5,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: active! ? Color(0xFF5ED5AB) : Color(0xFF77777777),
          boxShadow: [
            BoxShadow(
              color: active!
                  ? const Color(0xFF5ED5AB).withOpacity(.15)
                  : Colors.transparent,
              offset: const Offset(0, 10),
              blurRadius: 20.0,
              spreadRadius: 0,
            ),
          ]),
      child: TextButton(
        onPressed: onTap!,
        child: Text(text!,
            style: TextStyle(color: active! ? Colors.black : Colors.white54)),
      ),
    );
  }
}
