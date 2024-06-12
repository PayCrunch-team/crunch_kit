import 'package:crunch_kit/crunch_kit.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sizer/sizer.dart';

class CrunchOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CrunchOutlineButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: 100.w - (CrunchDimensions.horizontalPadding * 2),
      child: OutlinedButton(
        onPressed: () {
          onPressed();
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: CrunchColors.whiteW3, width: 2),
        ),
        child: Text(
          text,
          style: CrunchTextStyles.titleSmallWhite,
        ),
      ),
    );
  }
}
