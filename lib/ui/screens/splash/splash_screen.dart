import 'package:bridge_software_task/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double scale = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then((_) async {
      setState(() => scale = 2);

      await Future.delayed(const Duration(seconds: 2));
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomeScreen(),
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (_, anim, __, child) => FadeTransition(
              opacity: anim,
              child: child,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(seconds: 1),
          child: Logo(
            size: 70.h,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
