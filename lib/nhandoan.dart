import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đoàn Cũ',
      home: nhandoan(),

    );
  }
}

class nhandoan extends StatefulWidget {
  @override
  nhandoanstate createState() {
    return nhandoanstate();
  }
}

class nhandoanstate extends State<nhandoan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new Scaffold(
        appBar: AppBar(title: Text('Đoàn Cũ')),
        body: _buildBody(context),
       
      ),
    );
  }
  Widget _buildBody(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      
      stream: Firestore.instance.collection('tour').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );

  }
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(

        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(

          trailing: Text(record.name.toString()),
          onTap: () => print(record),
        ),
      ),
    );
  }
}

class Record {

  final String name;

  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : //assert(map['email'] != null),
        assert(map['name'] != null),
        name = map['name'];




  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name>";
}