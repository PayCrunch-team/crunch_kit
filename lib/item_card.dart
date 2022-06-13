import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter/material.dart';

class CrunchItemCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const CrunchItemCard({
    Key? key,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: CrunchColors.superLightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: CrunchDimensions.roundBorderRadius,
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: CrunchDimensions.roundBorderRadius,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CrunchColors.payCrunchBlue,
              CrunchColors.lightBlue,
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(CrunchDimensions.horizontalPadding),
          child: child,
        ),
      ),
    );
  }
}
