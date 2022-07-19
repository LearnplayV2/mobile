import 'package:flutter/material.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';
import 'package:learnplay/modules/dashboard/widgets/pagination.dart';
import 'package:learnplay/modules/dashboard/widgets/skeleton_loading.dart';
import 'package:learnplay/services/groups/groups_service.dart';
import 'package:learnplay/types/groups/groups.dart';

class DashboardGroups extends StatefulWidget {
  const DashboardGroups({Key? key}) : super(key: key);

  @override
  State<DashboardGroups> createState() => _DashboardGroupsState();
}

class _DashboardGroupsState extends State<DashboardGroups> {
  bool _isLoading = true;
  GroupsType? _myGroups = null;

  @override
  void initState() {
    super.initState();
    _fetchMyGroups();
  }

  _fetchMyGroups({int? page = 1}) async {
    setState(() { _isLoading = true; });
    final response = await GroupService.myGroups(page: page);
    setState(() { _isLoading = false; _myGroups = response; });
  }

  @override
  Widget build(BuildContext context) {
    return DashboardBar(
        child: WidgetList.DisplayCenter(context, children: [
      MainTheme.h1("Grupos de estudo", color: MainTheme.accent),
      SizedBox(height: 20),
      _buildMyGroups()
    ]));
  }

  _buildMyGroups() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTheme.h1("Grupos que você gerencia:",
              color: Colors.amber, size: 16),
          SizedBox(height: 14),
          (_isLoading)
              ? Container(
                  child: Column(
                  children: List.generate(
                      3,
                      (index) => SkeletonLoading(
                          w: MediaQuery.of(context).size.width, h: 50)),
                ))
              : _listMyGroups()
        ],
      ),
    );
  }

  _listMyGroups() {
    if (_myGroups!.groups!.isEmpty)
      return Container(
        child: Text("Você ainda não criou grupos de estudo!"),
      );

    return Column(
      children: [
        Column(
          children: List.generate(
              _myGroups!.groups!.length,
              (index) => Material(
                    color: MainTheme.lighter,
                    child: ListTile(
                      onTap: () {},
                      title: Text(_myGroups!.groups![index].title!),
                    ),
                  )),
        ),
        SizedBox(height: 15),
        Pagination(
          pageBuilder: (page) async => _fetchMyGroups(page: page),
          totalPages: _myGroups!.totalPages!
        )
      ],
    );
  }
}
