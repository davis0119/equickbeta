import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:easy_quick/theme.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      color: themeProvider.themeData(context).backgroundColor,
      child: Center(
        child: SpinKitChasingDots(
          color: themeProvider.themeMode().gradient[3],
          size: 50.0,
        ),
      ),
    );
  }
}
