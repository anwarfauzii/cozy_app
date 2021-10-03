import 'package:cozy_app/theme.dart';
import 'package:flutter/cupertino.dart';

class BottomNavbarItem extends StatelessWidget {
  final String? imageUrl;
  final bool isActive;

  BottomNavbarItem({this.imageUrl, this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          '$imageUrl',
          width: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purplecolor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(1000)),
                ),
              )
            : Container(),
      ],
    );
  }
}
