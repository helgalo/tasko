import 'package:flutter/material.dart';

import 'package:tasko/core/theme/core_colors.dart';
import 'package:tasko/core/theme/core_text_styles.dart';

class SnackBarWidget extends StatelessWidget {
  final String title;
  final String description;
  final SnackBarTypes type;
  const SnackBarWidget({
    super.key,
    required this.title,
    required this.description,
    required this.type,
  });

  @override
  SnackBar build(BuildContext context) {
    return SnackBar(
      backgroundColor: type.theme.backGroundColor,
      content: SizedBox(
        child: Row(
          children: [
            Row(
              children: [
                if (type == SnackBarTypes.error)
                  Icon(
                    type.theme.icon,
                    size: 20,
                  ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: CoreTextStyles.inter(
                        color: CoreColors.coreWhite,
                        fontSize: 15.6,
                        fontWeight: FontWeightEnum.semiBold_600,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 146,
                      child: Text(
                        description,
                        style: CoreTextStyles.inter(
                          color: CoreColors.coreWhite,
                          fontSize: 15.6,
                          fontWeight: FontWeightEnum.regular_400,
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
  }
}

class SnackBarTheme {
  final Color backGroundColor;
  final IconData icon;

  SnackBarTheme({
    required this.backGroundColor,
    required this.icon,
  });
}

enum SnackBarTypes {
  error,
  valid,
}

extension ButtonTypesExtension on SnackBarTypes {
  String get description => name;

  SnackBarTheme get theme {
    switch (this) {
      case SnackBarTypes.error:
        return SnackBarTheme(
          backGroundColor: CoreColors.coreRed,
          icon: Icons.warning,
        );
      case SnackBarTypes.valid:
        return SnackBarTheme(
          backGroundColor: CoreColors.coreApproved,
          icon: Icons.check,
        );
    }
  }
}
