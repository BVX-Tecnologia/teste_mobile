
import 'package:flutter/material.dart';
import 'package:teste_dev/src/models/pessoa.dart';

class HomeController{

  TextEditingController textPeso = TextEditingController();
  TextEditingController textAltura = TextEditingController();

  ValueNotifier<double> resultado = ValueNotifier<double>(0.0);

  void calcularIMC(){
    double altura = double.tryParse(textAltura.text.replaceAll(",", ".")) ??0.0;
    double peso = double.tryParse(textPeso.text.replaceAll(",", ".")) ?? 0.0;

    Pessoa pessoa = Pessoa(altura: altura, peso: peso);
    resultado.value = pessoa.valorImc();
  }
}