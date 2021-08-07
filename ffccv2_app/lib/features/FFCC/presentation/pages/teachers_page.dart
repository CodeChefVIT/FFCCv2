import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/constants/strings.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/time_table_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TeachersPage extends StatefulWidget {
  static const String routeName = '/teachersPage';
  @override
  _TeachersPageState createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  final _formKey = GlobalKey<FormState>();
  static List<String?> friendsList = [null];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * .3,
                  color: KColor.primaryColor,
                ),
                Container(
                  height: size.height * .7,
                  color: KColor.lightSkyBlue,
                ),
              ],
            ),
            Positioned(
              top: size.height * .17,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      kTeacherPath,
                      height: 80,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SUBJECT',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          'TEACHERS',
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * .35,
              right: 1,
              left: 1,
              child: Column(
                children: [
                  Text(
                    'Enter teachers name :',
                    style: TextStyle(
                        fontSize: 20,
                        color: KColor.secondayColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: size.height * .48,
                    child: ListView(
                      children: [
                        ..._getTeachers(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: MaterialButton(
                        color: KColor.primaryColor,
                        onPressed: () {
                          //Get.toNamed(TimeTablePage.routeName);
                          Get.toNamed(TimeTablePage.routeName);
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                        },
                        child: Text(
                          'Enter',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getTeachers() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < friendsList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: TeachersTextFields(i)),
            SizedBox(
              width: 16,
            ),
            _addRemoveButton(i == friendsList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  Widget _addRemoveButton(bool add, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          if (add) {
            friendsList.insert(0, null);
          } else
            friendsList.removeAt(index);
          setState(() {});
        },
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: (add) ? KColor.primaryColor : Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            (add) ? Icons.add : Icons.remove,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class TeachersTextFields extends StatefulWidget {
  final int index;
  TeachersTextFields(this.index);
  @override
  _TeachersTextFieldsState createState() => _TeachersTextFieldsState();
}

class _TeachersTextFieldsState extends State<TeachersTextFields> {
  TextEditingController? _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _nameController!.text = _TeachersPageState.friendsList[widget.index] ?? '';
    });

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.3,
            ),
          ),
        ),
        onChanged: (v) => _TeachersPageState.friendsList[widget.index] = v,
        validator: (v) {
          if (v!.trim().isEmpty) return 'Please enter something';
          return null;
        },
      ),
    );
  }
}
