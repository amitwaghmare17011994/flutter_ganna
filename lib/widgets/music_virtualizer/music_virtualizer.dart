import 'package:flutter/material.dart';

class MusicVirtualizerContainer extends StatelessWidget {
  List<Color> colors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.yellowAccent
  ];
  List<int> duration = [900, 700, 600, 800, 500];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: new List<Widget>.generate(
          10,
          (index) => MusicVirtualizer(
                duration: duration[index % 5],
                color: colors[index % 4],
              )),
    );
  }
}

class MusicVirtualizer extends StatefulWidget {
  final duration;
  final color;

  const MusicVirtualizer(
      {Key? key, required this.duration, required this.color})
      : super(key: key);

  @override
  _MusicVirtualizerState createState() => _MusicVirtualizerState();
}

class _MusicVirtualizerState extends State<MusicVirtualizer>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );
    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.elasticInOut);
    animation = Tween<double>(begin: 0, end: 100).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        animationController.stop();
        throw false;
      },
      child: Container(
        width: 10,
        height: animation.value,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
