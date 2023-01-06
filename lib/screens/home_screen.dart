import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  animate() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SizedBox(
            height: 600,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                const Expanded(
                  flex: 8,
                  child: RiveAnimation.asset("assets/star_rating.riv"),
                ),
                const SizedBox(height: 20),
                TextButton(onPressed: animate, child: const Text("Animate"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
