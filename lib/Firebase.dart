import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> handleSignIn(String email,String pass) async {

  final FirebaseUser user = (await _auth.signInWithEmailAndPassword(email:email.trim() , password: pass.trim() )).user;
  print("Đăng nhập được rồi nhaaaaaaa -_- " );
  return user;
}