import 'package:flutter/material.dart';

class MessageService {
  AlertMessage(context, String title, color) {
    print(color);
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(title),
        backgroundColor: color == 'red'
            ? Colors.redAccent[400]
            : color == 'info'
                ? Colors.blueAccent[400]
                : color == 'success'
                    ? Colors.greenAccent[400]
                    : Colors.yellowAccent[400],
      ),
    );
  }
}
