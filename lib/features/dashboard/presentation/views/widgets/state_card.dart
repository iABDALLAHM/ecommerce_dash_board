import 'package:flutter/material.dart';

class StateCard extends StatelessWidget {
  const StateCard({
    super.key,
    required this.borderColor,
    required this.cardColor,
    required this.title,
    required this.stateIcon,
    required this.iconBackgroundColor,
    required this.subTitle, required this.onTap,
  });
  final Color borderColor, cardColor, iconBackgroundColor;
  final String title, subTitle;
  final Widget stateIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: borderColor),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(color: Color(0xff64748B))),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: iconBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: stateIcon,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
