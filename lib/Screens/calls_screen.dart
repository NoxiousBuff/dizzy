import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 11,
          itemBuilder: (context, i) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/img${i + 6}.jpg'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              tileColor: Colors.transparent,
              title: Text('Call $i'),
              subtitle: Text('Description $i'),
              trailing: Icon(Icons.call),
              onTap: () {},
              enableFeedback: true,
            );
          },
        ),
      ),
    );
  }
}
