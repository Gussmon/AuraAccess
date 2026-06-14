import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Importante para que reconozca la pantalla de destino

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variables para capturar las selecciones del usuario
  String? selectedRol = 'Vigilante';
  String? selectedPuerta = 'Puerta 1 (Vehicular)';
  String? selectedTurno = 'Mañana';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Iniciar Sesión',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                // 1. Selector de Rol (Siempre visible)
                DropdownButtonFormField<String>(
                  value: selectedRol,
                  decoration: const InputDecoration(
                    labelText: 'Seleccione su Rol',
                  ),
                  items: ['Administrador', 'Vigilante', 'Residente'].map((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedRol = val;
                    });
                  },
                ),

                // 2. Selector de Puerta (Dinamismo con Spread Operator)
                if (selectedRol == 'Vigilante' ||
                    selectedRol == 'Administrador') ...[
                  const SizedBox(height: 15),
                  DropdownButtonFormField<String>(
                    value: selectedPuerta,
                    decoration: const InputDecoration(
                      labelText: 'Ubicación / Puerta',
                    ),
                    items: ['Puerta 1 (Vehicular)', 'Puerta 2 (Peatonal)'].map((
                      String value,
                    ) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedPuerta = val;
                      });
                    },
                  ),
                ],

                // 3. Selector de Turno (Dinamismo con Spread Operator)
                if (selectedRol == 'Vigilante' ||
                    selectedRol == 'Administrador') ...[
                  const SizedBox(height: 15),
                  DropdownButtonFormField<String>(
                    value: selectedTurno,
                    decoration: const InputDecoration(
                      labelText: 'Turno de Trabajo',
                    ),
                    items: ['Mañana', 'Tarde', 'Noche'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedTurno = val;
                      });
                    },
                  ),
                ],

                const SizedBox(height: 30),

                // Botón de Ingreso
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    // Navegación limpia hacia el Dashboard pasando el rol seleccionado
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DashboardPage(role: selectedRol ?? 'Usuario'),
                      ),
                    );
                  },
                  child: const Text(
                    'INGRESAR',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
