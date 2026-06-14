import 'package:flutter/material.dart';

class VisitorCard extends StatelessWidget {
  final String name;
  final String dni;
  final String department;
  final String status; // Ej: 'Ingresó' o 'Salió'

  const VisitorCard({
    super.key,
    required this.name,
    required this.dni,
    required this.department,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    // Lógica rápida para el color del estado
    final Color statusColor = status == 'Ingresó' ? Colors.green : Colors.red;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(Icons.person, color: Colors.grey[600]),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DNI: $dni'),
            Text(
              'Dep: $department',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
