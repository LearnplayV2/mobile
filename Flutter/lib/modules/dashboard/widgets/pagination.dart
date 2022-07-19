import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnplay/config.dart';

class Pagination extends StatefulWidget {
  final int totalPages;
  final bool? arrows;
  final Function(int page) pageBuilder;

  const Pagination(
      {Key? key,
      required this.totalPages,
      required this.pageBuilder,
      this.arrows = false})
      : super(key: key);

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  int _selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      (!widget.arrows!)
          ? _buildNumeredPagination()
          : Row(
              children: [
                _buildArrowPagination(left: true),
                _buildNumeredPagination(),
                _buildArrowPagination(left: false),
              ],
            )
    ]);
  }

  _buildArrowPagination({required bool left}) {
    if (left)
      return _buildPageButton(
          onpressed: () {
            int pageRedirect = (_selectedPage > 1) ? _selectedPage - 1 : 1;
            // print(pageRedirect);
            setState(() { _selectedPage = pageRedirect; });
            widget.pageBuilder(_selectedPage);
          },
          child: SizedBox(
            child: Icon(Icons.arrow_back_ios, size: 16),
            height: 22,
          ));

    return _buildPageButton(
        onpressed: () {
          int pageRedirect = (_selectedPage < widget.totalPages) ? _selectedPage + 1 : _selectedPage;
          // print(pageRedirect);
          setState(() { _selectedPage = pageRedirect; });
          widget.pageBuilder(_selectedPage);
        },
        child: SizedBox(
          child: Icon(Icons.arrow_forward_ios, size: 16),
          height: 22,
        ));
  }

  _buildNumeredPagination() {
    return Row(
      children: List.generate(
          widget.totalPages,
          (index) => _buildPageButton(
              onpressed: () {
                setState(() { _selectedPage = index + 1; });
                widget.pageBuilder(_selectedPage);
              },
              child: Text("${index + 1}", style: TextStyle(color: (_selectedPage == index + 1) ? MainTheme.accent : Colors.white)
              ))),
    );
  }

  _buildPageButton({required VoidCallback onpressed, required Widget child}) {
    return ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MainTheme.lighter),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
          minimumSize: MaterialStateProperty.all(Size(0, 0)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          )),
        ),
        child: child);
  }
}
