import "package:flutter/material.dart";

class VectorRoad extends StatelessWidget {
  const VectorRoad({required this.size, required this.color, super.key});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<Color?>(
        tween: ColorTween(begin: const Color(0xFFE9E8E8), end: color),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        builder: (_, Color? value, Widget? child) => CustomPaint(
          size: Size(size, size),
          painter: VectorCustomPainter(color: value ?? color),
        ),
      );
}

class VectorCustomPainter extends CustomPainter {
  VectorCustomPainter({
    required this.color,
    super.repaint,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path()
      ..moveTo(size.width * 0.07515738, size.height * 0.02073500)
      ..cubicTo(
        size.width * 0.07522466,
        size.height * 0.02936417,
        size.width * 0.06875932,
        size.height * 0.03641802,
        size.width * 0.06071660,
        size.height * 0.03649021,
      )
      ..cubicTo(
        size.width * 0.04770175,
        size.height * 0.03660708,
        size.width * 0.03424058,
        size.height * 0.03711698,
        size.width * 0.02031427,
        size.height * 0.03803844,
      )
      ..cubicTo(
        size.width * 0.01228660,
        size.height * 0.03856958,
        size.width * 0.005377505,
        size.height * 0.03201781,
        size.width * 0.004882466,
        size.height * 0.02340479,
      )
      ..cubicTo(
        size.width * 0.004387417,
        size.height * 0.01479167,
        size.width * 0.01049388,
        size.height * 0.007378823,
        size.width * 0.01852155,
        size.height * 0.006847688,
      )
      ..cubicTo(
        size.width * 0.03293932,
        size.height * 0.005893760,
        size.width * 0.04691748,
        size.height * 0.005363021,
        size.width * 0.06047291,
        size.height * 0.005241313,
      )
      ..cubicTo(
        size.width * 0.06851563,
        size.height * 0.005169104,
        size.width * 0.07509010,
        size.height * 0.01210583,
        size.width * 0.07515738,
        size.height * 0.02073500,
      )
      ..close()
      ..moveTo(size.width * 0.1261515, size.height * 0.02359083)
      ..cubicTo(
        size.width * 0.1271447,
        size.height * 0.01502740,
        size.width * 0.1344194,
        size.height * 0.008948583,
        size.width * 0.1424010,
        size.height * 0.01001354,
      )
      ..cubicTo(
        size.width * 0.1720932,
        size.height * 0.01397531,
        size.width * 0.1993495,
        size.height * 0.02033104,
        size.width * 0.2244233,
        size.height * 0.02885896,
      )
      ..cubicTo(
        size.width * 0.2320903,
        size.height * 0.03146656,
        size.width * 0.2363359,
        size.height * 0.04024896,
        size.width * 0.2339058,
        size.height * 0.04847500,
      )
      ..cubicTo(
        size.width * 0.2314748,
        size.height * 0.05670104,
        size.width * 0.2232893,
        size.height * 0.06125573,
        size.width * 0.2156223,
        size.height * 0.05864812,
      )
      ..cubicTo(
        size.width * 0.1923777,
        size.height * 0.05074240,
        size.width * 0.1668757,
        size.height * 0.04476990,
        size.width * 0.1388058,
        size.height * 0.04102469,
      )
      ..cubicTo(
        size.width * 0.1308252,
        size.height * 0.03995969,
        size.width * 0.1251592,
        size.height * 0.03215427,
        size.width * 0.1261515,
        size.height * 0.02359083,
      )
      ..close()
      ..moveTo(size.width * 0.2810796, size.height * 0.07092823)
      ..cubicTo(
        size.width * 0.2852049,
        size.height * 0.06352031,
        size.width * 0.2941456,
        size.height * 0.06110292,
        size.width * 0.3010505,
        size.height * 0.06552896,
      )
      ..cubicTo(
        size.width * 0.3259515,
        size.height * 0.08149104,
        size.width * 0.3478796,
        size.height * 0.1001929,
        size.width * 0.3673495,
        size.height * 0.1211073,
      )
      ..cubicTo(
        size.width * 0.3730340,
        size.height * 0.1272125,
        size.width * 0.3730282,
        size.height * 0.1371063,
        size.width * 0.3673379,
        size.height * 0.1432042,
      )
      ..cubicTo(
        size.width * 0.3616476,
        size.height * 0.1493021,
        size.width * 0.3524262,
        size.height * 0.1492969,
        size.width * 0.3467427,
        size.height * 0.1431917,
      )
      ..cubicTo(
        size.width * 0.3288864,
        size.height * 0.1240104,
        size.width * 0.3088456,
        size.height * 0.1069292,
        size.width * 0.2861117,
        size.height * 0.09235552,
      )
      ..cubicTo(
        size.width * 0.2792078,
        size.height * 0.08792958,
        size.width * 0.2769544,
        size.height * 0.07833625,
        size.width * 0.2810796,
        size.height * 0.07092823,
      )
      ..close()
      ..moveTo(size.width * 0.3995379, size.height * 0.1866094)
      ..cubicTo(
        size.width * 0.4062883,
        size.height * 0.1819188,
        size.width * 0.4153058,
        size.height * 0.1839885,
        size.width * 0.4196777,
        size.height * 0.1912312,
      )
      ..cubicTo(
        size.width * 0.4345718,
        size.height * 0.2159062,
        size.width * 0.4475437,
        size.height * 0.2421844,
        size.width * 0.4591359,
        size.height * 0.2695229,
      )
      ..cubicTo(
        size.width * 0.4624670,
        size.height * 0.2773771,
        size.width * 0.4592320,
        size.height * 0.2866417,
        size.width * 0.4519107,
        size.height * 0.2902156,
      )
      ..cubicTo(
        size.width * 0.4445893,
        size.height * 0.2937885,
        size.width * 0.4359553,
        size.height * 0.2903177,
        size.width * 0.4326243,
        size.height * 0.2824635,
      )
      ..cubicTo(
        size.width * 0.4215039,
        size.height * 0.2562365,
        size.width * 0.4091981,
        size.height * 0.2313583,
        size.width * 0.3952301,
        size.height * 0.2082177,
      )
      ..cubicTo(
        size.width * 0.3908583,
        size.height * 0.2009750,
        size.width * 0.3927864,
        size.height * 0.1913010,
        size.width * 0.3995379,
        size.height * 0.1866094,
      )
      ..close()
      ..moveTo(size.width * 0.4708874, size.height * 0.3419281)
      ..cubicTo(
        size.width * 0.4784786,
        size.height * 0.3390781,
        size.width * 0.4867864,
        size.height * 0.3433719,
        size.width * 0.4894417,
        size.height * 0.3515167,
      )
      ..cubicTo(
        size.width * 0.4983505,
        size.height * 0.3788385,
        size.width * 0.5065272,
        size.height * 0.4067667,
        size.width * 0.5143893,
        size.height * 0.4348427,
      )
      ..cubicTo(
        size.width * 0.5167039,
        size.height * 0.4431073,
        size.width * 0.5123350,
        size.height * 0.4518198,
        size.width * 0.5046320,
        size.height * 0.4543021,
      )
      ..cubicTo(
        size.width * 0.4969291,
        size.height * 0.4567854,
        size.width * 0.4888087,
        size.height * 0.4520990,
        size.width * 0.4864951,
        size.height * 0.4438344,
      )
      ..cubicTo(
        size.width * 0.4786951,
        size.height * 0.4159823,
        size.width * 0.4706583,
        size.height * 0.3885437,
        size.width * 0.4619495,
        size.height * 0.3618365,
      )
      ..cubicTo(
        size.width * 0.4592942,
        size.height * 0.3536906,
        size.width * 0.4632951,
        size.height * 0.3447781,
        size.width * 0.4708874,
        size.height * 0.3419281,
      )
      ..close()
      ..moveTo(size.width * 0.5191340, size.height * 0.5076146)
      ..cubicTo(
        size.width * 0.5268515,
        size.height * 0.5051844,
        size.width * 0.5349437,
        size.height * 0.5099250,
        size.width * 0.5372097,
        size.height * 0.5182052,
      )
      ..cubicTo(
        size.width * 0.5448311,
        size.height * 0.5460583,
        size.width * 0.5525563,
        size.height * 0.5736698,
        size.width * 0.5608165,
        size.height * 0.6007521,
      )
      ..cubicTo(
        size.width * 0.5633184,
        size.height * 0.6089531,
        size.width * 0.5591495,
        size.height * 0.6177771,
        size.width * 0.5515049,
        size.height * 0.6204615,
      )
      ..cubicTo(
        size.width * 0.5438612,
        size.height * 0.6231458,
        size.width * 0.5356359,
        size.height * 0.6186729,
        size.width * 0.5331350,
        size.height * 0.6104708,
      )
      ..cubicTo(
        size.width * 0.5247340,
        size.height * 0.5829271,
        size.width * 0.5169087,
        size.height * 0.5549500,
        size.width * 0.5092631,
        size.height * 0.5270083,
      )
      ..cubicTo(
        size.width * 0.5069971,
        size.height * 0.5187292,
        size.width * 0.5114165,
        size.height * 0.5100458,
        size.width * 0.5191340,
        size.height * 0.5076146,
      )
      ..close()
      ..moveTo(size.width * 0.5690922, size.height * 0.6727354)
      ..cubicTo(
        size.width * 0.5765359,
        size.height * 0.6694667,
        size.width * 0.5850398,
        size.height * 0.6732917,
        size.width * 0.5880864,
        size.height * 0.6812781,
      )
      ..cubicTo(
        size.width * 0.5982816,
        size.height * 0.7080094,
        size.width * 0.6094757,
        size.height * 0.7336479,
        size.width * 0.6221214,
        size.height * 0.7578208,
      )
      ..cubicTo(
        size.width * 0.6260583,
        size.height * 0.7653458,
        size.width * 0.6235641,
        size.height * 0.7748698,
        size.width * 0.6165505,
        size.height * 0.7790938,
      )
      ..cubicTo(
        size.width * 0.6095359,
        size.height * 0.7833177,
        size.width * 0.6006592,
        size.height * 0.7806417,
        size.width * 0.5967223,
        size.height * 0.7731167,
      )
      ..cubicTo(
        size.width * 0.5833738,
        size.height * 0.7475990,
        size.width * 0.5716757,
        size.height * 0.7207646,
        size.width * 0.5611301,
        size.height * 0.6931146,
      )
      ..cubicTo(
        size.width * 0.5580835,
        size.height * 0.6851281,
        size.width * 0.5616485,
        size.height * 0.6760042,
        size.width * 0.5690922,
        size.height * 0.6727354,
      )
      ..close()
      ..moveTo(size.width * 0.6455291, size.height * 0.8250531)
      ..cubicTo(
        size.width * 0.6517136,
        size.height * 0.8195365,
        size.width * 0.6608951,
        size.height * 0.8204427,
        size.width * 0.6660369,
        size.height * 0.8270781,
      )
      ..cubicTo(
        size.width * 0.6824602,
        size.height * 0.8482719,
        size.width * 0.7008767,
        size.height * 0.8675312,
        size.width * 0.7217786,
        size.height * 0.8844635,
      )
      ..cubicTo(
        size.width * 0.7281981,
        size.height * 0.8896635,
        size.width * 0.7294728,
        size.height * 0.8994615,
        size.width * 0.7246262,
        size.height * 0.9063479,
      )
      ..cubicTo(
        size.width * 0.7197796,
        size.height * 0.9132354,
        size.width * 0.7106476,
        size.height * 0.9146031,
        size.width * 0.7042291,
        size.height * 0.9094031,
      )
      ..cubicTo(
        size.width * 0.6813932,
        size.height * 0.8909052,
        size.width * 0.6613748,
        size.height * 0.8699417,
        size.width * 0.6436408,
        size.height * 0.8470573,
      )
      ..cubicTo(
        size.width * 0.6384990,
        size.height * 0.8404219,
        size.width * 0.6393437,
        size.height * 0.8305698,
        size.width * 0.6455291,
        size.height * 0.8250531,
      )
      ..close()
      ..moveTo(size.width * 0.7693573, size.height * 0.9341937)
      ..cubicTo(
        size.width * 0.7725641,
        size.height * 0.9262802,
        size.width * 0.7811427,
        size.height * 0.9226531,
        size.width * 0.7885194,
        size.height * 0.9260927,
      )
      ..cubicTo(
        size.width * 0.8108835,
        size.height * 0.9365229,
        size.width * 0.8355359,
        size.height * 0.9450229,
        size.width * 0.8628243,
        size.height * 0.9512740,
      )
      ..cubicTo(
        size.width * 0.8706893,
        size.height * 0.9530760,
        size.width * 0.8757049,
        size.height * 0.9613781,
        size.width * 0.8740252,
        size.height * 0.9698177,
      )
      ..cubicTo(
        size.width * 0.8723456,
        size.height * 0.9782562,
        size.width * 0.8646078,
        size.height * 0.9836375,
        size.width * 0.8567427,
        size.height * 0.9818354,
      )
      ..cubicTo(
        size.width * 0.8276728,
        size.height * 0.9751771,
        size.width * 0.8011573,
        size.height * 0.9660625,
        size.width * 0.7769078,
        size.height * 0.9547531,
      )
      ..cubicTo(
        size.width * 0.7695320,
        size.height * 0.9513125,
        size.width * 0.7661515,
        size.height * 0.9421083,
        size.width * 0.7693573,
        size.height * 0.9341937,
      )
      ..close()
      ..moveTo(size.width * 0.9249544, size.height * 0.9769302)
      ..cubicTo(
        size.width * 0.9254408,
        size.height * 0.9683167,
        size.width * 0.9323427,
        size.height * 0.9617562,
        size.width * 0.9403709,
        size.height * 0.9622771,
      )
      ..cubicTo(
        size.width * 0.9532922,
        size.height * 0.9631167,
        size.width * 0.9666893,
        size.height * 0.9635469,
        size.width * 0.9805825,
        size.height * 0.9635469,
      )
      ..cubicTo(
        size.width * 0.9886214,
        size.height * 0.9635469,
        size.width * 0.9951456,
        size.height * 0.9705427,
        size.width * 0.9951456,
        size.height * 0.9791719,
      )
      ..cubicTo(
        size.width * 0.9951456,
        size.height * 0.9878010,
        size.width * 0.9886214,
        size.height * 0.9947969,
        size.width * 0.9805825,
        size.height * 0.9947969,
      )
      ..cubicTo(
        size.width * 0.9661291,
        size.height * 0.9947969,
        size.width * 0.9521447,
        size.height * 0.9943500,
        size.width * 0.9386107,
        size.height * 0.9934708,
      )
      ..cubicTo(
        size.width * 0.9305825,
        size.height * 0.9929490,
        size.width * 0.9244689,
        size.height * 0.9855438,
        size.width * 0.9249544,
        size.height * 0.9769302,
      )
      ..close();

    final Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant VectorCustomPainter oldDelegate) =>
      color != oldDelegate.color;
}
