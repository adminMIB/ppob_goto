import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urlservice2 {
  static final urlbase = dotenv.env['PROD'] == "true"
      ? 'http://123.176.120.84:3003/'
      : 'http://123.176.120.84:3003/';

  static const urlFile = 'http://158.178.242.173:8082';
  static const loginV1 = 'api/v1/auth/Login';
  static const registrasiV1 = 'api/v1/auth/register';

  // verifikasi email
  static const email = 'api/v1/auth/verifikasi-email';
  static const otp = 'api/v1/auth/verifikasi-email-code';

  //pulsa
  static const get_product = 'api/v1/goto/products-list';
}
