import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, i) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/img$i.jpg'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              tileColor: Colors.transparent,
              title: Text('Contact $i'),
              subtitle: Text('Description $i'),
              trailing: Icon(Icons.messenger_outline_sharp),
              onTap: () {},
              enableFeedback: true,
            );
          },
        ),
      ),
    );
  }
}
