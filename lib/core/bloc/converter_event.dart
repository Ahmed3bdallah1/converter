import 'package:equatable/equatable.dart';

class ConversionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BinaryToDecimalEvent extends ConversionEvent {
  final String binaryNumber;

  BinaryToDecimalEvent({required this.binaryNumber});

  @override
  List<Object?> get props => [binaryNumber];
}

class DecimalToBinaryEvent extends ConversionEvent {
  final String decimalNumber;

  DecimalToBinaryEvent({required this.decimalNumber});

  @override
  List<Object?> get props => [decimalNumber];
}
