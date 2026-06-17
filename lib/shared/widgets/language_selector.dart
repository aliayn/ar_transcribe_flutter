import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    super.key,
    required this.selected,
    required this.onChanged,
    required this.languageCodes,
    required this.labelFor,
  });

  final String selected;
  final void Function(String) onChanged;
  final List<String> languageCodes;
  final String Function(String code) labelFor;

  @override
  Widget build(BuildContext context) {
    final effectiveSelected = languageCodes.contains(selected)
        ? selected
        : languageCodes.first;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: effectiveSelected,
        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor: const Color(0xFF0D0D1A),
        style: const TextStyle(color: Colors.white),
        items: languageCodes
            .map(
              (code) => DropdownMenuItem<String>(
                value: code,
                child: Text(
                  labelFor(code),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
            .toList(),
        onChanged: (v) {
          if (v != null) onChanged(v);
        },
      ),
    );
  }
}
