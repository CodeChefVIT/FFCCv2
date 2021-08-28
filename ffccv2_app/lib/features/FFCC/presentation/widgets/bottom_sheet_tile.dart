import 'package:ffccv2_app/constants/colors.dart';
import 'package:flutter/material.dart';

class BottomSheetTextFieldTile extends StatelessWidget {
  final int? index;
  const BottomSheetTextFieldTile({
    Key? key,
    required this.size,
    this.index,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        height: 58,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              width: 20,
              child: Text(
                (index! + 1).toString() + '.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: size.width * .6,
              padding: const EdgeInsets.all(5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.top,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: KColor.accentColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: KColor.accentColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: KColor.accentColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 20,
              child: Icon(Icons.check_circle_outline, color: Colors.green),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
