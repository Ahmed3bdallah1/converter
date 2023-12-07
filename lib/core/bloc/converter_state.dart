import 'package:equatable/equatable.dart';

class ConverterState extends Equatable {
  const ConverterState();

  @override
  List<Object> get props => [];
}

class InitialConverterState extends ConverterState {}

class CompletedConversionState extends ConverterState {
  final String number;

  const CompletedConversionState({required this.number});

  @override
  List<Object> get props => [number];
}

class CompletedDecimalConversionState extends ConverterState {
  final String number;

  const CompletedDecimalConversionState({required this.number});

  @override
  List<Object> get props => [number];
}

class ErrorConversionState extends ConverterState {
  final String error;

  const ErrorConversionState({required this.error});

  @override
  List<Object> get props => [error];
}
