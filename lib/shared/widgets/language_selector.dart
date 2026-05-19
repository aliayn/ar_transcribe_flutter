import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final String selected;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selected,
        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor: const Color(0xFF0D0D1A),
        style: const TextStyle(color: Colors.white),
        items: AppConstants.supportedLanguages
            .map(
              (lang) => DropdownMenuItem<String>(
                value: lang['code']!,
                child: Text(
                  lang['label']!,
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
