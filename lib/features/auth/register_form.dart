import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro exitoso')),
      );
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Correo electrónico'),
        ),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: 'Contraseña'),
          obscureText: true,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _register,
          child: const Text('Registrarse'),
        ),
      ],
    );
  }
}
