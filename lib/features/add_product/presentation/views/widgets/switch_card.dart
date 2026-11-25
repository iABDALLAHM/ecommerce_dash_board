import 'package:flutter/material.dart';

class SwitchCard extends StatefulWidget {
  const SwitchCard({super.key, required this.onChange});
  final Function(bool) onChange;
  @override
  State<SwitchCard> createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xffD1FAE5)),
        color: Color(0xffECFDF5),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("منتج عضوي 100%؟"),
              const SizedBox(height: 6),
              Text("بدون مبيدات أو مواد كيميائية"),
            ],
          ),
          Spacer(),
          Switch(
            activeTrackColor: Color(0xff059669),
            value: switchValue,
            onChanged: (value) {
              switchValue = !switchValue;
              widget.onChange(switchValue);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
