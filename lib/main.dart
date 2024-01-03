import 'package:converter_app/core/bloc/converter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/converter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConverterBloc>(
          create: (BuildContext context) => ConverterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Converter app',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: ConverterPage(),
      ),
    );
  }
}
