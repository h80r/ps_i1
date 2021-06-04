import 'package:flutter/material.dart';

class NotLogged extends StatelessWidget {
  const NotLogged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ops, alguém se perdeu...'),
      ),
      body: Center(
        child: Column(
          children: const [
            Icon(
              Icons.no_accounts,
              size: 40.0,
            ),
            Divider(
              color: Colors.transparent,
              height: 20.0,
            ),
            Text('Parece que você ainda não está logado!'),
          ],
        ),
      ),
    );
  }
}
