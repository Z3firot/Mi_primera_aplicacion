import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/api_service.dart';


class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final ApiService apiService = ApiService();

  bool isLoading = false;
  String? responseMessage;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
        responseMessage = null;
      });

      try {
        final result = await apiService.createPost(
          _titleController.text,
          _bodyController.text,
        );
        setState(() {
          responseMessage = "✅ Post creado con ID: ${result['id']}";
        });
      } catch (e) {
        setState(() {
          responseMessage = "❌ Error: $e";
        });
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Segunda pantalla - Formulario POST")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Título"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Ingresa un título" : null,
              ),
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(labelText: "Contenido"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Ingresa contenido" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: isLoading ? null : _submitForm,
                icon: const Icon(Icons.send),
                label: isLoading
                    ? const Text("Enviando...")
                    : const Text("Enviar POST"),
              ),
              const SizedBox(height: 20),
              if (responseMessage != null)
                Text(
                  responseMessage!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
