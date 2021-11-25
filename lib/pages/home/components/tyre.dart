// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:car/models/list_data.dart';
import 'package:car/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    Key? key,
    required this.isBottomTwoTyre,
    required this.tyrePsi,
  }) : super(key: key);

  final bool isBottomTwoTyre;
  final TyrePsi tyrePsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color:
            tyrePsi.isLowPressure ? redColor.withOpacity(0.1) : Colors.white10,
        border: Border.all(
            color: tyrePsi.isLowPressure ? redColor : primaryColor, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: isBottomTwoTyre
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lowPressureText(context),
                Spacer(),
                psiText(context, psi: tyrePsi.psi.toString()),
                const SizedBox(height: defaultPadding),
                Text(
                  "${tyrePsi.temp}\u2103",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                psiText(context, psi: tyrePsi.psi.toString()),
                const SizedBox(height: defaultPadding),
                Text(
                  "${tyrePsi.temp}\u2103",
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                lowPressureText(context),
              ],
            ),
    );
  }

  Column lowPressureText(BuildContext context) {
    return Column(
      children: [
        Text(
          "Low".toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          "Pressure".toUpperCase(),
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Text psiText(BuildContext context, {required String psi}) {
    return Text.rich(
      TextSpan(
        text: psi,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
        children: [
          TextSpan(
            text: "psi",
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}

List<Widget> tyres(BoxConstraints constrains) {
  return [
    Positioned(
      left: constrains.maxWidth * 0.2,
      top: constrains.maxHeight * 0.22,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      right: constrains.maxWidth * 0.2,
      top: constrains.maxHeight * 0.22,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      right: constrains.maxWidth * 0.2,
      top: constrains.maxHeight * 0.63,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      left: constrains.maxWidth * 0.2,
      top: constrains.maxHeight * 0.63,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
  ];
}
