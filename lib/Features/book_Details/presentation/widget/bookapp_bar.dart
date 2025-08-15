import 'package:bookly_app/Core/Utils/size_confige.dart';
import 'package:flutter/material.dart';

class bookAppbar extends StatelessWidget {
  const bookAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, size: 30),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, size: 30),
          ),
        ],
      ),
    );
  }
}
