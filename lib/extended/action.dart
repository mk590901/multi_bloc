import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc_action.dart';
import '../events/event.dart';
import '../interfaces/i_extended_action.dart';

class ExtendedAction extends IExtendedAction {
  final BuildContext _context;
  final Event? _event;
  ExtendedAction(this._context, this._event);

  // @override
  // void run(Event? event) {
  //   if (event != null) {
  //     _context.read<ResultBloc>().add(event);
  //   }
  // }

  @override
  void run() {
    if (_event != null) {
      _context.read<ActionBloc>().add(_event!);
    }
  }

}