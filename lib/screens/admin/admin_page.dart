import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/core/widgets/my_app_bar.dart';
import 'package:studyapp/providers/admin_catigory_provider.dart';
import 'package:studyapp/screens/admin/bodys/add_a_textbook.dart';
import 'package:studyapp/screens/admin/bodys/add_subject.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Widget> bodys = [];

  @override
  void initState() {
    super.initState();
    bodys = [AddSubject(), AddATextBook()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context, title: "Admin panel"),
      body: bodys[context.watch<AdminPanelCatigory>().catigoryController],
    );
  }
}
