import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    const MaterialApp(
      home: BackgroundScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class BackgroundScreen extends StatefulWidget {
  const BackgroundScreen({super.key});

  @override
  State<BackgroundScreen> createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        vsync: this, //chạy các hoạt ảnh
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            spawnMaxRadius: 40, // bán kính tối đa các hạt xuất hiện
            spawnMinSpeed: 20, // tốc độ tối thiểu của hạt
            particleCount: 100, // số lượng hạt xuất hiện
            spawnMaxSpeed: 40, // Tốc độ tối đa của hạt
            spawnOpacity: 0.1, // độ trong suốt của hạt
            baseColor: Colors.red,
            // image: Image(
            //   image: AssetImage("assets/1.png"),
            // ),
          ),
        ),
        child: const Center(child: Icon(Icons.abc_outlined)),
      ),
    );
  }
}
