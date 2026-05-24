import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Portería - Aura Residences",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarjeta superior para la asistencia del propio vigilante
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.security,
                  color: Colors.blueAccent,
                  size: 40,
                ),
                title: const Text(
                  "Vigilante: Turno Mañana activo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Ubicación: Puerta 1 Vehicular"),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Salir",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Módulo de accesos rápidos con el Fix de minimumSize aplicado
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Escanear QR",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    icon: const Icon(Icons.person_add, color: Colors.white),
                    label: const Text(
                      "Reg. Manual",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            const Text(
              "VISITANTES DENTRO DEL CONDOMINIO",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 10),

            // Listado de Visitas simulado (ListView + Cards)
            Expanded(
              child: ListView(
                children: [
                  _itemVisita(
                    "Carlos Mendoza",
                    "DNI: 4758XXXX",
                    "Torre B - Dpto 402",
                    "Delivery",
                  ),
                  _itemVisita(
                    "Ana María Delgado",
                    "DNI: 0921XXXX",
                    "Torre A - Dpto 105",
                    "Familiar",
                  ),
                  _itemVisita(
                    "Jorge Luis Prado",
                    "DNI: 7125XXXX",
                    "Torre C - Dpto 603",
                    "Servicio Técnico",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Componente auxiliar para las tarjetas de visitas
  Widget _itemVisita(String nombre, String dni, String destino, String motivo) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("$dni\nDestino: $destino | Motivo: $motivo"),
        isThreeLine: true,
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            "INGRESÓ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
