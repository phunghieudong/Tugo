import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugo_inter_app/nhandoan.dart';
import 'code.dart';



void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nhận Đoàn',
      home: nhandoan(),
    );
  }
}

class Homepage extends StatefulWidget{
  @override
  Homepagestate createState() =>Homepagestate();

}


class Homepagestate extends State<Homepage>{

  bool _ShowcossWord = false; // Cai bien de show pass

  final TextEditingController _CossController = new TextEditingController();


  var _CossErr = "Mã bạn không hợp lệ";
  var _CossOk = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding : const EdgeInsets.fromLTRB(70,0,0,40),
              child: Container(
                child: new Column(
                  children: <Widget>[
                    new Image.asset(
                        'images/49210885-2007912505958024-5202-2149-4597-1549009463.png', height: 150, width: 200,
                        fit: BoxFit.cover
                    ),
                  ],
                ),
              ),
              /*child: Container(
                    width: 70.0,
                    height: 70.0,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape : BoxShape.circle , color: Color(0xffd8d8d8)),

                    child: FlutterLogo()
                ),*/
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 0, 60),
              child: Text("Nhận Đoàn",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 30.0  ),),
            ),
            new Center(
              child: Text("Liên hệ phòng điều hành nếu chưa có mã Đoàn",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.purple,fontSize: 15.0  ),),

            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    controller: _CossController,
                    style: TextStyle(fontSize: 18,color: Colors.black ,fontWeight: FontWeight.bold),
                    obscureText: !_ShowcossWord,
                    decoration: InputDecoration(
                      errorText: _CossOk ? _CossErr : null,
                      labelText: "Mã Đoàn",
                      labelStyle:
                      TextStyle(color: Colors.purple , fontSize: 15),
                    ),
                  ),

                  GestureDetector(
                    onTap: Showpass,
                    child: Text(
                      _ShowcossWord ? "Ẩn Mã" :"Hiện Mã",
                      style: TextStyle (color: Colors.pink[900 ],fontSize: 13.0,fontWeight:FontWeight.bold),),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox (
                width: double.infinity,
                height: 56.0,//  color: Colors.purple[900],
                child: RaisedButton(
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  onPressed: () {
                    onSigninClicked();

                  },
                  child: Text("Nhận Đoàn",style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox (
                width: double.infinity,
                height: 56.0,//  color: Colors.purple[900],
                child: RaisedButton(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  onPressed: () {
                    onSigninClicked();

                  },
                  child: Text("Hủy",style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSigninClicked() {
    setState(() {

      if(_CossController.text.length<10)
      {
        _CossOk = true;
      }
      else {
        _CossOk =false;
        //Navigator.push(context, MaterialPageRoute(builder: gotoHome));

      }
      if(!_CossOk)
      {
        // Cai nay de chuyen mang hinh
        Navigator.push(context, MaterialPageRoute(builder: (context)=>nhandoan()));
      }


    });
  }

  Widget gotoHome(BuildContext context)
  {
    return nhandoan();
  }
  void Showpass (){
    setState(() {
      _ShowcossWord = !_ShowcossWord;
    });
  }
}

