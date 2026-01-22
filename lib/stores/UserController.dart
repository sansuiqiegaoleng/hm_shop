import 'package:get/get.dart';
import 'package:hm_shop/viewmodels/user.dart';

class UserController extends GetxController {
  var users = UserInfo.fromJSON({}).obs;
  updateUserInfo(UserInfo newUser) {
    users.value = newUser;
  }
}
