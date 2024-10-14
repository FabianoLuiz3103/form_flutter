import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  const Details({super.key,
  required this.firstName,
  required this.lastName,
  required this.email,
  required this.password
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: <Widget>[
          Text('Nome: ${widget.firstName} ${widget.lastName}'),
          Text('Email: ${widget.email}'),
          Text('Senha: ${widget.password}'),
        ],
        
      ),
    );
  }
}