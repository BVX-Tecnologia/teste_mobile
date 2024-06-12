
import 'package:flutter/material.dart';
import 'package:teste_dev/src/controller/home_controller.dart';
import 'package:teste_dev/src/widgets/imc_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  TextEditingController textPeso = TextEditingController();
  TextEditingController textAltura = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textPeso.dispose();
    textAltura.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcular IMC"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Digite seu peso em Kg:',
              ),
              TextField(
                controller: textPeso,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText:"exemplo: 75,6",
                  border: OutlineInputBorder() 
                ),
              ),
               const Text(
                'Digite sua altura em metros:',
              ),
              TextField(
                controller: textAltura,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText:"exemplo: 1,80",
                  border: OutlineInputBorder() 
                ),
              ),
              const SizedBox(height: 16,),
              ImcButton(
                onPressed: ()=> controller.calcularIMC(textAltura: textAltura.text, textPeso: textPeso.text),
              ),
              const SizedBox(height: 20,),
              ValueListenableBuilder<double>(
                valueListenable: controller.resultado, 
                builder: (context, value, child){
                  return Text(
                    "VALOR: ${value.toStringAsFixed(2).replaceAll(".", ",")}",
                    style: const TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
