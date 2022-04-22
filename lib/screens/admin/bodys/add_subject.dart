import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/core/widgets/input/input_user_name.dart';
import 'package:studyapp/providers/admin_catigory_provider.dart';

class AddSubject extends StatelessWidget {
  AddSubject({Key? key}) : super(key: key);

  TextEditingController subjectName = TextEditingController();
  TextEditingController subjectInfo = TextEditingController();
  TextEditingController subjectPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Chip(
                    backgroundColor: context
                                .watch<AdminPanelCatigory>()
                                .catigoryController ==
                            0
                        ? ColorConst.kPrimaryColor
                        : ColorConst.kPrimaryColor100,
                    elevation: 0,
                    label: const Text(
                      "Add subject",
                    ),
                  ),
                  onTap: () {
                    context.read<AdminPanelCatigory>().adminPanelCatigory(0);
                  },
                ),
                SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    color: ColorConst.kBlack,
                  ),
                ),
                GestureDetector(
                  child: Chip(
                    backgroundColor: context
                                .watch<AdminPanelCatigory>()
                                .catigoryController ==
                            1
                        ? ColorConst.kPrimaryColor
                        : ColorConst.kPrimaryColor100,
                    elevation: 0,
                    label: const Text(
                      "Add a textbook",
                    ),
                  ),
                  onTap: () {
                    context.read<AdminPanelCatigory>().adminPanelCatigory(1);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: FontConst.kExtraLargeFont),
          InputUserName(
            title: 'Subject name',
            hintText: 'Name',
            controller: subjectName,
          ),
          InputUserName(
            title: 'Info course',
            hintText: 'Info',
            controller: subjectName,
          ),
          InputUserName(
            title: 'Course price',
            hintText: 'Price',
            controller: subjectName,
          ),
          SizedBox(
            height: FontConst.kExtraLargeFont,
          ),
          ElevatedButton(
            child: Text(
              "Upload",
              style: TextStyle(
                fontSize: FontConst.kLargeFont,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  FontConst.kMediumFont,
                ),
              ),
              fixedSize: Size(
                MediaQuery.of(context).size.width * 0.7,
                MediaQuery.of(context).size.height * 0.07,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
