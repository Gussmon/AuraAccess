import 'package:flutter/material.dart';

class VisitorRegistryPage extends StatefulWidget {
  const VisitorRegistryPage({super.key});

  @override
  State<VisitorRegistryPage> createState() => _VisitorRegistryPageState();
}

class _VisitorRegistryPageState extends State<VisitorRegistryPage> {
  // Controladores para capturar el texto de los inputs
  final _nameController = TextEditingController();
  final _dniController = TextEditingController();
  final _deptController = TextEditingController();
  final _reasonController = TextEditingController();

  @override
  void dispose() {
    // Buenas prácticas: Limpiar controladores al salir de la pantalla
    _nameController.dispose();
    _dniController.dispose();
    _deptController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Visitante'),
        backgroundColor: const Color.fromARGB(255, 30, 86, 56),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Datos de Ingreso Obligatorios',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre Completo',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _dniController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Documento de Identidad (DNI/CE)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _deptController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Departamento a visitar',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _reasonController,
                decoration: const InputDecoration(
                  labelText: 'Motivo de la visita',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 50, 106, 79),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  'GUARDAR REGISTRO',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  // Aquí irá la lógica de inserción en SQFLite
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Guardando a: ${_nameController.text}'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
