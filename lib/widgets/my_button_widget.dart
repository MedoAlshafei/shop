import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
  });

  final Color color;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(20),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 13,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
