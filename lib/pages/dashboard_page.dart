import 'qr_scanner_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart'; // Importamos la página de login para el logout seguro
import 'visitor_registry_page.dart';
import 'visitor_list_page.dart';
import 'staff_control_page.dart';
import 'reports_page.dart';


class DashboardPage extends StatelessWidget {
  final String role;

  const DashboardPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final themeColor = _getAppBarColor();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AuraAccess - $role',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: themeColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Cerrar Sesión',
            onPressed: () {
              // Corrección: Te regresa al Login limpiando de verdad TODO el historial
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabecera estilizada
            const Text(
              '¡Bienvenido de vuelta!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 4),
            Text(
              'Complejo Residencial Aura Residences',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),

            Row(
              children: [
                Icon(Icons.layers_outlined, color: themeColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Módulos de Acceso:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Renderiza ÚNICAMENTE los módulos que corresponden al rol
            ..._buildRoleModules(context),
          ],
        ),
      ),
    );
  }

  // FILTRO ESTRICTO DE ROLES
  List<Widget> _buildRoleModules(BuildContext context) {
    final List<Widget> modules = [];

    // 1. CONDICIONAL PARA VIGILANTE
    if (role == 'Vigilante') {
      modules.addAll([
        _buildMenuButton(
          icon: Icons.person_add_alt_1_rounded,
          title: 'Registrar Nuevo Visitante',
          description: 'Reemplazo de bitácora física para Puerta 1 y 2.',
          color: Colors.blue[700]!,
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
            // Navegación directa hacia el escáner
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QrScannerPage(),
              ),
            );
          },
        ),
        _buildMenuButton(
          icon: Icons.assignment_turned_in_rounded,
          title: 'Control de Permanencia',
          description: 'Ver quién está dentro del condominio en tiempo real.',
          color: Colors.orange[700]!,
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
          icon: Icons.badge_outlined,
          title: 'Control Interno de Personal',
          description: 'Altas de empleados, asignación de sueldos y áreas.',
          color: Colors.teal[700]!,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StaffControlPage()),
            );
          },
        ),
        _buildMenuButton(
          icon: Icons.analytics_outlined,
          title: 'Reportes Analíticos',
          description: 'Auditoría general de asistencias, tardanzas y faltas.',
          color: Colors.indigo[700]!,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReportsPage()),
            );
          },
        ),
        _buildMenuButton(
          icon: Icons.all_inbox_rounded,
          title: 'Encomiendas y Deliverys',
          description:
              'Gestión de recepción de paquetes en portería principal.',
          color: Colors.blueGrey[700]!,
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
          icon: Icons.vpn_key_outlined,
          title: 'Pre-autorizar Visita (Generar QR)',
          description: 'Crea un acceso rápido para tus invitados.',
          color: Colors.green[700]!,
          onTap: () {
            // Módulo de generación de accesos
          },
        ),
        _buildMenuButton(
          icon: Icons.maps_home_work_outlined,
          title: 'Mis Avisos / Recados',
          description: 'Ver si la administración te dejó una notificación.',
          color: Colors.amber[800]!,
          onTap: () {
            // Módulo de mensajería interna
          },
        ),
      ]);
    }

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

  Color _getAppBarColor() {
    switch (role) {
      case 'Administrador':
        return Colors.teal[600]!;
      case 'Vigilante':
        return Colors.blue[600]!;
      case 'Residente':
        return Colors.green[600]!;
      default:
        return Colors.grey[600]!;
    }
  }

  Widget _buildMenuButton({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0, // Tarjetas planas y modernas
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.grey[200]!,
          width: 1,
        ), // Sutil borde gris
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: -0.2,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.2,
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
          color: Colors.grey[400],
        ),
        onTap: onTap,
      ),
    );
  }
}