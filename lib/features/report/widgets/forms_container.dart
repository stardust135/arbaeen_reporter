import 'package:flutter/material.dart';

class FormsContainer extends StatelessWidget {
  final String title;
  final Widget body;
  final double width;

  const FormsContainer({
    super.key,
    required this.title,
    required this.body,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    const double circular = 10;

    return Column(
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(circular),
          ),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(circular),
                    topLeft: Radius.circular(circular),
                  ),

                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    // fontFamily: ,
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                width: width,
                decoration: const BoxDecoration(
                  color: Color(0xffe9e9e9),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(circular),
                    bottomRight: Radius.circular(circular),
                  ),
                ),
                child: body,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
