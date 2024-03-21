import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ventasor/api/api.services.dart';
import 'package:ventasor/services/message.services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  final alertMessage = MessageService();
  final api = ApiService();
  bool toLogin = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: bodyLogin(),
    );
  }

  bodyLogin() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _username,
            decoration: InputDecoration(
                hintText: "Username o Correo", icon: Icon(Icons.person)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Password", icon: Icon(Icons.password)),
          ),
        ),
        toLogin ? loading() : buttonLogin()
      ],
    );
  }

  buttonLogin() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        icon: Icon(Icons.login),
        label: Text("Iniciar sesion"),
        onPressed: () async {
          bool error = false;
          String title = "";
          if (_username.text.isEmpty || _password.text.isEmpty) {
            error = true;
            title = "Rellena todos los campos";
          }
          if (error) {
            alertMessage.AlertMessage(context, title, 'warning');
            return;
          } else {
            setState(() {
              toLogin = true;
            });
            final res = await api.login(_username.text, _password.text);
            print("=>${res['token']}");
            if (res['token'] == null) {
              await alertMessage.AlertMessage(context, res['message'], 'red');
            } else {
              await alertMessage.AlertMessage(context, 'Bienvenido', 'success');
              Navigator.pushNamed(context, '/productos');
              setState(() {
                toLogin = false;
              });
            }
          }
        },
      ),
    );
  }

  loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
