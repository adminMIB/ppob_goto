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

  //pulsa,paketdata
  static const productProvider = 'api/ppob/product_provider';

  static const pulsatransaksi = 'api/ppob/transaksi_pulsa';

  //profile
  static const profile = 'api/profile/ProfileUser';
  static const updateprofile = 'api/profile/update_profile';

  //pdam
  static const pdam = 'api/ppob/product_pdam';
  static const pdaminqury = 'api/ppob/product_pdam_inquiry';
  static const pdampayment = 'api/ppob/product_pdam_payment';

  //Riwayat Rika
  static const riwayat = 'api/ppob/transaksi_history';

  //Topup saldo
  static const checkbalance = 'api/ppob/cek_saldo_user';
  static const topupsaldo = 'api/ppob/inquiry_topSaldo';
  static const uploadbukti = 'api/ppob/payment_topSaldo';

  //PLN Prabayar Rika
  static const plnprbayarinquiry = 'api/ppob/product_pln_prabayar_inquiry';
  static const plnprbayarpayment = 'api/ppob/product_pln_prabayar_payment';
}
