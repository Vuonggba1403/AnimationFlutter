// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';

// class AnimationText extends StatelessWidget {
//   const AnimationText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         title: const Text('Flutter in animation'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 250,
//               width: 350,
//               color: const Color.fromARGB(255, 121, 205, 42),
//               child: DefaultTextStyle(
//                 style: const TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//                 child: Center(
//                   child: AnimatedTextKit(
//                     repeatForever: true,
//                     animatedTexts: [
//                       RotateAnimatedText('AWESOME'),
//                       RotateAnimatedText('OPTIMISTIC'),
//                       RotateAnimatedText('DIFFERENT'),
//                     ],
//                     onTap: () {
//                       print("Tap Event");
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

class AnimationText extends StatelessWidget {
  const AnimationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
        child: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                'Larry Page',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                'Bill Gates',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                'Steve Jobs',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              )
            ],
            // repeatForever: true,
            // isRepeatingAnimation: true,
            isRepeatingAnimation: true,
          ),
        ),
      ),
    );
  }
}
