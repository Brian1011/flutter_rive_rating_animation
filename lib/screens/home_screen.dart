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
  int stateCount = 0;
  String currentState = "1_star";

  Map<int, String> allStates = {
    0: "1_star",
    1: "2_stars",
    2: "3_stars",
    3: "4_stars",
    4: "5_stars",
  };

  animate() {
    changeStateCount();
  }

  changeStateCount() {
    setState(() {
      if (stateCount < 4) {
        stateCount++;
      } else {
        stateCount = 0;
      }
      currentState = allStates[stateCount]!;
      updateAnimationController();
    });
  }

  updateAnimationController() {
    _btnAnimationController = OneShotAnimation(
      currentState,
    );
  }

  @override
  initState() {
    _btnAnimationController = OneShotAnimation(
      currentState,
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
