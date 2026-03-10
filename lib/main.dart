import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const KonversiSuhuPage(),
    );
  }
}

class KonversiSuhuPage extends StatefulWidget {
  const KonversiSuhuPage({super.key});

  @override
  State<KonversiSuhuPage> createState() => _KonversiSuhuPageState();
}

class _KonversiSuhuPageState extends State<KonversiSuhuPage> {

  final TextEditingController suhuController = TextEditingController();
  String satuan = "Celcius";

  double celcius = 0;
  double fahrenheit = 0;
  double kelvin = 0;
  double reamur = 0;

  void konversi() {

    double input = double.tryParse(suhuController.text) ?? 0;

    setState(() {

      if (satuan == "Celcius") {
        celcius = input;
        fahrenheit = (input * 9 / 5) + 32;
        kelvin = input + 273.15;
        reamur = input * 4 / 5;
      }

      if (satuan == "Fahrenheit") {
        celcius = (input - 32) * 5 / 9;
        fahrenheit = input;
        kelvin = celcius + 273.15;
        reamur = celcius * 4 / 5;
      }

      if (satuan == "Kelvin") {
        celcius = input - 273.15;
        fahrenheit = (celcius * 9 / 5) + 32;
        kelvin = input;
        reamur = celcius * 4 / 5;
      }

      if (satuan == "Reamur") {
        celcius = input * 5 / 4;
        fahrenheit = (celcius * 9 / 5) + 32;
        kelvin = celcius + 273.15;
        reamur = input;
      }

    });
  }

  Widget hasilCard(String judul, double nilai) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: const Icon(Icons.thermostat),
        title: Text(judul),
        trailing: Text(
          nilai.toStringAsFixed(2),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Konversi Suhu"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Icon(
              Icons.thermostat,
              size: 80,
              color: Colors.orange,
            ),

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
              value: satuan,
              items: const [
                DropdownMenuItem(value: "Celcius", child: Text("Celcius")),
                DropdownMenuItem(value: "Fahrenheit", child: Text("Fahrenheit")),
                DropdownMenuItem(value: "Kelvin", child: Text("Kelvin")),
                DropdownMenuItem(value: "Reamur", child: Text("Reamur")),
              ],
              onChanged: (value) {
                setState(() {
                  satuan = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: "Pilih Satuan",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: konversi,
              icon: const Icon(Icons.calculate),
              label: const Text("Konversi"),
            ),

            const SizedBox(height: 20),

            hasilCard("Celcius", celcius),
            hasilCard("Fahrenheit", fahrenheit),
            hasilCard("Kelvin", kelvin),
            hasilCard("Reamur", reamur),
          ],
        ),
      ),
    );
  }
}