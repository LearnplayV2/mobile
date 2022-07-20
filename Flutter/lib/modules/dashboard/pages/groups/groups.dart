import 'package:flutter/material.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';
import 'package:learnplay/modules/dashboard/widgets/pagination.dart';
import 'package:learnplay/modules/dashboard/widgets/skeleton_loading.dart';
import 'package:learnplay/services/groups/groups_service.dart';
import 'package:learnplay/types/groups/groups.dart';
import 'package:timeago/timeago.dart' as timeago;

class DashboardGroups extends StatefulWidget {
  const DashboardGroups({Key? key}) : super(key: key);

  @override
  State<DashboardGroups> createState() => _DashboardGroupsState();
}

class _DashboardGroupsState extends State<DashboardGroups> {
  GroupsType? _myGroups = null;

  @override
  void initState() {
    super.initState();
    _fetchMyGroups();
  }

  _fetchMyGroups({int? page = 1, String? filter}) async {
    final response = await GroupService.myGroups(page: page, filter: filter);
    setState(() { _myGroups = response; });
  }

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('pt_BR', timeago.PtBrShortMessages());

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[800]
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 8),
                      Text("Procurar grupos"),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text("Criar grupo"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          MainTheme.h1("Grupos que você gerencia:",
              color: Colors.amber, size: 16),
          SizedBox(height: 14),
          (_myGroups == null)
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

    TextEditingController _searchController = TextEditingController();
    
    if (_myGroups!.groups!.isEmpty)
      return Container(
        child: Text("Nenhum grupo encontrado"),
      );

    return Column(
      children: [
        Form(
          child: TextField(
            controller: _searchController,
            onSubmitted: (data) {
              //todo: search groups
              print(_searchController.text);
              _fetchMyGroups(filter: _searchController.text);
            },
            decoration: InputDecoration(
              prefixIconColor: Colors.white,
              label: Text("Procurar título"),
              labelStyle: TextStyle(color: Colors.white60, fontSize: 18),
              prefixIcon: Icon(Icons.search, color: Colors.white60, size: 20)
            ),
          ),
        ),
        Column(
          children: List.generate(
              _myGroups!.groups!.length,
              (index) => Material(
                    color: MainTheme.lighter,
                    child: ListTile(
                      onTap: () {},
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_myGroups!.groups![index].title!, style: TextStyle(fontSize: 13)),
                          Text("${timeago.format(DateTime.parse(_myGroups!.groups![index].createdAt!), locale: 'pt_BR')}", style: TextStyle(fontSize: 12))
                        ],
                      ),
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
