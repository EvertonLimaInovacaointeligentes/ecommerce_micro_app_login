import 'package:ecommerce_micro_app_login/app/controllers/login_controller.dart';
import 'package:ecommerce_micro_app_login/app/model/loginTeste.dart';
import 'package:ecommerce_micro_app_login/app/pages/login_page.dart';
import 'package:flutter/material.dart';

class LoginPage2 extends StatelessWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<LoginEstudo> user = ValueNotifier<LoginEstudo>(
      LoginEstudo(login: '', senha: '', logado: false),
    );
    ValueNotifier<bool> check = ValueNotifier<bool>(false);
    final _formkey = GlobalKey<FormState>();
    final _txtLogin = TextEditingController();
    final _txtSenha = TextEditingController();
    var _controller = LoginController();
    var message = 'Formulario invalido';
    String? loginDigitado;
    String? senhaDigitada;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: check,
            builder: (_, value, __) {
              if (check.value) {
                message += _txtLogin.text + "!";
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
                Future.delayed(Duration(seconds: 5)).whenComplete(
                      () => Navigator.of(context).pushReplacementNamed("/home"),
                );
                return Text('ok');
              } else {
                message = 'Usuario: ${_txtLogin.text} não encontrado!';
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
                return Text('Erro');
              }
            },
          ),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _txtLogin,
                    decoration: InputDecoration(
                      icon: Icon(Icons.supervised_user_circle),
                      labelText: 'Login',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.deepOrange),
                      ),
                      isDense: true,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'favor preencher o campo login';
                      }
                    },
                    onChanged: (String value) {
                      //campo de login digitado
                      loginDigitado = value;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _txtSenha,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      labelText: 'senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.deepOrange),
                      ),
                      isDense: true,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    //maxLines: null,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'favor preencher o campo senha';
                      }
                    },
                    onChanged: (String value) {
                      //campo de login digitado
                      loginDigitado = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //
                      user.value.login = _txtLogin.text;
                      user.value.senha = _txtSenha.text;
                      var formValid =
                          _formkey.currentState?.validate() ?? false;

                      if (formValid) {
                        message = 'Bem vindo, ';
                      }
                      bool logou = await _controller.Login(
                          _txtLogin.text, _txtSenha.text);
                      user.value.logado = logou;
                      check.value = logou;
                    },
                    child: const Text('Acessar'),
                  ),
                ],
              ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
