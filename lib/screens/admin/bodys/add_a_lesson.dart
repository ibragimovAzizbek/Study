import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/constants/color_const.dart';
import 'package:studyapp/core/constants/font_const.dart';
import 'package:studyapp/core/widgets/input/input_user_name.dart';
import 'package:studyapp/providers/admin_catigory_provider.dart';
import 'package:studyapp/services/admin/upload_lesson_service.dart';

class AddATextBook extends StatelessWidget {
  AddATextBook({Key? key}) : super(key: key);

  TextEditingController subjectName = TextEditingController();
  TextEditingController lessonTheme = TextEditingController();
  TextEditingController unitInfo = TextEditingController();
  TextEditingController unit = TextEditingController();

  XFile? vedio;
  final _picker = ImagePicker();

  bool statusCourseUpload = false;

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
                      "Add a lesson",
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
            title: 'Lesson theme',
            hintText: 'Lesson theme',
            controller: lessonTheme,
          ),
          InputUserName(
            title: 'Unit',
            hintText: 'Unit',
            controller: unit,
          ),
          InputUserName(
            title: 'Info unit',
            hintText: 'Unit Info',
            controller: unitInfo,
          ),
          SizedBox(height: FontConst.kExtraLargeFont),
          TextButton(
            child: const Text("Upload vedio"),
            onPressed: () async {
              vedio = await _picker.pickVideo(source: ImageSource.gallery);

              statusCourseUpload =
                  await context.read<UploadLesson>().uploadVedioLessonToStorage(
                        vedio!,
                        subjectName: subjectName.text,
                        lessonName: lessonTheme.text,
                        unit: unit.text,
                        unitInfo: unitInfo.text,
                      );
            },
          ),
          ElevatedButton(
            child: Text(
              "Upload lesson",
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
            onPressed: statusCourseUpload == false ? null : () async {
              
            },
          )
        ],
      ),
    );
  }

  clearTextFromFiled() {
    subjectName.clear();
    lessonTheme.clear();
    unit.clear();
    unitInfo.clear();
  }
}
