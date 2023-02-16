import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: const [
            Text(
              'Welcome to Flutter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Multi Bloc Provider...',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const SizedBox(width: 18.0),
        CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            radius: 35,
            child: SizedBox(
              width: 56,
              height: 56,
              child: ClipOval(
                child: Image.asset("assets/bloc.png"),
              ),
            ))
      ],
    );
  }
}
