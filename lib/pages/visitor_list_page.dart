import 'package:flutter/material.dart';
import '../widgets/visitor_card.dart'; // Importamos tu widget personalizado

class VisitorListPage extends StatelessWidget {
  const VisitorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Permanencia'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          Padding(
            // Dejamos un solo padding limpio para todo el texto
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Visitantes Activos Actualmente',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          // Lista de prueba estática para simular los ingresos
          VisitorCard(
            name: 'Gustavo Alonso Condor Llanos',
            dni: '75397016',
            department: 'Torre A - 302',
            status: 'Ingresó',
          ),
          VisitorCard(
            name: 'Edy Santiago',
            dni: '45678912',
            department: 'Torre B - 104',
            status: 'Ingresó',
          ),
          VisitorCard(
            name: 'Danilo Alva',
            dni: '09876543',
            department: 'Torre C (Mantenimiento)',
            status: 'Salió',
          ),
        ],
      ),
    );
  }
}
