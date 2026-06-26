import 'package:flutter/material.dart';

class VisitorRegistryPage extends StatefulWidget {
  const VisitorRegistryPage({super.key});

  @override
  State<VisitorRegistryPage> createState() => _VisitorRegistryPageState();
}

class _VisitorRegistryPageState extends State<VisitorRegistryPage> {
  // CLAVE GLOBAL PARA VALIDAR EL FORMULARIO (Nueva funcionalidad de control)
  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey, // Asignamos la clave del formulario aquí
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Datos de Ingreso Obligatorios',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                
                // 1. Nombre Completo (Validado)
                TextFormField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Nombre Completo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'El nombre completo es obligatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                
                // 2. Documento de Identidad (Validado)
                TextFormField(
                  controller: _dniController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Documento de Identidad (DNI/CE)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.badge),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'El documento de identidad es obligatorio';
                    }
                    if (value.trim().length < 8) {
                      return 'El documento debe tener al menos 8 dígitos';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                
                // 3. Departamento a visitar (Validado)
                TextFormField(
                  controller: _deptController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Departamento a visitar',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.apartment),
                    hintText: 'Ej: 302 - Torre A',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Especifique el departamento de destino';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                
                // 4. Motivo de la visita (Validado)
                TextFormField(
                  controller: _reasonController,
                  decoration: const InputDecoration(
                    labelText: 'Motivo de la visita',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.info_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'El motivo de la visita es obligatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                
                // Botón de guardado con validación activa
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 50, 106, 79),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: const Text(
                    'GUARDAR REGISTRO',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    // DISPARA LA VALIDACIÓN ANTES DE GUARDAR
                    if (_formKey.currentState!.validate()) {
                      // Si pasa las validaciones, muestra el SnackBar de éxito
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('✅ Guardando a: ${_nameController.text} de forma local'),
                          backgroundColor: Colors.green,
                        ),
                      );

                      // Lógica de retorno al Dashboard limpia
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}