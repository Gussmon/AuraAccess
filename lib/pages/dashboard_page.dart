import 'package:flutter/material.dart';
// Importamos las páginas para que los vínculos de los botones funcionen
import 'visitor_registry_page.dart';
import 'visitor_list_page.dart';
import 'staff_control_page.dart';
import 'reports_page.dart';

class DashboardPage extends StatelessWidget {
  final String role;

  const DashboardPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AuraAccess - $role'),
        backgroundColor: _getAppBarColor(),
        foregroundColor: Colors.white,
        actions: [
          // Botón para cerrar sesión de forma segura
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Te regresa al Login limpiando el historial de navegación
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabecera adaptada al caso Aura Residences
            const Text(
              '¡Bienvenido de vuelta!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              'Complejo Residencial Aura Residences',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),

            Text(
              'Módulos de Acceso: $role',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // Renderiza ÚNICAMENTE los módulos que corresponden al rol
            ..._buildRoleModules(context),
          ],
        ),
      ),
    );
  }

  // FILTRO ESTRICTO DE ROLES: Separa las funciones por completo
  List<Widget> _buildRoleModules(BuildContext context) {
    final List<Widget> modules = [];

    // 1. CONDICIONAL PARA VIGILANTE
    if (role == 'Vigilante') {
      modules.addAll([
        _buildMenuButton(
          icon: Icons.person_add,
          title: 'Registrar Nuevo Visitante',
          description: 'Reemplazo de bitácora física para Puerta 1 y 2.',
          color: Colors.blue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VisitorRegistryPage(),
              ),
            );
          },
        ),
        _buildMenuButton(
          icon: Icons.qr_code_scanner,
          title: 'Escanear Acceso QR',
          description: 'Validar visitas pre-autorizadas de forma rápida.',
          color: Colors.purple,
          onTap: () {
            // Pendiente: Integración de la cámara / QRScanner
          },
        ),
        _buildMenuButton(
          icon: Icons.view_list,
          title: 'Control de Permanencia',
          description: 'Ver quién está dentro del condominio en tiempo real.',
          color: Colors.orange,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VisitorListPage()),
            );
          },
        ),
      ]);
    }

    // 2. CONDICIONAL PARA ADMINISTRADOR
    if (role == 'Administrador') {
      modules.addAll([
        _buildMenuButton(
          icon: Icons.badge,
          title: 'Control Interno de Personal',
          description: 'Altas de empleados, asignación de sueldos y áreas.',
          color: Colors.teal,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StaffControlPage()),
            );
          },
        ),
        _buildMenuButton(
          icon: Icons.analytics,
          title: 'Reportes Analíticos',
          description: 'Auditoría general de asistencias, tardanzas y faltas.',
          color: Colors.indigo,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReportsPage()),
            );
          },
        ),
        _buildMenuButton(
          icon: Icons.all_inbox,
          title: 'Encomiendas y Deliverys',
          description:
              'Gestión de recepción de paquetes en portería principal.',
          color: Colors.blueGrey,
          onTap: () {
            // Módulo secundario
          },
        ),
      ]);
    }

    // 3. CONDICIONAL PARA RESIDENTE
    if (role == 'Residente') {
      modules.addAll([
        _buildMenuButton(
          icon: Icons.vpn_key,
          title: 'Pre-autorizar Visita (Generar QR)',
          description: 'Crea un acceso rápido para tus invitados.',
          color: Colors.green,
          onTap: () {
            // Módulo de generación de accesos
          },
        ),
        _buildMenuButton(
          icon: Icons.comment,
          title: 'Mis Avisos / Recados',
          description: 'Ver si la administración te dejó una notificación.',
          color: Colors.amber,
          onTap: () {
            // Módulo de mensajería interna
          },
        ),
      ]);
    }

    // Seguridad: Si el rol no coincide con ninguno, muestra un aviso
    if (modules.isEmpty) {
      modules.add(
        const Card(
          color: Colors.redAccent,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Error: Perfil sin módulos asignados.',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return modules;
  }

  // Cambia el color del AppBar según el usuario para mejorar la UX visual
  Color _getAppBarColor() {
    switch (role) {
      case 'Administrador':
        return Colors.teal;
      case 'Vigilante':
        return Colors.blueAccent;
      case 'Residente':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  // Widget plantilla para construir los botones tipo tarjeta de forma limpia
  Widget _buildMenuButton({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            description,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.black26,
        ),
        onTap: onTap,
      ),
    );
  }
}
