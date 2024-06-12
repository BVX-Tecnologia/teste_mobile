
import 'package:flutter/material.dart';
import 'package:teste_dev/src/models/pessoa.dart';

class HomeController{

  ValueNotifier<double> resultado = ValueNotifier<double>(0.0);

  void calcularIMC({String textAltura = "0.0", String textPeso = "0.0"}){
    double altura = double.tryParse(textAltura.replaceAll(",", ".")) ??0.0;
    double peso = double.tryParse(textPeso.replaceAll(",", ".")) ?? 0.0;

    Pessoa pessoa = Pessoa(altura: altura, peso: peso);
    resultado.value = pessoa.valorImc;
  }
}