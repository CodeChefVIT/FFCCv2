import 'package:ffccv2_app/features/FFCC/presentation/widgets/bottom_sheet_tile.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    required this.controller,
    this.title,
  }) : super(key: key);
  final String? title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              padding: const EdgeInsets.all(5),
              child: Text(
                title!,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
                height: size.height * .5,
                // color: Colors.white,
                child: ListView.builder(
                    itemCount: int.parse(controller.text),
                    itemBuilder: (context, index) {
                      return BottomSheetTextFieldTile(
                        size: size,
                        index: index,
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
