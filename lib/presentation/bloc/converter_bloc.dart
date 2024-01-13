import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'converter_event.dart';
import 'converter_state.dart';

class ConverterBloc extends Bloc<ConversionEvent, ConverterState> {
  ConverterBloc() : super(InitialConverterState()) {
    on<BinaryToDecimalEvent>(_mapConvertBinaryToDecimalToState);
    on<DecimalToBinaryEvent>(_mapConvertDecimalToBinaryToState);
  }

  static ConverterBloc get(BuildContext context) => BlocProvider.of(context);

  void _mapConvertBinaryToDecimalToState(
      BinaryToDecimalEvent event, Emitter<ConverterState> emit) {
    try {
      final decimalNumber = int.parse(event.binaryNumber, radix: 2);
      emit(CompletedConversionState(number: decimalNumber.toString()));
    } catch (e) {
      emit(const ErrorConversionState(error: 'Invalid binary number'));
    }
  }

  void _mapConvertDecimalToBinaryToState(
      DecimalToBinaryEvent event, Emitter<ConverterState> emit) {
    try {
      final binaryNumber = int.parse(event.decimalNumber).toRadixString(2);
      emit(CompletedConversionState(number: binaryNumber));
    } catch (e) {
      emit(const ErrorConversionState(error: 'Invalid decimal number'));
    }
  }
}
