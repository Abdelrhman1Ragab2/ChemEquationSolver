import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}


class _TestViewState extends State<TestView> {
 bool _isHovered=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          onEnter: (_) {

          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: GestureDetector(

            onTap: () {
              // Handle the item click here if needed
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _isHovered ? Colors.blue : Colors.black,
                ),
              ),
              child: Text('Item'),
            ),
          ),
        ),
      ),
    );
  }
}
