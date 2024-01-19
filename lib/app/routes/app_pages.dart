import 'package:get/get.dart';
import 'package:ppob_mpay1/app/modules/akun/views/akun_view.dart';

import '../modules/akun/bindings/akun_binding.dart';
import '../modules/ewallet/brizzi/bindings/brizzi_binding.dart';
import '../modules/ewallet/brizzi/views/brizzi_view.dart';
import '../modules/ewallet/dana/bindings/dana_binding.dart';
import '../modules/ewallet/dana/views/dana_view.dart';
import '../modules/ewallet/emoney/bindings/emoney_binding.dart';
import '../modules/ewallet/emoney/views/emoney_view.dart';
import '../modules/ewallet/ewallet.dart';
import '../modules/ewallet/gopay/bindings/gopay_binding.dart';
import '../modules/ewallet/gopay/views/customergopay_view.dart';
import '../modules/ewallet/ovo/bindings/ovo_binding.dart';
import '../modules/ewallet/ovo/views/ovo_view.dart';
import '../modules/fingerprint/bindings/fingerprint_binding.dart';
import '../modules/fingerprint/views/fingerprint_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/lupapassword/bindings/lupapassword_binding.dart';
import '../modules/lupapassword/views/lupapassword_view.dart';
import '../modules/multifinance/bindings/multifinance_binding.dart';
import '../modules/multifinance/views/multifinance_view.dart';
import '../modules/paketdata/bindings/paketdata_binding.dart';
import '../modules/paketdata/views/paketdata_view.dart';
import '../modules/pin/bindings/pin_binding.dart';
import '../modules/pin/views/pin_view.dart';
import '../modules/promo/bindings/promo_binding.dart';
import '../modules/promo/views/promo_view.dart';
import '../modules/pulsa/bindings/pulsa_binding.dart';
import '../modules/pulsa/views/pulsa_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/riwayat/bindings/riwayat_binding.dart';
import '../modules/riwayat/views/riwayat_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/tagihan/bindings/tagihan_binding.dart';
import '../modules/tagihan/bpjs/bindings/bpjs_binding.dart';
import '../modules/tagihan/bpjs/views/bpjs_view.dart';
import '../modules/tagihan/pdam/bindings/pdam_binding.dart';
import '../modules/tagihan/pdam/views/pdam_view.dart';
import '../modules/tagihan/pln/bindings/pln_binding.dart';
import '../modules/tagihan/pln/views/pln_view.dart';
import '../modules/tagihan/telco/bindings/telco_binding.dart';
import '../modules/tagihan/telco/views/telco_view.dart';
import '../modules/tagihan/views/tagihan_view.dart';
import '../modules/transferbank/bindings/transferbank_binding.dart';
import '../modules/transferbank/views/transferbank_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LUPAPASSWORD,
      page: () => const LupapasswordView(),
      binding: LupapasswordBinding(),
    ),
    GetPage(
      name: _Paths.PIN,
      page: () => const PinView(),
      binding: PinBinding(),
    ),
    GetPage(
      name: _Paths.PULSA,
      page: () => PulsaView(),
      binding: PulsaBinding(),
    ),
    GetPage(
      name: _Paths.EWALLET,
      page: () => const EwalletView(),
      children: [
        GetPage(
          name: _Paths.OVO,
          page: () => const OvoView(),
          binding: OvoBinding(),
        ),
        GetPage(
          name: _Paths.DANA,
          page: () => const DanaView(),
          binding: DanaBinding(),
        ),
        GetPage(
          name: _Paths.GOPAY,
          page: () => const GopayView(),
          binding: GopayBinding(),
        ),
        GetPage(
          name: _Paths.EMONEY,
          page: () => const EmoneyView(),
          binding: EmoneyBinding(),
        ),
        GetPage(
          name: _Paths.BRIZZI,
          page: () => const BrizziView(),
          binding: BrizziBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PAKETDATA,
      page: () => const PaketdataView(),
      binding: PaketdataBinding(),
    ),
    GetPage(
      name: _Paths.TAGIHAN,
      page: () => const TagihanView(),
      binding: TagihanBinding(),
      children: [
        GetPage(
          name: _Paths.PLN,
          page: () => const PlnView(),
          binding: PlnBinding(),
        ),
        GetPage(
          name: _Paths.BPJS,
          page: () => const BpjsView(),
          binding: BpjsBinding(),
        ),
        GetPage(
          name: _Paths.PDAM,
          page: () => PdamView(),
          binding: PdamBinding(),
        ),
        GetPage(
          name: _Paths.TELCO,
          page: () => const TelcoView(),
          binding: TelcoBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MULTIFINANCE,
      page: () => const MultifinanceView(),
      binding: MultifinanceBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFERBANK,
      page: () => const TransferbankView(),
      binding: TransferbankBinding(),
    ),
    GetPage(
      name: _Paths.AKUN,
      page: () => AkunView(),
      binding: AkunBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT,
      page: () => const RiwayatView(),
      binding: RiwayatBinding(),
    ),
    GetPage(
      name: _Paths.PROMO,
      page: () => const PromoView(),
      binding: PromoBinding(),
    ),
    GetPage(
      name: _Paths.FINGERPRINT,
      page: () => FingerprintView(),
      binding: FingerprintBinding(),
    ),
  ];
}
