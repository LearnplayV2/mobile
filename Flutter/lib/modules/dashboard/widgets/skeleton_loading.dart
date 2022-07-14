import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoading extends StatelessWidget {
  const SkeletonLoading({ Key? key, required double this.w, required double this.h, Widget? this.widget, double? this.borderRadius }) : super(key: key);

  final widget;
  final w;
  final h;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        border: Border.all(color: Colors.transparent, width: 2)
      ),
      child: Shimmer.fromColors(
          child: widget == '' ? widget : Card(),
          baseColor: Color.fromARGB(255, 66, 66, 66),
          highlightColor: Color.fromARGB(255, 77, 75, 75),
          enabled: true),
    );
  }
}