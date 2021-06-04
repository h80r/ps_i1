import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:ps_i1/store/app_state.dart';
import 'package:ps_i1/pages/login/login_view_model.dart';

class Input extends StatelessWidget {
  final bool isPassword;
  final String hint;
  final Widget? suffix;
  final Function(String)? onChanged;

  const Input({
    Key? key,
    required this.hint,
    this.isPassword = false,
    this.suffix,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder();

    return Container(
      margin: const EdgeInsets.all(12),
      width: 400,
      height: 35,
      child: TextFormField(
        obscureText: isPassword,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(left: 8.0),
          border: border,
          focusedBorder: border,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 16),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}

class MySession extends StatelessWidget {
  const MySession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BEGGINING");

    return StoreConnector<AppState, LoginViewModel>(
      converter: (store) => LoginViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Fazer Login'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Input(
                  hint: 'Email',
                  onChanged: viewModel.onEmailChanged,
                ),
                Input(
                  hint: 'Senha',
                  onChanged: viewModel.onPasswordChanged,
                  isPassword: true,
                  suffix: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      size: 18,
                      color: Colors.black45,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 135,
                        height: 20,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.grey,
                          ),
                          child: const Text(
                            'Esqueci a senha',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 400,
                  height: 40,
                  margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
                  child: OutlinedButton(
                    onPressed: () =>
                        viewModel.onLoad!(viewModel.email, viewModel.password),
                    child: const Text(
                      'Entrar',
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}