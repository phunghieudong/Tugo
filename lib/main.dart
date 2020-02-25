import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
/*import 'loginPage.dart';
import 'package:google_sign_in/google_sign_in.dart';*/
import 'Firebase.dart';
import 'home.dart';
void main () =>runApp(MyApp());


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() =>LoginPageState();

}


class LoginPageState extends State<LoginPage>{

  bool _ShowpassWord = false; // Cai bien de show pass

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();


  var _EmailErr = "Email của bạn không hợp lệ";
  var _PassErr = "Mật khẩu của bạn không hợp lệ";
  var _EmailOK = false;
  var _PassOk = false;
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
                        'images/email-logo.png', height: 150, width: 200,
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
              child: Text("Đăng Nhập",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 30.0  ),),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child:TextField(
                controller: _emailController,
                style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  errorText: _EmailOK ? _EmailErr : null,
                  labelText: "Email",
                  labelStyle:
                  TextStyle(color: Colors.purple , fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    controller: _passController,
                    style: TextStyle(fontSize: 18,color: Colors.black ,fontWeight: FontWeight.bold),
                    obscureText: !_ShowpassWord,
                    decoration: InputDecoration(
                      errorText: _PassOk ? _PassErr : null,
                      labelText: "Mật Khẩu",
                      labelStyle:
                      TextStyle(color: Colors.purple , fontSize: 15),
                    ),
                  ),

                  GestureDetector(
                    onTap: Showpass,
                    child: Text(
                      _ShowpassWord ? "Ẩn Pass " :"Hiện Pass",
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
                    handleSignIn(_emailController.text.trim(), _passController.text.trim())
                        .then((FirebaseUser user) => print(user))
                        .catchError((e) => print(e));
                  },
                  child: Text("Đăng Nhập",style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
      if(_emailController.text.length<6 )
      {
        _EmailOK = true;
      }
      else {
        _EmailOK =false;
      }


      if(_passController.text.length<6 )
      {
        _PassOk = true;
      }
      else {
        _PassOk =false;
        //Navigator.push(context, MaterialPageRoute(builder: gotoHome));

      }
      if(!_EmailOK && !_PassOk)
      {
        // Cai nay de chuyen mang hinh
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
      }


    });
  }

  Widget gotoHome(BuildContext context)
  {
    return Homepage();
  }
  void Showpass (){
    setState(() {
      _ShowpassWord = !_ShowpassWord;
    });
  }
}