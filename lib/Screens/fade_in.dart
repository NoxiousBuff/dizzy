import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FadeInAnimationState();
  }
}

class _FadeInAnimationState extends State<FadeInAnimation> {
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 150.0,
              backgroundImage: AssetImage('images/img2.jpg'),
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    side: BorderSide(width: 1.0, color: Colors.grey)),
                onPressed: () {
                  setState(() {
                    _opacity = _opacity == 1.0 ? 0.0 : 1.0;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Text(
                    'Know Me',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 22.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 44.0),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 700),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 44.0, vertical: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    TextButton(
                      child: Text('m i working'),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Samantha',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '23',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Female',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FadeInMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Fade In Animation'),
      ),
      body: FadeInAnimation(),
    );
  }
}
