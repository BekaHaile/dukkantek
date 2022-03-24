import 'package:dukkantek_test/core/adapters/repository_adapter.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class LoginRepository implements ILoginRepository {
  @override
  Future<Response<dynamic>> login(Map<String, dynamic> loginPayload) async {
    final dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: dio);
  Response<dynamic> response;

    // const path = 'https://example.com';

    // dioAdapter.onPost(
    //   path,
    //   (server) => server
    //       .reply(200, null),
    //       data: {"access_token": "a83373a8-2d58-11ea-978f-2e728ce88125"},
    // );

    // final response = await dio.post(path, data: loginPayload);

    // print(response.data);

    const signInRoute = '/signin';
      const accountRoute = '/account';

      const accessToken = <String, dynamic>{
        'token': 'ACCESS_TOKEN',
      };

      final headers = <String, dynamic>{
        'Authentication': 'Bearer $accessToken',
      };

      const userInformation = <String, dynamic>{
        'id': 1,
        'username': 'Dukkantek',
      };

      dioAdapter
        ..onPost(
          signInRoute,
          (server) => server.throws(
            401,
            DioError(
              requestOptions: RequestOptions(
                path: signInRoute,
              ),
            ),
          ),
        )
        ..onPost(
          signInRoute,
          (server) => server.reply(200, accessToken),
          data: loginPayload,
        )
        ..onGet(
          accountRoute,
          (server) => server.reply(200, userInformation),
          headers: headers,
        );


      // Returns an access token if user credentials are provided.
      response = await dio.post(signInRoute, data: loginPayload);

      //Returns user information if an access token is provided
       response = await dio.get(
        accountRoute,
        options: Options(headers: headers),
      );

      return response;
  }
}
