import 'package:flutter/material.dart';

class PokemonDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String title;
  final String content;

  const PokemonDialog(
      {super.key,
      required this.onConfirm,
      required this.onCancel,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: onCancel,
          child: const Text('Cancel'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: onConfirm,
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
