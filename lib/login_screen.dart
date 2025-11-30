import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _userController = TextEditingController();
    final _passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Iniciar Sesión")),
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
                final usuario = _userController.text;
                final password = _passController.text;

                if (usuario == "admin" && password == "1234") {
                  // Si es administrador → va a la hoja de administración
                  Navigator.pushReplacementNamed(context, '/admin');
                } else {
                  // Si es usuario normal → va al catálogo
                  Navigator.pushReplacementNamed(context, '/catalogo');
                }
              },
              child: const Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}
