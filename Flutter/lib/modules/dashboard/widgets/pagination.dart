import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnplay/config.dart';

class Pagination extends StatelessWidget {
  final int totalPages;
  final Function(int page) pageBuilder;
  
  const Pagination({Key? key, required this.totalPages, required this.pageBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(totalPages, (index) => 
        ElevatedButton(
          onPressed: () {
            int page = index + 1;
            pageBuilder(page);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MainTheme.lighter),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
            minimumSize: MaterialStateProperty.all(Size(0, 0)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            )),
          ),
          child: Text("${index + 1}", style: TextStyle(color: Colors.white))
        )
      ),
    );
  }
}
