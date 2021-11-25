// ignore_for_file: prefer_const_constructors

import 'package:car/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({Key? key, this.isLock, this.press}) : super(key: key);
  final VoidCallback? press;
  final bool? isLock;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedSwitcher(
        duration: defaultDuration,
        switchInCurve: Curves.easeInOutBack,
        // chuyển động phân con vào trong (kiểu chuyển động)
        transitionBuilder: (child, animetion) => ScaleTransition(
          scale: animetion,
          child: child,
        ),
        child: isLock!
            ? SvgPicture.asset(
                "assets/icons/door_lock.svg",
                key: ValueKey("lock"),
              )
            : SvgPicture.asset(
                "assets/icons/door_unlock.svg",
                key: ValueKey("unlock"),
              ),
      ),
    );
  }
}
