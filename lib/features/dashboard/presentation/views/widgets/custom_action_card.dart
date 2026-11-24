import 'package:flutter/material.dart';

class CustomActionCard extends StatelessWidget {
  const CustomActionCard({
    super.key,
    required this.color,
    required this.iconColor,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.icon,
  });
  final Color color, iconColor;
  final String title, subTitle;
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: ShapeDecoration(
        color: Color(0xffF8FAFC),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xffE2E8F0), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              decoration: ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(child: Icon(icon, color: iconColor)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 15, color: Color(0xff64748B)),
                ),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(width: 2, color: Color(0xffE2E8F0)),
                ),
              ),
              child: RotatedBox(
                quarterTurns: 2,
                child: Icon(Icons.arrow_back_ios_new, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
