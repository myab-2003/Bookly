import 'package:flutter/material.dart';

class logotext extends StatelessWidget {
  const logotext({super.key, required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      'BOOKLY',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontFamily: 'Tektur',
      ),
    );
  }
}
