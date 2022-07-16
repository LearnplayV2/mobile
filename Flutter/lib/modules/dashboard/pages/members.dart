import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/dashboard/pages/member_profile.dart';
import 'package:learnplay/modules/dashboard/pages/profile.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';
import 'package:learnplay/modules/dashboard/widgets/skeleton_loading.dart';
import 'package:learnplay/services/user/user_service.dart';
import 'package:learnplay/types/user.dart';
import 'package:shimmer/shimmer.dart';

class DashboardMembers extends StatefulWidget {
  const DashboardMembers({Key? key}) : super(key: key);

  @override
  State<DashboardMembers> createState() => _DashboardMembersState();
}

class _DashboardMembersState extends State<DashboardMembers> {
  List<User>? _members = [];

  @override
  void initState() {
    super.initState();
    _fetchMembers();
  }

  void _fetchMembers() async {
    final response = await UserService.getAllMembers();
    _members = response;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DashboardBar(
        child: WidgetList.DisplayCenter(context, children: [
      MainTheme.h1("Novos membros", color: MainTheme.accent),
      SizedBox(height: 25),
      _buildMembersCard()
    ]));
  }

  Widget _buildMembersCard() {
    return Visibility(
      visible: _members!.length > 0,
      replacement:
          Column(children: List.generate(3, (index) => _buildMembersLoading())),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildMemberCard()),
    );
  }

  _buildMemberCard() {
    return List.generate(
        _members!.length,
        (index) => Container(
              padding: EdgeInsets.only(bottom: 25),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(UserService.getProfilePicture(
                              uuid: "${_members![index].uuid!}"))),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${_members![index].name}",
                              style: TextStyle(fontSize: 20)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                                "Ativo desde ${DateFormat('dd/MM/yyyy, kk:mm').format(DateTime.parse(_members![index].createdAt ?? DateTime.now().toString()))}"),
                          ),
                          ElevatedButton(
                            onPressed: () => Get.to(() => DashboardMemberProfile(), arguments: {"uuid": "${_members![index].uuid}"}), 
                            child: Text("Visitar perfil")
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }

  _buildMembersLoading() {
    return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonLoading(w: 100, h: 100),
          Expanded(
            child: Column(
              children: [
                SkeletonLoading(w: MediaQuery.of(context).size.width, h: 33.3),
                SkeletonLoading(w: MediaQuery.of(context).size.width, h: 33.3),
                SkeletonLoading(w: MediaQuery.of(context).size.width, h: 33.3)
              ],
            ),
          )
        ]);
  }
}
