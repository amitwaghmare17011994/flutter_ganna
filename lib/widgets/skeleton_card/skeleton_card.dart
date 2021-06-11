import 'package:flutter/material.dart';
import 'package:ganna/widgets/skeleton/skeleton.dart';

class SkeletonCard extends StatefulWidget {
  const SkeletonCard({Key? key}) : super(key: key);

  @override
  _SkeletonCardState createState() => _SkeletonCardState();
}

class _SkeletonCardState extends State<SkeletonCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(child: Skeleton()),
    );
  }
}
