import 'package:flutter/material.dart';

class ImcButton extends StatelessWidget {
  final void Function()? onPressed;
  const ImcButton({ Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed, 
        child: const Text("CALCULAR")),
    );
  }
}