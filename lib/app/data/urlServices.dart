import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlListService {
  static final baseUrl = dotenv.env['PROD'] == "true"
      ? 'http://168.138.169.44:69/'
      : 'http://168.138.169.44:69/';

  static const urlFile = 'http://158.178.242.173:8082';

  static const register = 'api/auth/register';
  static const email = 'api/auth/verifikasi_email';
  static const verifikasiOtp = 'api/auth/verifikasi_code_email';
  static const login = 'api/auth/login';
  static const productProvider = 'api/ppob/product_provider';
  static const checkbalance = 'api/ppob/cek_saldo_user';
  static const pulsatransaksi = 'api/ppob/transaksi_pulsa';
  static const profile = 'api/profile/ProfileUser';
  static const updateprofile = 'api/profile/update_profile';
}
