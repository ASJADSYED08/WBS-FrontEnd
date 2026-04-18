import 'package:flutter/material.dart';
import 'package:ned_project/splash_screen.dart';
import 'export_alll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            bottomSheetTheme:
                const BottomSheetThemeData(backgroundColor: Colors.transparent),
            useMaterial3: true,
            fontFamily: "Inria Serif",
            textSelectionTheme: TextSelectionThemeData(
              // selectionHandleColor: Colors.amber,
              cursorColor: Colors.black,
            ),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
