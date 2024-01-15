import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final VoidCallback onPress;

  const CustomButton({
    super.key,
    required this.txt,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(15),
        ),
        onPressed: onPress,
        child: Text(
          txt,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
