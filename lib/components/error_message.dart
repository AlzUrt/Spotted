import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  final String errorText;

  const ErrorComponent({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (errorText.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0), // Espacement de 8.0 sur tous les côtés
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(8.0),
        height: 50,
        child: Center(
          child: Text(
            errorText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

