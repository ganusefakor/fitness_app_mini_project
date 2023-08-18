
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';




import '../model/user_model.dart';
import '../providers/user_provider.dart';


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<Map<String, dynamic>?> getCurrentUser(String? uid) async {
    if (uid != null) {
      final snap = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();
      return snap.data();
    }
    return null;
  }

  Future<bool> signUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    bool res = false;
    try {
      res = false;
      UserCredential cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (cred.user != null) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await _firebaseFirestore
                .collection('users')
                .doc(cred.user!.uid)
                .get();
        if (snapshot.data() != null) {
          UserModel user = UserModel.fromMap(snapshot.data()!);
          // ignore: use_build_context_synchronously
          Provider.of<UserProvider>(context, listen: false).setUserData(user);
        }
      }
      res = true;
    } on FirebaseAuthException catch (e) {
      res = false;
      showSnackBar(context, e.message!);
    } catch (e) {
      res = false;
      showSnackBar(context, e.toString());
    }
    return res;
  }

  Future<bool> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    
    required String dataeOfBith,
    required String firstname,
    required String lastname,
    required String gender,
    required double height,
    required double weight,

  }) async {
    bool res = false;
    try {
      res = false;
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      
      UserModel user = UserModel(
          dataeOfBith: dataeOfBith,
          firstname: firstname,
          gender: gender,
          height: height,
          lastname: lastname,
          weight: weight,
          email: email,
          uid: credential.user!.uid,
          password: password,
          );

      _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set(user.toMap());
      res = true;
    } on FirebaseAuthException catch (e) {
      res = false;
      showSnackBar(context, e.message!);
    } catch (e) {
      res = false;
      showSnackBar(context, e.toString());
    }
    return res;
  }
   signOut(BuildContext context)async{
    try{
      await FirebaseAuth.instance.signOut();
    }catch(err){
     showSnackBar(context, err.toString());
    }
  }
}
