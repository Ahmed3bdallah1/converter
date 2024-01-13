import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/converter_view_model.dart';
import '../bloc/converter_bloc.dart';
import '../bloc/converter_state.dart';

class ConverterPage extends StatelessWidget {
  final _binaryNumberController = TextEditingController();
  final _decimalNumberController = TextEditingController();

  ConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final viewModel = ConverterViewModel(ConverterBloc.get(context));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                  width: width * .4,
                  child: TextField(
                    controller: _binaryNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Binary Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: width * .4,
                  child: TextField(
                    controller: _decimalNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Decimal Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final binaryNumber = _binaryNumberController.text;
                final decimalNumber = _decimalNumberController.text;
                if (decimalNumber.isEmpty && binaryNumber.isEmpty) {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text("invalid"),
                          content: const Text(
                              "please make sure that you are putting a number"),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text("ok"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                } else if (binaryNumber.isNotEmpty) {
                  await viewModel.binaryToDecimalConverter(binaryNumber);
                } else if (decimalNumber.isNotEmpty) {
                  await viewModel.decimalToBinaryConverter(decimalNumber);
                }
              },
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<ConverterBloc, ConverterState>(
              builder: (context, state) {
                if (state is CompletedConversionState) {
                  viewModel.putConvertedNumber(state.number);
                } else if (state is ErrorConversionState) {
                  viewModel.putConvertedNumber(state.error);
                }
                return Text(
                    "the converted number is: ${viewModel.convertedNumber}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
