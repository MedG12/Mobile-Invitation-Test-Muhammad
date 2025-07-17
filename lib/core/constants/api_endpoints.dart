class ApiEndpoints {
  static const String apiBaseURL = "https://reqres.in/api/";
  static String getUsers([int page = 1, int perPage = 10]) =>
      "${apiBaseURL}users?page=$page&per_page=$perPage";
}
