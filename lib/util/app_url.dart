class AppUrl {
  static const String liveBaseURL = "https://api.pawana.com.br";
  // static const String localBaseURL = "http://127.0.0.0/api";  static const String baseURL = liveBaseURL;

  static const String palavrasExportRoute = "$liveBaseURL/words/export/all";
  static const String significadosExportRoute =
      "$liveBaseURL/meanings/export/all";
  static const String anexosExportRoute = "$liveBaseURL/attachments/export/all";
  static const String referenciasExportRoute =
      "$liveBaseURL/references/export/all";
  static const String categoriasExportRoute =
      "$liveBaseURL/categories/export/all";
  static const String usuariosExportRoute = "$liveBaseURL/users/export/all";
  static const String palavracategoriasExportRoute =
      "$liveBaseURL/wordcategories/export/all";

  // static const String login = "$baseURL/session";
  // static const String register = "$baseURL/registration";
  // static const String forgotPassword = "$baseURL/forgot-password";
}
