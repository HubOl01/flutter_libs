import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;
  const CustomDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        insetPadding: const EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: child);
  }
}
