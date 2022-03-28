import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger/screens/chat_page.dart';

class ShowMessages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Messages").orderBy("time").snapshots(),
      builder: (context, snapshot){
        if  (!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          primary: true,
          physics: ScrollPhysics(),
          itemBuilder: (context, i){
            QueryDocumentSnapshot x = snapshot.data!.docs[i];
            return ListTile(
                title: Column(
                  crossAxisAlignment: loginUser!.email == x['user']
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: loginUser!.email==x['user']
                              ? Colors.blue.withOpacity(0.2)
                              :Colors.amber.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(x['messages'],),
                            SizedBox(
                              height: 5,
                            ),
                            Text("User: " + x['user'],
                            style: TextStyle(
                              fontSize: 13, color: Colors.green
                            ),),
                          ],
                        ))],
                )
              );
            });
      },
    );
  }
}
