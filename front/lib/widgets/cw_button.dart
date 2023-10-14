import 'package:flutter/material.dart';

class CwButton extends StatelessWidget {
  final String text;
  final Color? colorBackground;
  final Color? colorText;
  final Function() onPressed;
  final bool parentSizeHorizontal;

  const CwButton(
    this.text, {
    Key? key,
    required this.onPressed,
    this.colorText,
    this.colorBackground,
    this.parentSizeHorizontal = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Material(
        color: colorBackground,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 100,
            ),
            padding: const EdgeInsets.all(15),
            alignment: parentSizeHorizontal ? Alignment.center : null,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: colorText), // Style de texte avec la couleur spécifiée
            ),
          ),
        ),
      ),
    );
  }
}
