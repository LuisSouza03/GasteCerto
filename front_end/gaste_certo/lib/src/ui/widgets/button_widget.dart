import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String textButton;
  final void Function()? onPress;

  const ButtonWidget(
      {super.key, required this.textButton, required this.onPress});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(10),
      ),
      child: Text(
        widget.textButton,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
