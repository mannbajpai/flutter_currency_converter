import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white12,
        width: 2.5,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
      borderRadius: BorderRadius.circular(15),
    );

    return Scaffold(
        backgroundColor: const Color.fromRGBO(24, 24, 24, 0.85),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(60, 60, 60, 1),
          elevation: 0,
          centerTitle: true,
          title: const Text("Currency Convertor"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${result.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter the amount in USD",
                    hintStyle: const TextStyle(
                      color: Colors.white60,
                    ),
                    prefixIcon: const Icon(Icons.monetization_on_outlined),
                    prefixIconColor: Colors.white60,
                    filled: true,
                    fillColor: Colors.white30,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(12),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        result = double.parse(textEditingController.text) * 81;
                      });
                    },
                    style: TextButton.styleFrom(
                      elevation: 10,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black26,
                      minimumSize: const Size(double.infinity, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: const Text("Convert")),
              )
            ],
          ),
        ));
  }
}
