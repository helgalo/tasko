import 'package:tasko/app_widget.dart';
import 'package:tasko/widgets/snack_bar_widget.dart';

class SnackBarService {
  static void getSnack({
    required String snackTitle,
    required String description,
    SnackBarTypes? type,
  }) {
    final snackBar = SnackBarWidget(
      title: snackTitle,
      description: description,
      type: type ?? SnackBarTypes.error,
    );

    rootScaffoldMessengerKey.currentState?.showSnackBar(
      snackBar.build(
        rootScaffoldMessengerKey.currentContext!,
      ),
    );
  }
}
