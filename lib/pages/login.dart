import 'package:flutter/material.dart';
import 'package:online_shop/Homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences preferences;
  bool loading = false;
  bool isloggedin = false;

  @override
  void initState() {
    super.initState();
    issignedin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.red.shade900),
        ),
        elevation: 0.5,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: FlatButton(
              color: Colors.red.shade900,
              onPressed: () {
                handleSignIn();
              },
              child: Text(
                "Sign in/ Sign up with google",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Visibility(
              //visible: loading ?? true,
              child: Container(
            color: Colors.white.withOpacity(0.7),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          )),
        ],
      ),
    );
  }

  void issignedin() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isloggedin = await googleSignIn.isSignedIn();

    if (isloggedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });
    GoogleSignInAccount? googleuser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleuser.authentication;
    User firebaseUser = await firebaseAuth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.idToken);

    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> document = result.docs;
      if (document.length == 0) {
        Firestore.instance
                    .collection("users")
                    .document(firebaseUser.uid)
                    .setData({
                  "uid": firebaseUser.uid,
                  "username": firebaseUser.displayName,
                  "profile": firebaseUser.photoURL,
                });
                await preferences.setString("id", firebaseUser.uid);
                await preferences.setString("username", firebaseUser.displayName);
                await preferences.setString("photoUrl", firebaseUser.displayName);
              } else {
                await preferences.setString("id", document[0]["id"]);
                await preferences.setString("username", document[0]["username"]);
                await preferences.setString("photoUrl", document[0]["photoUrl"]);
              }
              Fluttertoast.showToast(msg: "Login was successful");
              setState(() {
                loading = false;
              });
            } else {}
          }
        }
        
        mixin Firestore {
  static var instance;
}
