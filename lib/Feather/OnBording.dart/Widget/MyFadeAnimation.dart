// for animation
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/OnBording.dart/Widget/MyFadeAnimationState.dart';

class MyFadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  const MyFadeAnimation({
    super.key,
    required this.delay,
    required this.child,
  });

  @override
  State<MyFadeAnimation> createState() => MyFadeAnimationState();
}
