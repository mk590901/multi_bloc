import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../actions/gui_action.dart';
import '../interfaces/i_extended_action.dart';
import '../account_manager.dart';
import '../state_machines/basic_state_machine.dart';
import '../state_machines/account_state_machine.dart';
import '../events/event.dart';
import '../states/account_states.dart';
import '../events/account_events.dart';
import 'bloc_action.dart';

//  https://bloclibrary.dev/#/coreconcepts
//  https://itnext.io/flutter-blocs-at-scale-1-the-state-machine-fce5f086d7b9

class AccountBloc extends Bloc<Event, AccountStates> {
  final BuildContext    _context;
  final AccountManager? accountManager = AccountManager.manager();
  BasicStateMachine? _stateMachine;

  AccountBloc(this._context) : super(AccountStates.unregistered) {
    _stateMachine = AccountStateMachine.V(this, state_(AccountStates.unregistered));

    on<Registration>((event, emit) {
      done(event, emit);
    });

    on<Unregistration>((event, emit) {
      done(event, emit);
    });

    on<Fetching>((event, emit) {
      done(event, emit);
    });

    on<Logout>((event, emit) {
      done(event, emit);
    });

    on<Error>((event, emit) {
      event.setGuiAction(GuiAction(_context));
      done(event, emit);
    });

    on<Success>((event, emit) {
      event.setGuiAction(GuiAction(_context));
      done(event, emit);
    });

    on<Login>((event, emit) {
      done(event, emit);
    });
  }

  BuildContext context() {
    return  _context;
  }

  void sendResult(Event event) {
    _context.read<ActionBloc>().add(event);
  }


  void done(Event event, Emitter<AccountStates> emit) {
    int newState = _stateMachine!.dispatch(event);
    if (newState >= 0) {
      emit(AccountStates.values[newState]);
    }
  }

  @override
  void onChange(Change<AccountStates> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<Event, AccountStates> transition) {
    super.onTransition(transition);
    print(transition);
  }

  void success([String? message]) {
    add(Success.attr(message).activateGui());
  }

  void error(String? message) {
    add(Error.attr(message).activateGui());
  }

  void setAction(Event event, IExtendedAction action) {
    _stateMachine?.setAction(event, action);
  }

  IExtendedAction? action(Event event) {
    return _stateMachine?.getAction(event);
  }

}

