import 'package:flutter/material.dart';
import 'account_states_panel_widget.dart';
import 'container_body.dart';
import 'actions_panel_widget.dart';
import 'header_title.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeaderTitle(),
          SizedBox(height: 20.0),
            ContainerBody(
             children: [
               AccountStatesPanelWidget(),
               ActionsPanelWidget(),
             ],
           )
        ],
      ),
    );
  }
}
