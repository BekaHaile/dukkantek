import 'package:dukkantek_test/core/adapters/repository_adapter.dart';
import 'package:http/http.dart' as http;

class LoginRepository implements ILoginRepository {

  @override
  Future<String> login(Map<String, dynamic> loginPayload) async{
    var url = Uri.parse('https://example.com/whatsit/create');
    var response = await http.post(url, body: {loginPayload});

    
    return response.body;
  }

}