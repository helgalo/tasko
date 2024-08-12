import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/core/theme/core_text_styles.dart';

class MainInputTextFieldWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final Widget? leading;
  final Widget? trailing;
  final TextFieldType styleType;
  final List<TextInputFormatter> inputFormatters;
  final bool? isObscure;
  final String? hintText;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final BoxConstraints? constraints;
  final String? label;
  final bool isOptional;
  final String? infoMessage;
  final int lengthLimit;
  final String? mask;
  final Function()? onEditingComplete;
  final Function()? onTapPasswordVisibleButton;
  final bool enabled;
  final Function()? onTap;
  final int maxLines;

  const MainInputTextFieldWidget({
    super.key,
    this.controller,
    this.height,
    this.width,
    this.styleType = TextFieldType.primary,
    this.leading,
    this.inputFormatters = const <TextInputFormatter>[],
    this.isObscure,
    this.hintText,
    this.onSubmitted,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.constraints,
    this.label,
    this.isOptional = false,
    this.infoMessage,
    this.lengthLimit = -1,
    this.mask,
    this.onEditingComplete,
    this.onChanged,
    this.keyboardType,
    this.onTapPasswordVisibleButton,
    this.trailing,
    this.enabled = true,
    this.onTap,
    this.maxLines = 1,
  });

  @override
  State<MainInputTextFieldWidget> createState() =>
      _MainInputTextFieldWidgetState();
}

class _MainInputTextFieldWidgetState extends State<MainInputTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.label!,
                    style: CoreTextStyles.publicSans(
                      fontSize: 14,
                      fontWeight: FontWeightEnum.bold_700,
                      color: CoreColors.primaryTextColor,
                    ),
                  ),
                  if (widget.isOptional)
                    Row(
                      children: [
                        const SizedBox(width: 12),
                        // SvgPicture.asset(CoreImages.minusCircle),
                        const SizedBox(width: 4),
                        Text(
                          "Optional",
                          style: CoreTextStyles.publicSans(
                            color: CoreColors.corePrimary,
                            fontSize: 14,
                            fontWeight: FontWeightEnum.medium_500,
                          ),
                        )
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        const SizedBox(height: 12),
        Container(
          constraints: widget.constraints,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: widget.styleType.theme.backgroundColor,
            border: widget.styleType.theme.borderColor != null
                ? Border.all(
                    color: widget.styleType.theme.borderColor!,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  )
                : null,
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              if (widget.leading != null) widget.leading!,
              Expanded(
                child: widget.isObscure == true
                    ? TextField(
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) {
                          widget.onSubmitted;
                          FocusScope.of(context).unfocus();
                        },
                        onTap: widget.onTap,
                        enabled: widget.enabled,
                        keyboardType: widget.keyboardType,
                        onEditingComplete: widget.onEditingComplete,
                        onChanged: widget.onChanged,
                        focusNode: widget.focusNode,
                        obscureText: widget.isObscure!,
                        inputFormatters: widget.inputFormatters,
                        textAlign: widget.textAlign,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 0,
                          ),
                          isDense: false,
                          border: InputBorder.none,
                          hintText: widget.hintText,
                          hintStyle: CoreTextStyles.publicSans(
                            color: CoreColors.coreHintTextField,
                            fontSize: 16,
                            fontWeight: FontWeightEnum.regular_400,
                          ),
                        ),
                        controller: widget.controller,
                        style: widget.styleType.theme.textStyle,
                      )
                    : TextField(
                        maxLines: widget.maxLines,
                        onTap: widget.onTap,
                        enabled: widget.enabled,
                        keyboardType: widget.keyboardType,
                        onEditingComplete: widget.onEditingComplete,
                        onChanged: widget.onChanged,
                        focusNode: widget.focusNode,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) {
                          widget.onSubmitted;
                          FocusScope.of(context).unfocus();
                        },
                        inputFormatters: widget.inputFormatters,
                        textAlign: widget.textAlign,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                          isDense: false,
                          border: InputBorder.none,
                          hintText: widget.hintText,
                          hintStyle: CoreTextStyles.publicSans(
                            color: CoreColors.coreHintTextField,
                            fontSize: 16,
                            fontWeight: FontWeightEnum.regular_400,
                          ),
                        ),
                        controller: widget.controller,
                        style: widget.styleType.theme.textStyle,
                      ),
              ),
              if (widget.trailing != null) widget.trailing!,
              if (widget.isObscure != null && widget.trailing == null)
                Row(
                  children: [
                    CupertinoButton(
                      onPressed: widget.onTapPasswordVisibleButton,
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.remove_red_eye,
                        size: 24,
                        color: widget.isObscure == true
                            ? CoreColors.coreBackground
                            : CoreColors.coreSecondaryColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
            ],
          ),
        ),
        if (widget.infoMessage != null)
          Column(
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    widget.styleType == TextFieldType.error
                        ? Icons.close
                        : Icons.info_outline,
                    color: widget.styleType.theme.infoIconColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.infoMessage!,
                    style: widget.styleType.theme.infoTextStyle,
                  ),
                ],
              )
            ],
          ),
      ],
    );
  }
}

class TextFieldTypeTheme {
  final Color? borderColor;
  final Color? backgroundColor;
  final Color infoIconColor;
  final TextStyle textStyle;
  final TextStyle infoTextStyle;

  TextFieldTypeTheme({
    this.borderColor,
    this.backgroundColor,
    this.infoIconColor = CoreColors.coreBackground,
    required this.textStyle,
    required this.infoTextStyle,
  });
}

enum TextFieldType {
  primary,
  valid,
  error,
}

extension TextFieldTypeExtension on TextFieldType {
  String get description => name;

  TextFieldTypeTheme get theme {
    switch (this) {
      case TextFieldType.primary:
        return TextFieldTypeTheme(
          backgroundColor: CoreColors.inputBackgroundColor,
          borderColor: CoreColors.inputBackgroundColor,
          infoIconColor: CoreColors.coreSecondaryColor,
          textStyle: CoreTextStyles.publicSans(
            color: CoreColors.primaryTextColor,
            fontWeight: FontWeightEnum.regular_400,
          ).copyWith(height: 2),
          infoTextStyle: CoreTextStyles.publicSans(
            color: CoreColors.coreSecondaryColor,
            fontSize: 12,
            fontWeight: FontWeightEnum.regular_400,
          ),
        );
      case TextFieldType.valid:
        return TextFieldTypeTheme(
          backgroundColor: CoreColors.inputBackgroundColor,
          borderColor: CoreColors.inputBackgroundColor,
          infoIconColor: CoreColors.coreSecondaryColor,
          textStyle: CoreTextStyles.publicSans(
            color: CoreColors.corePrimary,
            fontWeight: FontWeightEnum.regular_400,
          ),
          infoTextStyle: CoreTextStyles.publicSans(
            color: CoreColors.coreSecondaryColor,
            fontSize: 12,
            fontWeight: FontWeightEnum.regular_400,
          ),
        );
      case TextFieldType.error:
        return TextFieldTypeTheme(
          infoIconColor: CoreColors.coreRed,
          borderColor: CoreColors.coreRed,
          backgroundColor: CoreColors.inputBackgroundColor,
          textStyle: CoreTextStyles.publicSans(
            color: CoreColors.coreRed,
            fontWeight: FontWeightEnum.regular_400,
          ),
          infoTextStyle: CoreTextStyles.publicSans(
            color: CoreColors.coreRed,
            fontSize: 12,
            fontWeight: FontWeightEnum.regular_400,
          ),
        );
    }
  }
}
