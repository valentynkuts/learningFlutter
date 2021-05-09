import 'package:col_row_stack/page/row_page.dart';
import 'package:col_row_stack/page/stack_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:col_row_stack/page/column_page.dart';
import 'package:col_row_stack/widget_col/examples_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Column';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.teal),
        home: PageView(children: [
          RowColumnPage(),
          RowPage(),
          StackPage()
        ]),
        //home: RowColumnPage(),
        // home: ExamplesWidget(),
      );
}
