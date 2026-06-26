import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores para los campos de texto
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Variables de selección operativa
  String? selectedRol = 'Vigilante';
  String? selectedPuerta = 'Puerta 1 (Vehicular)';
  String? selectedTurno = 'Mañana';

  // Variable para ocultar/mostrar contraseña
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tomamos el color principal del tema configurado en main.dart
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo o Icono de la App
                Icon(Icons.lock_person_rounded, size: 80, color: primaryColor),
                const SizedBox(height: 15),

                // Título
                Text(
                  'AuraAccess',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: primaryColor,
                    letterSpacing: 1.2,
                  ),
                ),
                const Text(
                  'Control de Accesos y Registro',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                // 1. Campo: Usuario / Correo
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Usuario o Correo',
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 2. Campo: Contraseña
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 3. Selector de Rol
                DropdownButtonFormField<String>(
                  value: selectedRol,
                  decoration: InputDecoration(
                    labelText: 'Seleccione su Rol',
                    prefixIcon: const Icon(Icons.badge_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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

                // 4. Selector de Puerta (Condicional)
                if (selectedRol == 'Vigilante' ||
                    selectedRol == 'Administrador') ...[
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedPuerta,
                    decoration: InputDecoration(
                      labelText: 'Ubicación / Puerta',
                      prefixIcon: const Icon(Icons.door_sliding_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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

                // 5. Selector de Turno (Condicional)
                if (selectedRol == 'Vigilante' ||
                    selectedRol == 'Administrador') ...[
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedTurno,
                    decoration: InputDecoration(
                      labelText: 'Turno de Trabajo',
                      prefixIcon: const Icon(Icons.schedule),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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

                const SizedBox(height: 35),

                // Botón de Ingreso Estilizado
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    // Aquí puedes añadir validaciones básicas en el futuro
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
