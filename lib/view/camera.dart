import 'package:flutter/material.dart';
import 'package:hush_day/view/example.dart';
// import 'package:m7_livelyness_detection_example/index.dart';



class CamerCheck extends StatefulWidget {
  const CamerCheck({super.key});

  @override
  State<CamerCheck> createState() => _CamerCheckState();
}

class _CamerCheckState extends State<CamerCheck> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            M7ExpampleScreen(),
          ],
        ),
      )
    );
  }
}