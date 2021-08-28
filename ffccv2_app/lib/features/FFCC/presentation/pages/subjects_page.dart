import 'package:ffccv2_app/constants/colors.dart';
import 'package:ffccv2_app/constants/strings.dart';
import 'package:ffccv2_app/features/FFCC/presentation/pages/teachers_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SubjectPage extends StatefulWidget {
  static const String routeName = '/subjectsPage';
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  static List<String?> friendsList = [null];

  @override
  void dispose() {
    super.dispose();
  }

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
                      kbooksPath,
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
                          'CHOOSE',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          'SUBJECTS',
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Enter subjects :',
                      style: TextStyle(
                          fontSize: 20,
                          color: KColor.secondayColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: size.height * .48,
                      child: ListView(
                        children: [
                          ..._getSubjects(),
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
                            print(friendsList);
                            Get.toNamed(TeachersPage.routeName);
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getSubjects() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < friendsList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: SubjectsTextFields(i)),
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

class SubjectsTextFields extends StatefulWidget {
  final int index;
  SubjectsTextFields(this.index);
  @override
  _SubjectsTextFieldsState createState() => _SubjectsTextFieldsState();
}

class _SubjectsTextFieldsState extends State<SubjectsTextFields> {
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
      _nameController!.text = _SubjectPageState.friendsList[widget.index] ?? '';
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
        onChanged: (v) => _SubjectPageState.friendsList[widget.index] = v,
        validator: (v) {
          if (v!.trim().isEmpty) return 'Please enter something';
          return null;
        },
      ),
    );
  }
}
