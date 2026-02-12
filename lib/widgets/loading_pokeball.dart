import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoadingPokeball extends StatefulWidget {
  final double size;

  const LoadingPokeball({super.key, this.size = 50});

  @override
  State<LoadingPokeball> createState() => _LoadingPokeballState();
}

class _LoadingPokeballState extends State<LoadingPokeball>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: _PokeballPainter(),
      ),
    );
  }
}

class _PokeballPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Top half (red)
    final topPaint = Paint()
      ..color = PokemonColors.pokemonRed
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14159, // π (180 degrees)
      3.14159, // π (180 degrees)
      true,
      topPaint,
    );

    // Bottom half (white)
    final bottomPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      3.14159,
      true,
      bottomPaint,
    );

    // Middle black line
    final linePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08;

    canvas.drawLine(
      Offset(0, center.dy),
      Offset(size.width, center.dy),
      linePaint,
    );

    // Center circle (white)
    final centerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.3, centerCirclePaint);

    // Center circle border (black)
    final centerBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06;

    canvas.drawCircle(center, radius * 0.3, centerBorderPaint);

    // Inner center circle
    final innerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.15, innerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
