import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_project/bloc/guide_bloc.dart';
import 'package:http/http.dart' as http;

import 'guide_list.dart';

void main() {
  BlocOverrides.runZoned(
        () => runApp(TestApp()),
//    blocObserver: SimpleBlocObserver(),
  );;
}

class TestApp extends MaterialApp {
  TestApp() : super(home: GuidePage());
}

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guides List'), backgroundColor: Colors.blueGrey,),
      backgroundColor: Colors.blueGrey,
      body: BlocProvider(
        create: (_) => GuideBloc(httpClient: http.Client())..add(GuideLoader()),
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: GuideList(),
        ),
      ),
    );
  }
}