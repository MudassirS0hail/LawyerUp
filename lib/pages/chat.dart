import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iec_project/controllers/firestore_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FirestoreController _firestoreController = Get.find();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _firestoreController.reference.collection('chat').add({
        'message': _messageController.text,
        'user': FirebaseAuth.instance.currentUser!.displayName!,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 35, 66, 80),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.people), text: 'Direct Chat'),
                Tab(
                  icon: Icon(Icons.maps_home_work_outlined),
                  text: 'Global Chat',
                ),

                // Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text(
              'Chat',
              style: TextStyle(fontSize: 24),
            ),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.people),
              Column(
                children: <Widget>[
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _firestoreController.reference
                          .collection('chat')
                          .orderBy('timestamp', descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc = snapshot.data!.docs[index];
                            return ListTile(
                              title: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${doc['user']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('${doc['message']}'))
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter message...',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: _sendMessage,
                      ),
                    ),
                  ),
                ],
              ),

              // Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
