import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final int index;
  final String image;
  final double width;

  const PageViewItem({
    Key? key,
    required this.index,
    required this.width,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: width,
        ),
      ),
    );
  }
}
