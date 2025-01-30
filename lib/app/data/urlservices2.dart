import 'package:flutter_dotenv/flutter_dotenv.dart';

// class Urlservice2 {
//   static final urlbase = dotenv.env['PROD'] == "true"
//       ? 'http://192.168.50.128:3002/'
//       : 'http://192.168.50.128:3002/';
class UrlListService2 {
  static final baseUrl = dotenv.env['PROD'] == "true"
      ? 'http://192.168.50.92:3002/'
      : 'http://192.168.50.92:3002/';

  static const urlFile = 'http://192.168.50.92:3002/';
  static const loginGoto = 'api/v1/auth/Login';
  static const registrasiGoto = 'api/v1/auth/register';

  // verifikasi email
  static const emailGoto = 'api/v1/auth/verifikasi-email';
  static const otpGoto = 'api/v1/auth/verifikasi-email-code';

  //get all product
  static const getProduct = 'api/v1/goto/products-list';

  //inquiry
  static const inquiryGoto = 'api/v1/goto/inquiry';

  //payment
  static const paymentGoto = 'api/v1/goto/payment';

  //cek status
  static const cekStatus = 'api/v1/goto/check-status/order-detail';

  // history
  // static const history = ''
}
