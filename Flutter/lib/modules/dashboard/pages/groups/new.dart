import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';

class NewGroup extends StatefulWidget {
  const NewGroup({Key? key}) : super(key: key);

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  static final _formKey = GlobalKey<FormState>(debugLabel: 'new_group');

  @override
  Widget build(BuildContext context) {
    return DashboardBar(
        child: WidgetList.DisplayCenter(context, children: [
      MainTheme.h1("Criar novo grupo", color: MainTheme.accent),
      SizedBox(height: 20),
      _buildGroupForm()
    ]));
  }

  _buildGroupForm() {
    final _titleController = TextEditingController();
    final _visibilityController = TextEditingController(text: 'PUBLIC');

    return StatefulBuilder(
      builder: (ctx, setState) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              WidgetList.Input(
                controller: _titleController,
                hintText: 'Nome do grupo',
                textInputAction: TextInputAction.next,
              ),
              DropDownFormField(
                filled: false,
                value: _visibilityController.text,
                titleText: "Visibilidade",
                hintText: "Visibilidade",
                onChanged: (value) {
                  _visibilityController.text = value;
                  setState(() {});
                },
                dataSource: const [
                  {"display": "Público", "value": "PUBLIC"},
                  {"display": "Privado", "value": "PRIVATE"},
                ],
                textField: 'display',
                valueField: 'value',
              ),
              TextField(
                decoration: InputDecoration(
                    label: Text("Descrição do grupo"),
                    labelStyle: TextStyle(color: Colors.white60, fontSize: 14),
                    fillColor: MainTheme.light,
                    filled: true),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 3,
                maxLines: 8,
              ),
              SizedBox(height: 18),
              ElevatedButton(onPressed: () {}, child: Text("Criar grupo"))
            ],
          ),
        );
      },
    );
  }
}
