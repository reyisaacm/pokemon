import "package:flutter/material.dart";

class PokemonButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTap;
  final String buttonText;
  final Color color;

  const PokemonButton({
    super.key,
    required this.isEnabled,
    required this.onTap,
    required this.buttonText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          backgroundColor: color,
        ),
        onPressed: isEnabled ? onTap : null,
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
