import "package:flutter/material.dart";

class VectorTwoRoad extends StatelessWidget {
  const VectorTwoRoad({required this.size, required this.color, super.key});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<Color?>(
        tween: ColorTween(begin: const Color(0xFFE9E8E8), end: color),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        builder: (_, Color? value, Widget? child) => CustomPaint(
          size: Size(size, size),
          painter: VectorTwoCustomPainter(color: value ?? color),
        ),
      );
}

class VectorTwoCustomPainter extends CustomPainter {
  VectorTwoCustomPainter({
    required this.color,
    super.repaint,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path()
      ..moveTo(size.width * 0.9800000, size.height * 0.03030303)
      ..cubicTo(
        size.width * 0.9668330,
        size.height * 0.03030303,
        size.width * 0.9541550,
        size.height * 0.03066343,
        size.width * 0.9419450,
        size.height * 0.03136737,
      )
      ..cubicTo(
        size.width * 0.9336740,
        size.height * 0.03184434,
        size.width * 0.9265860,
        size.height * 0.02545828,
        size.width * 0.9261140,
        size.height * 0.01710394,
      )
      ..cubicTo(
        size.width * 0.9256420,
        size.height * 0.008749626,
        size.width * 0.9319640,
        size.height * 0.001590505,
        size.width * 0.9402350,
        size.height * 0.001113636,
      )
      ..cubicTo(
        size.width * 0.9530430,
        size.height * 0.0003751778,
        size.width * 0.9662920,
        0,
        size.width * 0.9800000,
        0,
      )
      ..cubicTo(
        size.width * 0.9882840,
        0,
        size.width * 0.9950000,
        size.height * 0.006783566,
        size.width * 0.9950000,
        size.height * 0.01515152,
      )
      ..cubicTo(
        size.width * 0.9950000,
        size.height * 0.02351949,
        size.width * 0.9882840,
        size.height * 0.03030303,
        size.width * 0.9800000,
        size.height * 0.03030303,
      )
      ..close()
      ..moveTo(size.width * 0.8808800, size.height * 0.02270535)
      ..cubicTo(
        size.width * 0.8825280,
        size.height * 0.03090586,
        size.width * 0.8772830,
        size.height * 0.03890374,
        size.width * 0.8691650,
        size.height * 0.04056909,
      )
      ..cubicTo(
        size.width * 0.8431380,
        size.height * 0.04590798,
        size.width * 0.8198230,
        size.height * 0.05321303,
        size.width * 0.7988650,
        size.height * 0.06221152,
      )
      ..cubicTo(
        size.width * 0.7912410,
        size.height * 0.06548495,
        size.width * 0.7824330,
        size.height * 0.06189566,
        size.width * 0.7791920,
        size.height * 0.05419455,
      )
      ..cubicTo(
        size.width * 0.7759520,
        size.height * 0.04649343,
        size.width * 0.7795050,
        size.height * 0.03759677,
        size.width * 0.7871290,
        size.height * 0.03432333,
      )
      ..cubicTo(
        size.width * 0.8100910,
        size.height * 0.02446434,
        size.width * 0.8353540,
        size.height * 0.01658313,
        size.width * 0.8631940,
        size.height * 0.01087222,
      )
      ..cubicTo(
        size.width * 0.8713130,
        size.height * 0.009206909,
        size.width * 0.8792310,
        size.height * 0.01450475,
        size.width * 0.8808800,
        size.height * 0.02270535,
      )
      ..close()
      ..moveTo(size.width * 0.7392900, size.height * 0.07742586)
      ..cubicTo(
        size.width * 0.7443280,
        size.height * 0.08406828,
        size.width * 0.7430820,
        size.height * 0.09357879,
        size.width * 0.7365060,
        size.height * 0.09866798,
      )
      ..cubicTo(
        size.width * 0.7170250,
        size.height * 0.1137444,
        size.width * 0.7001960,
        size.height * 0.1310000,
        size.width * 0.6854940,
        size.height * 0.1501141,
      )
      ..cubicTo(
        size.width * 0.6804110,
        size.height * 0.1567212,
        size.width * 0.6709880,
        size.height * 0.1579162,
        size.width * 0.6644460,
        size.height * 0.1527818,
      )
      ..cubicTo(
        size.width * 0.6579040,
        size.height * 0.1476475,
        size.width * 0.6567220,
        size.height * 0.1381293,
        size.width * 0.6618040,
        size.height * 0.1315212,
      )
      ..cubicTo(
        size.width * 0.6779650,
        size.height * 0.1105121,
        size.width * 0.6965930,
        size.height * 0.09138162,
        size.width * 0.7182600,
        size.height * 0.07461343,
      )
      ..cubicTo(
        size.width * 0.7248370,
        size.height * 0.06952424,
        size.width * 0.7342520,
        size.height * 0.07078333,
        size.width * 0.7392900,
        size.height * 0.07742586,
      )
      ..close()
      ..moveTo(size.width * 0.6402930, size.height * 0.1926475)
      ..cubicTo(
        size.width * 0.6477280,
        size.height * 0.1963384,
        size.width * 0.6507930,
        size.height * 0.2054182,
        size.width * 0.6471390,
        size.height * 0.2129283,
      )
      ..cubicTo(
        size.width * 0.6365240,
        size.height * 0.2347434,
        size.width * 0.6274200,
        size.height * 0.2580030,
        size.width * 0.6193680,
        size.height * 0.2824172,
      )
      ..cubicTo(
        size.width * 0.6167500,
        size.height * 0.2903566,
        size.width * 0.6082560,
        size.height * 0.2946485,
        size.width * 0.6003970,
        size.height * 0.2920040,
      )
      ..cubicTo(
        size.width * 0.5925370,
        size.height * 0.2893596,
        size.width * 0.5882880,
        size.height * 0.2807798,
        size.width * 0.5909060,
        size.height * 0.2728404,
      )
      ..cubicTo(
        size.width * 0.5992870,
        size.height * 0.2474253,
        size.width * 0.6088810,
        size.height * 0.2228545,
        size.width * 0.6202150,
        size.height * 0.1995616,
      )
      ..cubicTo(
        size.width * 0.6238690,
        size.height * 0.1920525,
        size.width * 0.6328580,
        size.height * 0.1889566,
        size.width * 0.6402930,
        size.height * 0.1926475,
      )
      ..close()
      ..moveTo(size.width * 0.5878330, size.height * 0.3368990)
      ..cubicTo(
        size.width * 0.5958750,
        size.height * 0.3389101,
        size.width * 0.6007790,
        size.height * 0.3471253,
        size.width * 0.5987870,
        size.height * 0.3552485,
      )
      ..cubicTo(
        size.width * 0.5928210,
        size.height * 0.3795788,
        size.width * 0.5874050,
        size.height * 0.4045273,
        size.width * 0.5821410,
        size.height * 0.4298778,
      )
      ..cubicTo(
        size.width * 0.5804400,
        size.height * 0.4380667,
        size.width * 0.5724890,
        size.height * 0.4433131,
        size.width * 0.5643810,
        size.height * 0.4415949,
      )
      ..cubicTo(
        size.width * 0.5562730,
        size.height * 0.4398778,
        size.width * 0.5510790,
        size.height * 0.4318455,
        size.width * 0.5527800,
        size.height * 0.4236556,
      )
      ..cubicTo(
        size.width * 0.5580760,
        size.height * 0.3981556,
        size.width * 0.5635760,
        size.height * 0.3728051,
        size.width * 0.5696670,
        size.height * 0.3479626,
      )
      ..cubicTo(
        size.width * 0.5716590,
        size.height * 0.3398404,
        size.width * 0.5797920,
        size.height * 0.3348869,
        size.width * 0.5878330,
        size.height * 0.3368990,
      )
      ..close()
      ..moveTo(size.width * 0.5551030, size.height * 0.4874081)
      ..cubicTo(
        size.width * 0.5632130,
        size.height * 0.4891192,
        size.width * 0.5684140,
        size.height * 0.4971455,
        size.width * 0.5667210,
        size.height * 0.5053374,
      )
      ..cubicTo(
        size.width * 0.5615060,
        size.height * 0.5305657,
        size.width * 0.5560680,
        size.height * 0.5559000,
        size.width * 0.5500430,
        size.height * 0.5810040,
      )
      ..cubicTo(
        size.width * 0.5480920,
        size.height * 0.5891364,
        size.width * 0.5399830,
        size.height * 0.5941313,
        size.width * 0.5319320,
        size.height * 0.5921596,
      )
      ..cubicTo(
        size.width * 0.5238810,
        size.height * 0.5901879,
        size.width * 0.5189360,
        size.height * 0.5819980,
        size.width * 0.5208880,
        size.height * 0.5738646,
      )
      ..cubicTo(
        size.width * 0.5268020,
        size.height * 0.5492172,
        size.width * 0.5321660,
        size.height * 0.5242414,
        size.width * 0.5373540,
        size.height * 0.4991434,
      )
      ..cubicTo(
        size.width * 0.5390470,
        size.height * 0.4909525,
        size.width * 0.5469940,
        size.height * 0.4856980,
        size.width * 0.5551030,
        size.height * 0.4874081,
      )
      ..close()
      ..moveTo(size.width * 0.5197530, size.height * 0.6372616)
      ..cubicTo(
        size.width * 0.5276540,
        size.height * 0.6397758,
        size.width * 0.5320420,
        size.height * 0.6482838,
        size.width * 0.5295530,
        size.height * 0.6562657,
      )
      ..cubicTo(
        size.width * 0.5217120,
        size.height * 0.6814071,
        size.width * 0.5128210,
        size.height * 0.7060737,
        size.width * 0.5024570,
        size.height * 0.7299283,
      )
      ..cubicTo(
        size.width * 0.4991280,
        size.height * 0.7375909,
        size.width * 0.4902800,
        size.height * 0.7410758,
        size.width * 0.4826940,
        size.height * 0.7377131,
      )
      ..cubicTo(
        size.width * 0.4751080,
        size.height * 0.7343505,
        size.width * 0.4716570,
        size.height * 0.7254131,
        size.width * 0.4749860,
        size.height * 0.7177505,
      )
      ..cubicTo(
        size.width * 0.4848340,
        size.height * 0.6950848,
        size.width * 0.4933570,
        size.height * 0.6714707,
        size.width * 0.5009390,
        size.height * 0.6471606,
      )
      ..cubicTo(
        size.width * 0.5034280,
        size.height * 0.6391798,
        size.width * 0.5118510,
        size.height * 0.6347475,
        size.width * 0.5197530,
        size.height * 0.6372616,
      )
      ..close()
      ..moveTo(size.width * 0.4611480, size.height * 0.7790707)
      ..cubicTo(
        size.width * 0.4681310,
        size.height * 0.7835727,
        size.width * 0.4701790,
        size.height * 0.7929404,
        size.width * 0.4657220,
        size.height * 0.7999939,
      )
      ..cubicTo(
        size.width * 0.4516590,
        size.height * 0.8222525,
        size.width * 0.4356130,
        size.height * 0.8433273,
        size.width * 0.4171390,
        size.height * 0.8628556,
      )
      ..cubicTo(
        size.width * 0.4114150,
        size.height * 0.8689061,
        size.width * 0.4019200,
        size.height * 0.8691232,
        size.width * 0.3959310,
        size.height * 0.8633424,
      )
      ..cubicTo(
        size.width * 0.3899410,
        size.height * 0.8575616,
        size.width * 0.3897260,
        size.height * 0.8479707,
        size.width * 0.3954490,
        size.height * 0.8419202,
      )
      ..cubicTo(
        size.width * 0.4124600,
        size.height * 0.8239384,
        size.width * 0.4273220,
        size.height * 0.8044424,
        size.width * 0.4404330,
        size.height * 0.7836909,
      )
      ..cubicTo(
        size.width * 0.4448900,
        size.height * 0.7766374,
        size.width * 0.4541640,
        size.height * 0.7745687,
        size.width * 0.4611480,
        size.height * 0.7790707,
      )
      ..close()
      ..moveTo(size.width * 0.3606890, size.height * 0.8935030)
      ..cubicTo(
        size.width * 0.3653550,
        size.height * 0.9004172,
        size.width * 0.3635890,
        size.height * 0.9098434,
        size.width * 0.3567440,
        size.height * 0.9145566,
      )
      ..cubicTo(
        size.width * 0.3358920,
        size.height * 0.9289162,
        size.width * 0.3128820,
        size.height * 0.9417313,
        size.width * 0.2874400,
        size.height * 0.9527929,
      )
      ..cubicTo(
        size.width * 0.2798310,
        size.height * 0.9561010,
        size.width * 0.2710070,
        size.height * 0.9525515,
        size.width * 0.2677320,
        size.height * 0.9448657,
      )
      ..cubicTo(
        size.width * 0.2644570,
        size.height * 0.9371798,
        size.width * 0.2679700,
        size.height * 0.9282667,
        size.width * 0.2755800,
        size.height * 0.9249586,
      )
      ..cubicTo(
        size.width * 0.2993130,
        size.height * 0.9146394,
        size.width * 0.3206300,
        size.height * 0.9027515,
        size.width * 0.3398460,
        size.height * 0.8895182,
      )
      ..cubicTo(
        size.width * 0.3466910,
        size.height * 0.8848051,
        size.width * 0.3560230,
        size.height * 0.8865889,
        size.width * 0.3606890,
        size.height * 0.8935030,
      )
      ..close()
      ..moveTo(size.width * 0.2239160, size.height * 0.9596909)
      ..cubicTo(
        size.width * 0.2259690,
        size.height * 0.9677980,
        size.width * 0.2211280,
        size.height * 0.9760515,
        size.width * 0.2131020,
        size.height * 0.9781253,
      )
      ..cubicTo(
        size.width * 0.1893840,
        size.height * 0.9842556,
        size.width * 0.1640120,
        size.height * 0.9891697,
        size.width * 0.1368500,
        size.height * 0.9927758,
      )
      ..cubicTo(
        size.width * 0.1286360,
        size.height * 0.9938657,
        size.width * 0.1211030,
        size.height * 0.9880242,
        size.width * 0.1200230,
        size.height * 0.9797273,
      )
      ..cubicTo(
        size.width * 0.1189440,
        size.height * 0.9714313,
        size.width * 0.1247270,
        size.height * 0.9638212,
        size.width * 0.1329410,
        size.height * 0.9627313,
      )
      ..cubicTo(
        size.width * 0.1590060,
        size.height * 0.9592707,
        size.width * 0.1831950,
        size.height * 0.9545758,
        size.width * 0.2056660,
        size.height * 0.9487687,
      )
      ..cubicTo(
        size.width * 0.2136920,
        size.height * 0.9466939,
        size.width * 0.2218620,
        size.height * 0.9515848,
        size.width * 0.2239160,
        size.height * 0.9596909,
      )
      ..close()
      ..moveTo(size.width * 0.07406840, size.height * 0.9835131)
      ..cubicTo(
        size.width * 0.07438930,
        size.height * 0.9918747,
        size.width * 0.06793870,
        size.height * 0.9989162,
        size.width * 0.05966070,
        size.height * 0.9992404,
      )
      ..cubicTo(
        size.width * 0.04678740,
        size.height * 0.9997444,
        size.width * 0.03357070,
        size.height,
        size.width * 0.02000000,
        size.height,
      )
      ..cubicTo(
        size.width * 0.01171570,
        size.height,
        size.width * 0.005000000,
        size.height * 0.9932162,
        size.width * 0.005000000,
        size.height * 0.9848485,
      )
      ..cubicTo(
        size.width * 0.005000000,
        size.height * 0.9764808,
        size.width * 0.01171570,
        size.height * 0.9696970,
        size.width * 0.02000000,
        size.height * 0.9696970,
      )
      ..cubicTo(
        size.width * 0.03319790,
        size.height * 0.9696970,
        size.width * 0.04602700,
        size.height * 0.9694485,
        size.width * 0.05849870,
        size.height * 0.9689596,
      )
      ..cubicTo(
        size.width * 0.06677670,
        size.height * 0.9686364,
        size.width * 0.07374750,
        size.height * 0.9751515,
        size.width * 0.07406840,
        size.height * 0.9835131,
      )
      ..close();

    final Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant VectorTwoCustomPainter oldDelegate) =>
      color != oldDelegate.color;
}
