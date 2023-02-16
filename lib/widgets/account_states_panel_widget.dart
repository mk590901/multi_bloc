import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'account_states_widget.dart';
import '../blocs/bloc_account.dart';
import '../states/account_states.dart';

class AccountStatesPanelWidget extends StatelessWidget {
  const AccountStatesPanelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountStates>(
      builder: (context, state) {
        return const AccountStatesWidget();
      },
    );
  }
}
