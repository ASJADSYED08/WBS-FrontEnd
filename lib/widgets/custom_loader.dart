import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  final double? size;
  final Color? color;

  const CustomLoader({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _translateAnimation = Tween<double>(
      begin: -30.0,
      end: 30.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size ?? 80.0;
    final color = widget.color ?? Color(0xff0078D4);

    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_translateAnimation.value, 0),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color,
                    color.withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'WA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size * 0.4,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

