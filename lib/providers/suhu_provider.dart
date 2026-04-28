import 'package:flutter/material.dart';

class SuhuProvider extends ChangeNotifier {

  String satuan = "Celcius";

  double celcius = 0;
  double fahrenheit = 0;
  double kelvin = 0;
  double reamur = 0;

  void setSatuan(String value) {
    satuan = value;
    notifyListeners();
  }

  void konversi(String inputText) {

    double input = double.tryParse(inputText) ?? 0;

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

    notifyListeners();
  }
}