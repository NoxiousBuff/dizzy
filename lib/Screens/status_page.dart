import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, i) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/img${i + 9}.jpg'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              tileColor: Colors.transparent,
              title: Text('Status $i'),
              subtitle: Text('Description $i'),
              trailing: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                color: Colors.orange.withOpacity(0.5),
                child: Text('Comment'),
                onPressed: () {},
              ),
              onTap: () {},
              enableFeedback: true,
            );
          },
        ),
      ),
    );
  }
}
