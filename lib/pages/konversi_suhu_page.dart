import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/suhu_provider.dart';

class KonversiSuhuPage extends StatelessWidget {

  KonversiSuhuPage({super.key});

  final TextEditingController suhuController = TextEditingController();

  Widget hasilCard(String judul, double nilai) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.thermostat),
        title: Text(judul),
        trailing: Text(
          nilai.toStringAsFixed(2),
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final suhu = Provider.of<SuhuProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Konversi Suhu"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Icon(Icons.thermostat,
                size: 80, color: Colors.orange),

            const SizedBox(height: 20),

            TextField(
              controller: suhuController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Suhu",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField(
              value: suhu.satuan,
              items: const [
                DropdownMenuItem(value: "Celcius", child: Text("Celcius")),
                DropdownMenuItem(value: "Fahrenheit", child: Text("Fahrenheit")),
                DropdownMenuItem(value: "Kelvin", child: Text("Kelvin")),
                DropdownMenuItem(value: "Reamur", child: Text("Reamur")),
              ],
              onChanged: (value) {
                suhu.setSatuan(value!);
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                suhu.konversi(suhuController.text);
              },
              icon: const Icon(Icons.calculate),
              label: const Text("Konversi"),
            ),

            const SizedBox(height: 20),

            hasilCard("Celcius", suhu.celcius),
            hasilCard("Fahrenheit", suhu.fahrenheit),
            hasilCard("Kelvin", suhu.kelvin),
            hasilCard("Reamur", suhu.reamur),
          ],
        ),
      ),
    );
  }
}