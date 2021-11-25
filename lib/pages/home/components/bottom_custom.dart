import 'package:car/models/list_data.dart';
import 'package:car/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomCustom extends StatelessWidget {
  const BottomCustom({Key? key, this.onTap, this.selectedTab})
      : super(key: key);

  final int? selectedTab;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedTab!,
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        navIconSrc.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            navIconSrc[index],
            color: index == selectedTab ? primaryColor : Colors.white54,
          ),
          label: "",
        ),
      ),
    );
  }
}
