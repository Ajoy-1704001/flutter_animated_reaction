import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Reaction extends StatefulWidget {
  const Reaction(
      {super.key,
      required this.path,
      required this.onTap,
      required this.index,
      required this.size});
  final String path;
  final int index;
  final Size size;
  final Function(int) onTap;

  @override
  State<Reaction> createState() => _ReactionState();
}

class _ReactionState extends State<Reaction> with TickerProviderStateMixin {
  late AnimationController iconScaleController;
  late AnimationController slideController;
  final player = AudioPlayer();
  double padding = 0;
  @override
  void initState() {
    super.initState();
    player.audioCache.prefix = "packages/flutter_animated_reaction/";
    iconScaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    slideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
  }

  @override
  void dispose() {
    iconScaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -0.3))
          .animate(
        CurvedAnimation(
          curve: Curves.linear,
          parent: slideController,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          iconScaleController.forward().whenComplete(() async {
            await player.play(AssetSource("assets/audio/pop.mp3"));
            widget.onTap(widget.index);
          });
        },
        onPanStart: (details) {
          slideController.forward();
          iconScaleController.forward();
          setState(() {
            padding = 10;
          });
        },
        onPanUpdate: (details) {
          slideController.forward();
          iconScaleController.forward();
          setState(() {
            padding = 10;
          });
        },
        onPanEnd: (details) {
          iconScaleController.reverse();
          slideController.reverse();
          setState(() {
            padding = 0;
          });
        },
        child: ScaleTransition(
          scale: Tween(begin: 1.0, end: 1.5).animate(
            CurvedAnimation(
              curve: Curves.fastEaseInToSlowEaseOut,
              parent: iconScaleController,
            ),
          ),
          child: AnimatedPadding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            duration: const Duration(milliseconds: 200),
            child: Image(
              image:
                  AssetImage(widget.path, package: "flutter_animated_reaction"),
              width: widget.size.width,
              height: widget.size.height,
            ),
          ),
        ),
      ),
    );
  }
}
