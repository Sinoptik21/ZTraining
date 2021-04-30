import 'package:api_sdk/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class AuthService {
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;
  String errorMessage;

  //Create User Object from Firebase User
  User _userFromFirebaseUser(firebase.User user, token) {
    return user != null
        ? User(uid: user.uid, email: user.email, token: token)
        : null;
  }

  //Signin With email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      firebase.UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      // TODO: проверить
      // final res = await userCredential.user.getIdToken();
      final res = await userCredential.user.getIdTokenResult();
      return _userFromFirebaseUser(userCredential.user, res.token);
    } catch (err) {
      errorMessage = getMessageFromErrorCode(err.code);
      print(errorMessage);
      return Future.error(errorMessage);
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      firebase.UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // TODO: проверить
      // final res = await userCredential.user.getIdToken();
      final res = await userCredential.user.getIdTokenResult();
      return _userFromFirebaseUser(userCredential.user, res.token);
    } catch (err) {
      errorMessage = getMessageFromErrorCode(err.code);
      print(errorMessage);
      return Future.error(errorMessage);
    }
  }

  Future getCurrentUser() async {
    try {
      // TODO: проверить
      // final firebase.User user = await _auth.currentUser;
      final firebase.User user = _auth.currentUser;
      if (user != null) {
        // TODO: проверить
        // final res = await user.getIdToken();
        final res = await user.getIdTokenResult();
        return _userFromFirebaseUser(user, res.token);
      } else {
        return null;
      }
    } catch (err) {
      errorMessage = getMessageFromErrorCode(err.code);
      print(errorMessage);
      return Future.error(errorMessage);
    }
  }

  //signout
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  //getMessageFromErrorCode
  String getMessageFromErrorCode(errorCode) {
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email уже используется. Перейдите на экран входа.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Неверный email и/или пароль.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "Пользователь с данным email не найден. Для продолжения зарегистрируйтесь";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "Пользователь заблокирован.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Слишком много попыток входа в данный аккаунт.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Ошибка сервера, пожалуйста, попробуйте снова.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email неверный.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "Не найден аккаунт с данным email";
        break;
      default:
        return "Ошибка входа. Попробуйте еще раз.";
        break;
    }
  }
}
