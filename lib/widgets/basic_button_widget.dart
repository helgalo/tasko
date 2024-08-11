import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/core/theme/core_text_styles.dart';

class BasicButtonWidget extends StatelessWidget {
  final String title;
  final ButtonTypes type;
  final Function() onPressed;
  final BoxConstraints? constraints;
  final Widget? leading;
  final bool? isLoading;
  final Color? color;

  const BasicButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.type = ButtonTypes.primary,
    this.constraints = const BoxConstraints(minWidth: 89),
    this.leading,
    this.isLoading,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading == true,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          constraints: constraints,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color ?? type.theme.color,
            borderRadius: BorderRadius.circular(8),
            border: type.theme.borderColor != null
                ? Border.all(width: 1, color: type.theme.borderColor!)
                : null,
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading == true
                  ? SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        color: CoreColors.coreWhite.withOpacity(0.8),
                      ),
                    )
                  : Row(
                      children: [
                        if (leading != null)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              leading!,
                              const SizedBox(width: 12),
                            ],
                          ),
                        Text(
                          title,
                          style: type.theme.style,
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonTheme {
  final TextStyle style;
  final Color color;
  final Color? borderColor;

  ButtonTheme({
    required this.style,
    required this.color,
    this.borderColor,
  });
}

enum ButtonTypes {
  primary,
  secondary,
}

extension ButtonTypesExtension on ButtonTypes {
  String get description => name;

  ButtonTheme get theme {
    switch (this) {
      case ButtonTypes.primary:
        return ButtonTheme(
            style: CoreTextStyles.publicSans(
                fontWeight: FontWeightEnum.semiBold_600),
            color: CoreColors.corePrimary);
      case ButtonTypes.secondary:
        return ButtonTheme(
          style: CoreTextStyles.publicSans(
              fontWeight: FontWeightEnum.semiBold_600),
          color: Colors.transparent,
          borderColor: CoreColors.coreBorder,
        );
    }
  }
}
