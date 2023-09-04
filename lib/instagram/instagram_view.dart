import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/instagram2/instagram.dart';

import '../state/bottom_now_bar_cubit.dart';

class instagram extends StatelessWidget {
  const instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: BlocProvider(
          create: (context) => BottomNowBarCubit(), child: instagram2()),
    );
  }
}
