import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasko/core/theme/core_colors.dart';

class MainCheckboxWidget extends StatefulWidget {
  final bool checked;
  final void Function(bool value) onTap;
  const MainCheckboxWidget({
    super.key,
    required this.checked,
    required this.onTap,
  });

  @override
  State<MainCheckboxWidget> createState() => _MainCheckboxWidgetState();
}

class _MainCheckboxWidgetState extends State<MainCheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    bool isCheck = widget.checked;

    return CupertinoButton(
      minSize: 16,
      onPressed: () {
        setState(() {
          isCheck = !widget.checked;
        });

        widget.onTap(isCheck);
      },
      padding: EdgeInsets.zero,
      child: Container(
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: isCheck
              ? null
              : Border.all(
                  width: 2,
                  color: CheckboxButtonType.disabled.theme.color,
                ),
          color: isCheck ? CheckboxButtonType.enabled.theme.color : null,
        ),
        child: isCheck
            ? const Center(
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}

class CheckboxButtonTheme {
  final Color color;
  final Color? iconColor;

  CheckboxButtonTheme({
    required this.color,
    this.iconColor,
  });
}

enum CheckboxButtonType {
  enabled,
  disabled,
}

extension CheckboxButtonTypeExtension on CheckboxButtonType {
  String get description => name;

  CheckboxButtonTheme get theme {
    switch (this) {
      case CheckboxButtonType.enabled:
        return CheckboxButtonTheme(
          color: CoreColors.corePrimary,
          iconColor: CoreColors.coreWhite,
        );
      case CheckboxButtonType.disabled:
        return CheckboxButtonTheme(
          color: CoreColors.coreBorder,
        );
    }
  }
}
