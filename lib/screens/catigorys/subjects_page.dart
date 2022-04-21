import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studyapp/core/constants/path_const.dart';
import 'package:studyapp/core/widgets/my_app_bar.dart';

class SubjectsPage extends StatelessWidget {
  SubjectsPage({Key? key}) : super(key: key);

  List<String> subjectsName = [
    "Math",
    "Physics",
    "Arts",
    "Biology",
    "Technology",
    "Economy",
    "English",
    "Geography",
    "Chemical"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context, title: "Subjects"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              semanticChildCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(MyPath.iconPathSubjects[index]),
                    Text(subjectsName[index]),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
