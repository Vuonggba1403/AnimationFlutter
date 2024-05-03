import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HideShow(),
    debugShowCheckedModeBanner: false,
  ));
}

class HideShow extends StatelessWidget {
  const HideShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerIsScrolled) => [
          const SliverAppBar(
            floating: true,
            snap: true,
            title: Text('Hide on Scroll and Show'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          )
        ],
        body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Roll: No $index"),
            );
          },
        ),
      ),
    );
  }
}
