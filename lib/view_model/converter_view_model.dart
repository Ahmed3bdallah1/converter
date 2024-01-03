import 'package:converter_app/core/bloc/converter_bloc.dart';
import 'package:flutter/cupertino.dart';
import '../core/bloc/converter_event.dart';

class ConverterViewModel extends ChangeNotifier {
  final ConverterBloc converterBloc;


  ConverterViewModel(this.converterBloc);

  String _convertedNumber = '';

  String get convertedNumber => _convertedNumber;

  Future<void> binaryToDecimalConverter(String binaryNumber) async {
    converterBloc.add(BinaryToDecimalEvent(binaryNumber: binaryNumber));
  }

  Future<void> decimalToBinaryConverter(String decimalNumber) async {
    converterBloc.add(DecimalToBinaryEvent(decimalNumber: decimalNumber));
  }

  void putConvertedNumber(String number) {
    _convertedNumber = number;
    notifyListeners();
  }
}
