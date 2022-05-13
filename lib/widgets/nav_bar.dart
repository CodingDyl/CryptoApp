import 'dart:ffi';

import 'package:flutter/material.dart';

class GlassBotttomNav extends StatefulWidget {
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final EdgeInsets padding;
  final int selectedIndex;
  final Function(int) onPressed;

  GlassBotttomNav(
      {Key? key,
      this.bevel = 15.0,
      required this.selectedIndex,
      required this.onPressed,
      this.padding = const EdgeInsets.all(1.5)})
      : blurOffset = Offset(bevel / 2, bevel / 2),
        color = Colors.grey.shade900,
        super(key: key);

  @override
  State<GlassBotttomNav> createState() => _GlassBotttomNavState();
}

class _GlassBotttomNavState extends State<GlassBotttomNav> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
