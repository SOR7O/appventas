import 'package:flutter/material.dart';
import 'package:ventasor/pages/users/login.dart';
import 'package:ventasor/pages/users/registro.dart';

// ignore: must_be_immutable
class HomeUser extends StatefulWidget {
  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  bool login = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: cardUser(context),
      ),
    );
  }

  cardUser(context) {
    return cardHeader(context);
  }

  cardHeader(ctx) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              10), //this is causing the error, when I remove it, I get the card like on picture 2 with the red line
          border: Border(
            left: BorderSide(
                color: Colors.grey, width: 3.0, style: BorderStyle.solid),
          ),
        ),
        // color: Colors.red,
        width: MediaQuery.of(ctx).size.width * 0.80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ButtonBar(
              mainAxisSize: MainAxisSize
                  .min, // this will take space as minimum as posible(to center)
              children: <Widget>[
                TextButton(
                  child: Text('Login',
                      style: TextStyle(
                          color:
                              login ? Colors.greenAccent : Colors.blueAccent)),
                  onPressed: () {
                    print(login);
                    setState(() {
                      login = true;
                    });
                  },
                ),
                TextButton(
                  child: Text('Registro',
                      style: TextStyle(
                          color:
                              !login ? Colors.greenAccent : Colors.blueAccent)),
                  onPressed: () {
                    print(login);
                    setState(() {
                      login = false;
                    });
                  },
                ),
              ],
            ),
            bodyCard(ctx)
          ],
        ),
      ),
    );
  }

  bodyCard(ctx) {
    return login ? LoginPage() : RegistroPage();
  }
}
