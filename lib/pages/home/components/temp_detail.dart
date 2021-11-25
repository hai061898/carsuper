// ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation

import 'package:car/controllers/home_controller.dart';
import 'package:car/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempBtn(
                  isActive: _controller.isCoolSelected,
                  svgSrc: "assets/icons/coolShape.svg",
                  title: "Cool",
                  press: _controller.updateCoolSelectedTab,
                ),
                const SizedBox(width: defaultPadding),
                TempBtn(
                  isActive: !_controller.isCoolSelected,
                  svgSrc: "assets/icons/heatShape.svg",
                  title: "Heat",
                  activeColor: redColor,
                  press: _controller.updateCoolSelectedTab,
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.arrow_drop_up, size: 48),
              ),
              Text(
                "29" + "\u2103",
                style: TextStyle(fontSize: 86),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.arrow_drop_down, size: 48),
              ),
            ],
          ),
          Spacer(),
          Text("CURRENT TEMPERATURE"),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inside".toUpperCase(),
                  ),
                  Text(
                    "20" + "\u2103",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inside".toUpperCase(),
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text(
                    "35" + "\u2103",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white54),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TempBtn extends StatelessWidget {
  const TempBtn({
    Key? key,
    required this.svgSrc,
    required this.title,
    this.isActive = false, 
    required this.press,
    this.activeColor = primaryColor,
  }) : super(key: key);

  final String svgSrc, title;
  final bool isActive;
  final VoidCallback press;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutBack, // cách hoạt động 
            height: isActive ? 76 : 50,
            width: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgSrc,
              color: isActive ? activeColor : Colors.white38,
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 16,
              color: isActive ? activeColor : Colors.white38,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(
              title.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}