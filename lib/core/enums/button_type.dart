import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, normal, outline }

extension ButtonTypeExtension on ButtonType {
  Color getBackgroundColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
        return Colors.greenAccent;
      case ButtonType.secondary:
        return Colors.blueAccent;
      case ButtonType.normal:
        return Colors.grey;
      case ButtonType.outline:
        return Colors.transparent;
    }
  }

  Color? getForegroundColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
      case ButtonType.secondary:
      case ButtonType.normal:
        return null;
      case ButtonType.outline:
        return Colors.grey;
    }
  }

  Color getTextColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
        return Colors.greenAccent;
      case ButtonType.secondary:
        return Colors.blueAccent;
      case ButtonType.normal:
        return Colors.grey;
      case ButtonType.outline:
        return Colors.transparent;
    }
  }
}
