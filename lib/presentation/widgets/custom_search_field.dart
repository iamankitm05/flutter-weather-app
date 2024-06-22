import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.controller,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final Function(String value)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      borderRadius: BorderRadius.circular(50),
    );
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        suffixIcon: const Icon(Icons.search),
        suffixIconConstraints: const BoxConstraints(minWidth: 50),
        hintText: "Search",
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
      ),
    );
  }
}
