import 'package:scoped_model/scoped_model.dart';

// Model containing Login's state (current user)
class UserModel extends Model {
  bool isLoading = false;

  //Funcations that modify the state
  void signUp() {}

  Future<void> signIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners(); // Everything inside the ScopedModelDescendant will be recreated
  }

  void recoverPass() {}

  bool isLoggedIn() {
    return false;
  }
}
