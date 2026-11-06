import 'package:flutter/material.dart';

class BlushShade {
  final String name;
  final Color color;
  final bool available;

  const BlushShade(this.name, this.color, {this.available = true});
}

class BlushColorPicker extends StatefulWidget {
  const BlushColorPicker({super.key, this.onChanged, this.initialIndex = 3});

  final ValueChanged<BlushShade>? onChanged;
  final int initialIndex;

  @override
  State<BlushColorPicker> createState() => _BlushColorPickerState();
}

class _BlushColorPickerState extends State<BlushColorPicker> {
  static const List<BlushShade> _shades = [
    BlushShade('Sweet Peach', Color(0xFFFF7A7A)),
    BlushShade('Coral Crush', Color(0xFFFF8A75), available: false),
    BlushShade('Poppy Red', Color(0xFFEA3B2E)),
    BlushShade('Black Cherry', Color(0xFF9B5A60)),
    BlushShade('Burnt Sienna', Color(0xFF8F4535), available: false),
  ];

  late int _selected = widget.initialIndex;

  void _onTap(int index) {
    final shade = _shades[index];
    if (!shade.available) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('${shade.name} is out of stock')),
        );
      return;
    }
    setState(() => _selected = index);
    widget.onChanged?.call(shade);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B6B6B),
            ),
            children: [
              const TextSpan(text: 'BLUSH COLOR:  '),
              TextSpan(
                text: _shades[_selected].name,
                style: const TextStyle(color: Color(0xFF3A3A3A)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          children: List.generate(_shades.length, (i) {
            return _Swatch(
              shade: _shades[i],
              selected: i == _selected,
              onTap: () => _onTap(i),
            );
          }),
        ),
      ],
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch({
    required this.shade,
    required this.selected,
    required this.onTap,
  });

  final BlushShade shade;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: shade.available ? shade.name : '${shade.name} (unavailable)',
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: shade.color,
            shape: BoxShape.circle,
            border: selected ? Border.all(color: Colors.black, width: 3) : null,
          ),
          child: shade.available ? null : CustomPaint(painter: _SlashPainter()),
        ),
      ),
    );
  }
}

class _SlashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(size.width * 0.35, size.height * 0.22),
      Offset(size.width * 0.65, size.height * 0.78),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
