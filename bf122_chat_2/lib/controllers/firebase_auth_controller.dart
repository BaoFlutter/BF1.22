import 'dart:async';
import 'dart:io';

import 'package:bf122_chat_1/data_sources/firebase_services.dart';
import 'package:bf122_chat_1/models/app_user.dart';
import 'package:flutter/material.dart';
enum AuthStatus {none, authenticate, unauthenticate}

class FirebaseAuthController with ChangeNotifier  {

  AuthStatus authStatus = AuthStatus.none;
  AppUser? appUser;
  bool isLoading = false;

  FirebaseServices _firebaseService = FirebaseServices();
  late StreamSubscription _authStreamSubscription;

  FirebaseAuthController() {
    _init();
  }

  void _init() {
    _authStreamSubscription =
        _firebaseService.userChangeStream().listen((user) async {
          if (user != null) {
            await _firebaseService.getUser(user.uid).then((value) async {
              if (value != null) {
                appUser = value;
                authStatus = AuthStatus.authenticate;
              }
            });
          } else {
            appUser = null;
            authStatus = AuthStatus.unauthenticate;
          }
          notifyListeners();
        });
  }

  _loading() {
    isLoading = true;
    notifyListeners();
  }

  _unLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    _loading();
    await _firebaseService.signInWithEmailAndPassword(
        email: email, password: password);
    _unLoading();
  }

  Future signInWithGoogle() async {
    _loading();
    await _firebaseService.signInWithGoogle();
    _unLoading();
  }

  Future<bool> createAccount({required String name,
    required String email,
    required String password,
    File? file}) async {
    bool created = false;
    _loading();
    await _firebaseService.createAccountWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        onDone: (user) {
          appUser = user;
          authStatus = AuthStatus.authenticate;
          _unLoading();
          created = true;
        },
        onError: () {
          created = false;
        });
    return created;
  }

  Future signOut() async {
    _loading();
    await _firebaseService.signOut();
    _unLoading();
  }

  @override
  void dispose() {
    super.dispose();
    _authStreamSubscription.cancel();
  }

}