import 'package:gaste_certo/src/data/repository/auth_repository.dart';
import 'package:gaste_certo/src/domain/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants/constants.dart';

class AuthenticationRepository extends GetxController
    implements ApiAuthRepository {
  static AuthenticationRepository get instance => Get.find();
  @override
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrlAuthApi}login').replace(
        queryParameters: {
          'usuario': email,
          'senha': password,
        },
      );

      var response = await http.get(url);
      if (response.statusCode == 200) {}
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> registerUser({required RegisterAccountModel registerModel}) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
