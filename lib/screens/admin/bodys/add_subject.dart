import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/core/widgets/input/input_user_name.dart';
import 'package:studyapp/core/widgets/show_snack_bar.dart';
import 'package:studyapp/providers/admin_catigory_provider.dart';
import 'package:studyapp/services/admin/upload_subject_service.dart';

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
                const SizedBox(
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
            controller: subjectInfo,
          ),
          InputUserName(
            title: 'Course price',
            hintText: 'Price',
            controller: subjectPrice,
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
            onPressed: () async {
              await UploadSubject.uploadSubject(
                        subjectName: subjectName.text,
                        info: subjectInfo.text,
                        price: subjectPrice.text,
                      ) ==
                      true
                  ? ShowMySnackBar.mySnackBar(
                      context,
                      "SUCCESSFUL",
                      color: ColorConst.kGreen,
                    )
                  : ShowMySnackBar.mySnackBar(context, "FAILED");
              clearSubjectDataTextFormFiled();
            },
          )
        ],
      ),
    );
  }

  clearSubjectDataTextFormFiled() {
    subjectName.clear();
    subjectInfo.clear();
    subjectPrice.clear();
  }
}
