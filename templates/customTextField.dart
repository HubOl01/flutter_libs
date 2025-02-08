import 'package:flutter/material.dart';

import '../core/styles/Colors.dart';
import '../core/styles/TextStyles.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final int? maxLength;
  final bool isLines;
  final bool? isPS;
  final Function(String value)? onChanged;
  const CustomTextField({
    super.key,
    required this.controller,
    this.maxLength,
    this.isLines = false,
    this.isPS = false,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    if (widget.isPS!) {
      widget.controller
          .addListener(_addPS); // Добавляем слушатель к контроллеру
    }
  }

  @override
  void dispose() {
    if (widget.isPS!) {
      widget.controller.removeListener(_addPS); // Убираем слушатель
    }
    super.dispose();
  }

  void _addPS() {
    final text = widget.controller.text;
    if (text.isNotEmpty && !text.startsWith("P.S.")) {
      widget.controller.text = "P.S. $text"; // Добавляем "P.S." в начало
      widget.controller.selection = TextSelection.fromPosition(
        const TextPosition(offset: 5), // Перемещаем курсор сразу после "P.S. "
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      style: TextStyles.text16w500N,
      maxLength: widget.maxLength,
      maxLines: widget.isLines ? null : 1,
      scrollPadding: const EdgeInsets.all(0),
      decoration: InputDecoration(
          counterText: "",
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          fillColor: primaryColor,
          filled: true,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none)),
    );
  }
}
