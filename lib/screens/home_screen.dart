import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RiveAnimationController _btnAnimationController;
  String riveAssetName = "assets/star_rating.riv";

  /*
    states that exist in the rive file
    1_star
    2_stars
    3_stars
    4_stars
    5_stars
  */

  animate() {}

  @override
  initState() {
    _btnAnimationController = OneShotAnimation(
      "1_star",
      autoplay: true,
    );
    super.initState();
  }

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
                Expanded(
                  flex: 8,
                  child: RiveAnimation.asset(riveAssetName,
                      controllers: [_btnAnimationController]),
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
