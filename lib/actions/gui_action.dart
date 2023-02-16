import 'package:flutter/material.dart';
import '../interfaces/i_gui_action.dart';

class GuiAction implements IGUIAction {
  final BuildContext? _context;
  GuiAction (this._context);
  @override
  void done(String? text) {
    showToast(_context!, text!);
  }
}

void showToast(BuildContext context, String text) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(text),
      action: SnackBarAction(
          label: 'CLOSE', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
