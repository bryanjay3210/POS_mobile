import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var logger = Logger();

  Future signInAnon() async{
    try {
      var result =  await _auth.signInAnonymously();
      logger.i(result);
      return result.user;
    } catch(e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future signInWithEmailAndPassword({required String email, required String password}) async{
    try {
      var result =  await _auth.signInWithEmailAndPassword(email: email, password: password);
      setUid(result.user!.uid);
      return result.user;
    } catch(e) {
      print(e);
      Fluttertoast.showToast(msg: 'Invalid username or password!');
    }
  }

  Future registerWithEmailAndPassword({required String email, required String password}) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      logger.i(result);
      return result;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await _auth.signOut();
    await prefs.remove('uid');
  }

  void setUid(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', value);
  }

}