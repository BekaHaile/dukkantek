abstract class ILoginRepository {
  // Todo: Add Login request class signitures (interfaces) here.
  Future<String> login(Map<String, dynamic> loginPayload);
}