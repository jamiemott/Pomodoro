import 'package:firebase_auth/firebase_auth.dart';
import 'category.dart';
import 'task.dart';

class User {
  FirebaseUser firebaseUser;
  String uid;
  String username;
  String email;
  int level;
  List<Task> tasks;
  List<Category> categories;

  User.fromFirebaseUser(FirebaseUser user) {
    firebaseUser = user;
    email = firebaseUser.email;
    username = user.displayName;
    uid = user.uid;
    level = 1;
    tasks = [];
    categories = [];
    print("user object created: ${user.uid}");
  }

  void addTask(Task job) {
    tasks.add(job);
  }

  void changeName(String newName) {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = newName;
    firebaseUser.updateProfile(updateInfo);
    username = newName;
  }

  void changeEmail(String newEmail) {
    firebaseUser.updateEmail(newEmail);
    email = newEmail;
  }

  void changePassword(String newPassword) {
    firebaseUser.updatePassword(newPassword);
  }
}
