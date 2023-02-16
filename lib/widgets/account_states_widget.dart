import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../interfaces/i_extended_action.dart';
import '../actions/gui_action.dart';
import '../events/action_events.dart';
import '../events/account_events.dart';
import '../blocs/bloc_account.dart';
import '../events/event.dart';
import '../states/account_states.dart';
import '../extended/action.dart';

class AccountStatesWidget extends StatelessWidget {
  static const List<String> label = [
    'register',
    'login',
    'refresh',
    'logout',
    'unregister'
  ];

  static Map<String,Event> map = {
    'register'  : Registration.   attr("MichaelKanzieper@gmail.com"),
    'login'     : Login.          attr("MichaelKanzieper@gmail.com"),
    'refresh'   : Fetching.       attr("MichaelKanzieper@gmail.com"),
    'logout'    : Logout.         attr("MichaelKanzieper@gmail.com"),
    'unregister': Unregistration. attr("MichaelKanzieper@gmail.com")
  };

  const AccountStatesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountStates>(
      builder: (context, state) {
        return

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${state.name}',
                style: const TextStyle(fontSize: 24.0),
              ),
              const SizedBox(
                height: 32,
              ),
              ButtonsListWidget(label: label, map: map, ),
            ],
          );
      },
    );
  }
}

class ButtonsListWidget extends StatelessWidget {
  const ButtonsListWidget({
    super.key,
    required this.label,
    required this.map,
  });

  final List<String> label;
  final Map<String,Event> map;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shadowColor: Colors.greenAccent,
              elevation: 3,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(4),
              fixedSize: const Size(
                96,
                72,
              ),
            ),
            onPressed: () {
              press(context, "${label[index]}");
            },
            child: Text("${label[index]}"),
          );
        },
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(
          width: 16.0,
        ),
        itemCount: label.length,
      ),
    );
  }

  void press(BuildContext context, String text) {
    print("press->[$text] context->$context");
    Event? event = map[text];
    if (event != null) {

      IExtendedAction success = ExtendedAction(context, Succeeded()/*Succeeded.attr("Ok!")*/);
      IExtendedAction error = ExtendedAction(context, Failed()/*Failed.attr("Error!")*/);

      event.addAction(ExtendedAction(context, Idle.attr('Run!'))); //  need idle
      event.setGuiAction(GuiAction(context));
      AccountBloc bloc = context.read<AccountBloc>();

      bloc.setAction(Success(), success);
      bloc.setAction(Error(), error);

      context.read<AccountBloc>().add(event);
    }
  }
}
