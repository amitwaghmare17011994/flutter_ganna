import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: Offset(0, 10))
];

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  _SkeletonState createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index > 0
                            ? const EdgeInsets.only(
                                left: 5.0, bottom: 1, top: 20)
                            : const EdgeInsets.only(
                                left: 5.0, bottom: 1, top: 0),
                        child: SkeletonAnimation(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            height: 15,
                            width: MediaQuery.of(context).size.width -
                                ((index + 1) * 40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[300]),
                          ),
                        ),
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
