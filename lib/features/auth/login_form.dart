import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Inicio de sesión exitoso')),
      );
      // Navega a la página principal después del inicio de sesión
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
          onPressed: _login,
          child: const Text('Iniciar sesión'),
        ),
      ],
    );
  }
}
