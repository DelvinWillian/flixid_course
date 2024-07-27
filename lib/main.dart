import 'package:firebase_core/firebase_core.dart';
import 'package:flixid_course/firebase_options.dart';
import 'package:flixid_course/presentation/misc/constants.dart';
import 'package:flixid_course/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: saffron,
              surface: backgroundColor,
              brightness: Brightness.dark),
          useMaterial3: true,
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.poppins(color: ghostWhite),
            bodyLarge: GoogleFonts.poppins(color: ghostWhite),
            labelLarge: GoogleFonts.poppins(color: ghostWhite),
          )),
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
