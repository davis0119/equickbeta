import 'package:easy_quick/pages/landingpage.dart';
import 'package:easy_quick/services/auth.dart';
import 'package:easy_quick/theme.dart';
import 'package:easy_quick/widgets/loading.dart';
import 'package:easy_quick/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:provider/provider.dart';

import 'Models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);

  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get('isLightTheme') ?? false;

  print(isLightTheme);

  runApp(ChangeNotifierProvider(
      create: (_) => ThemeProvider(isLightTheme: isLightTheme),
      child: AppStart(),
  ));
}

// to ensure we have the themeProvider before the app starts lets make a few more changes
class AppStart extends StatelessWidget {
  const AppStart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return FutureBuilder(
      future: Firebase.initializeApp(),
        builder: (context, snapshot) {
        // Check for errors
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp(themeProvider: themeProvider,);
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Loading();
        },
        //child: MyApp(themeProvider: themeProvider,),
    );
  }
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;

  const MyApp({Key key, @required this.themeProvider}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user, // listening to AuthService stream
      child: MaterialApp(
        home: Wrapper(), // Decides whether we go to authenticate first or explore page
        debugShowCheckedModeBanner: false,
        theme: widget.themeProvider.themeData(context),
      ),
    );
  }
}

// ThemeData(
//         textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
//       ),
