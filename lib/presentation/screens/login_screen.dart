import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.domain, size: 80, color: Colors.blueAccent),
                const SizedBox(height: 10),
                const Text(
                  "AURA ACCESS",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const Text(
                  "Control de Accesos Residencial",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 40),

                // Campos de entrada validados
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Documento de Identidad (DNI)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.badge),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 16),

                // Dropdown 1: Roles
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Seleccione su Rol",
                  ),
                  items:
                      [
                            "Administrador",
                            "Personal de Vigilancia",
                            "Trabajador / Conserje",
                          ]
                          .map(
                            (label) => DropdownMenuItem(
                              value: label,
                              child: Text(label),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),

                // Dropdown 2: Puertas
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Puerta de Acceso",
                  ),
                  items:
                      [
                            "Puerta 1: Acceso Vehicular",
                            "Puerta 2: Acceso Peatonal",
                          ]
                          .map(
                            (label) => DropdownMenuItem(
                              value: label,
                              child: Text(label),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),

                // Dropdown 3: Turnos de 8 horas
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Turno de Trabajo",
                  ),
                  items:
                      [
                            "Mañana (06:00 - 14:00)",
                            "Tarde (14:00 - 22:00)",
                            "Noche (22:00 - 06:00)",
                          ]
                          .map(
                            (label) => DropdownMenuItem(
                              value: label,
                              child: Text(label),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 30),

                // Botón de ingreso que navega al Home
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      "Ingresar al Sistema",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
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
