import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final String content;
  final String positiveText;
  final String negativeText;
  final VoidCallback onPositivePressed;
  final VoidCallback onNegativePressed;

  const CustomDialogBox({super.key, 
    required this.title,
    required this.content,
    required this.positiveText,
    required this.negativeText,
    required this.onPositivePressed,
    required this.onNegativePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            const SizedBox(height: 16),
            Text(content, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onNegativePressed,
                  child: Text(negativeText),
                ),
                ElevatedButton(
                  onPressed: onPositivePressed,
                  child: Text(positiveText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
