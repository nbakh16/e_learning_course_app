import 'package:e_learning_course_app/pages/welcome/block/welcome_blocks.dart';
import 'package:e_learning_course_app/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const ELearningApp()));
}

class ELearningApp extends StatelessWidget {
  const ELearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'E-Learning',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const WelcomePage(),
        ),
      )
    );
  }
}