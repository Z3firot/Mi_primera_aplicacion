import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _userController = TextEditingController();
    final _passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userController,
              decoration: const InputDecoration(labelText: "Usuario"),
            ),
            TextField(
              controller: _passController,
              decoration: const InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí podrías guardar el usuario
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}
