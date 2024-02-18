import "package:flutter/material.dart";

class PokemonButtonPrimary extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTap;
  final String buttonText;

  const PokemonButtonPrimary({
    super.key,
    required this.isEnabled,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      child: ElevatedButton(
        // style: const ButtonStyle(
        //   backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
        //   padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
        //     EdgeInsets.symmetric(vertical: 24),
        //   ),
        // ),
        style: ElevatedButton.styleFrom(
            disabledForegroundColor: Colors.grey[700],
            disabledBackgroundColor: Colors.grey[300],
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Theme.of(context).colorScheme.primary),
        onPressed: isEnabled ? onTap : null,
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
