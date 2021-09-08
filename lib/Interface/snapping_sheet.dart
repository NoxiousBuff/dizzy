import 'dart:ui';
import 'package:dizzy/Themes/rolling_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

const kNotificationHeading = TextStyle(
    fontSize: 20.0,
    fontFamily: 'QuickSand',
    fontWeight: FontWeight.bold,
    color: Colors.white);

const kNotificationInput =
    TextStyle(fontSize: 18.0, fontFamily: 'QuickSand', color: Colors.white60);

class SnappingSheetExample extends StatelessWidget {
  final SnappingSheetController controller = SnappingSheetController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SnappingSheet(
          grabbingHeight: 50.0,
          snapPositions: [
            SnapPosition(positionFactor: 1.0),
            SnapPosition(positionFactor: 0.0),
          ],
          snappingSheetController: controller,
          sheetAbove: SnappingSheetContent(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 24.0, sigmaX: 24.0),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: ListView(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/img2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 5.0),
                        child: Text('Media, Docs & links'),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width / 5,
                        child: ListView.builder(
                          itemCount: 20,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image(
                                image: AssetImage('images/img$i.jpg'),
                                fit: BoxFit.cover,
                                height: MediaQuery.of(context).size.width / 5,
                                width: MediaQuery.of(context).size.width / 5,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        color: Colors.grey.shade900,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 5.0),
                              child: Text(
                                'About Something',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 5.0),
                                  child: Text('Mute Notifications'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 5.0),
                                  child: RollingSwitch(
                                    value: true,
                                    colorOn: Colors.greenAccent[700],
                                    colorOff: Colors.redAccent[700],
                                    iconOn: Icons.done,
                                    iconOff: Icons.remove_circle_outline,
                                    onChanged: (bool state) {
                                      //Use it to manage the different states
                                      print(
                                          'Current State of SWITCH IS: $state');
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 5.0),
                                  child: Text('Block'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 5.0),
                                  child: RollingSwitch(
                                    value: true,
                                    colorOn: Colors.greenAccent[700],
                                    colorOff: Colors.redAccent[700],
                                    iconOn: Icons.done,
                                    iconOff: Icons.remove_circle_outline,
                                    onChanged: (bool state) {
                                      //Use it to manage the different states
                                      print(
                                          'Current State of SWITCH IS: $state');
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 5.0),
                                  child: Text('Do Something'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 5.0),
                                  child: RollingSwitch(
                                    value: true,
                                    colorOn: Colors.greenAccent[700],
                                    colorOff: Colors.redAccent[700],
                                    iconOn: Icons.done,
                                    iconOff: Icons.remove_circle_outline,
                                    onChanged: (bool state) {
                                      //Use it to manage the different states
                                      print(
                                          'Current State of SWITCH IS: $state');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            heightBehavior: SnappingSheetHeight.fixed(),
          ),
          grabbing: AnimatedCrossFade(
            crossFadeState: CrossFadeState.showFirst,
            firstChild: Container(
              child: AppBar(
                actions: [
                  IconButton(
                    icon: Icon(Icons.call_outlined),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.video_call_outlined),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.ios_share),
                    onPressed: () {},
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                toolbarHeight: 50.0,
                leading: Icon(
                  Icons.arrow_back,
                  color: Colors.white60,
                ),
                titleSpacing: 0.0,
                elevation: 0.0,
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Center(
                        child: ClipOval(
                          child: Image(
                            height: 40.0,
                            width: 40.0,
                            image: AssetImage('images/img2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Samantha',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white70,
                          fontFamily: 'QuickSand'),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
            ),
            secondChild: Container(
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: () {}, child: Text('Drag Up')),
                )),
            duration: Duration(milliseconds: 2000),
          ),
          child: ChatScreen(),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              text[0] != 'r' ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Container(
              child: text[0] != 'r'
                  ? Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/img2.jpg'),
                      ),
                    )
                  : null,
            ),
            Container(
              constraints: BoxConstraints(minWidth: 128.0),
              decoration: BoxDecoration(
                borderRadius: text[0] != 'r'
                    ? BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.zero,
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                color: text[0] != 'r'
                    ? Colors.grey.shade900.withOpacity(0.5)
                    : Colors.deepOrangeAccent.withOpacity(0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(
                        'text',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _isComposing ? _handleSubmitted : null,
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a message'),
                focusNode: _focusNode,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.android
                    ? CupertinoButton(
                        child: Text('Send'),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      )
                    : IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      ))
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}
