/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:general_lib/language/scheme/scheme.dart';
/// example:
/// 
/// "dz": {
///   "@type": "languageDetailData",
///   "name": "Algeria",
///   "flag": "🇩🇿",
///   "code": "DZ",
///   "dial_code": "+213"
/// },
final Map<String, Map> languageCodeJson = {
  "dz": {"@type": "languageDetailData", "name": "Algeria", "flag": "🇩🇿", "code": "DZ", "dial_code": "+213"},
  "as": {"@type": "languageDetailData", "name": "American Samoa", "flag": "🇦🇸", "code": "AS", "dial_code": "+1684"},
  "ad": {"@type": "languageDetailData", "name": "Andorra", "flag": "🇦🇩", "code": "AD", "dial_code": "+376"},
  "ao": {"@type": "languageDetailData", "name": "Angola", "flag": "🇦🇴", "code": "AO", "dial_code": "+244"},
  "ai": {"@type": "languageDetailData", "name": "Anguilla", "flag": "🇦🇮", "code": "AI", "dial_code": "+1264"},
  "aq": {"@type": "languageDetailData", "name": "Antarctica", "flag": "🇦🇶", "code": "AQ", "dial_code": "+672"},
  "ag": {"@type": "languageDetailData", "name": "Antigua and Barbuda", "flag": "🇦🇬", "code": "AG", "dial_code": "+1268"},
  "ar": {"@type": "languageDetailData", "name": "Argentina", "flag": "🇦🇷", "code": "AR", "dial_code": "+54"},
  "am": {"@type": "languageDetailData", "name": "Armenia", "flag": "🇦🇲", "code": "AM", "dial_code": "+374"},
  "aw": {"@type": "languageDetailData", "name": "Aruba", "flag": "🇦🇼", "code": "AW", "dial_code": "+297"},
  "au": {"@type": "languageDetailData", "name": "Australia", "flag": "🇦🇺", "code": "AU", "dial_code": "+61"},
  "at": {"@type": "languageDetailData", "name": "Austria", "flag": "🇦🇹", "code": "AT", "dial_code": "+43"},
  "az": {"@type": "languageDetailData", "name": "Azerbaijan", "flag": "🇦🇿", "code": "AZ", "dial_code": "+994"},
  "bs": {"@type": "languageDetailData", "name": "Bahamas", "flag": "🇧🇸", "code": "BS", "dial_code": "+1242"},
  "bh": {"@type": "languageDetailData", "name": "Bahrain", "flag": "🇧🇭", "code": "BH", "dial_code": "+973"},
  "bd": {"@type": "languageDetailData", "name": "Bangladesh", "flag": "🇧🇩", "code": "BD", "dial_code": "+880"},
  "bb": {"@type": "languageDetailData", "name": "Barbados", "flag": "🇧🇧", "code": "BB", "dial_code": "+1246"},
  "by": {"@type": "languageDetailData", "name": "Belarus", "flag": "🇧🇾", "code": "BY", "dial_code": "+375"},
  "be": {"@type": "languageDetailData", "name": "Belgium", "flag": "🇧🇪", "code": "BE", "dial_code": "+32"},
  "bz": {"@type": "languageDetailData", "name": "Belize", "flag": "🇧🇿", "code": "BZ", "dial_code": "+501"},
  "bj": {"@type": "languageDetailData", "name": "Benin", "flag": "🇧🇯", "code": "BJ", "dial_code": "+229"},
  "bm": {"@type": "languageDetailData", "name": "Bermuda", "flag": "🇧🇲", "code": "BM", "dial_code": "+1441"},
  "bt": {"@type": "languageDetailData", "name": "Bhutan", "flag": "🇧🇹", "code": "BT", "dial_code": "+975"},
  "bo": {"@type": "languageDetailData", "name": "Bolivia, Plurinational State of bolivia", "flag": "🇧🇴", "code": "BO", "dial_code": "+591"},
  "ba": {"@type": "languageDetailData", "name": "Bosnia and Herzegovina", "flag": "🇧🇦", "code": "BA", "dial_code": "+387"},
  "bw": {"@type": "languageDetailData", "name": "Botswana", "flag": "🇧🇼", "code": "BW", "dial_code": "+267"},
  "bv": {"@type": "languageDetailData", "name": "Bouvet Island", "flag": "🇧🇻", "code": "BV", "dial_code": "+47"},
  "br": {"@type": "languageDetailData", "name": "Brazil", "flag": "🇧🇷", "code": "BR", "dial_code": "+55"},
  "io": {"@type": "languageDetailData", "name": "British Indian Ocean Territory", "flag": "🇮🇴", "code": "IO", "dial_code": "+246"},
  "bn": {"@type": "languageDetailData", "name": "Brunei Darussalam", "flag": "🇧🇳", "code": "BN", "dial_code": "+673"},
  "bg": {"@type": "languageDetailData", "name": "Bulgaria", "flag": "🇧🇬", "code": "BG", "dial_code": "+359"},
  "bf": {"@type": "languageDetailData", "name": "Burkina Faso", "flag": "🇧🇫", "code": "BF", "dial_code": "+226"},
  "bi": {"@type": "languageDetailData", "name": "Burundi", "flag": "🇧🇮", "code": "BI", "dial_code": "+257"},
  "kh": {"@type": "languageDetailData", "name": "Cambodia", "flag": "🇰🇭", "code": "KH", "dial_code": "+855"},
  "cm": {"@type": "languageDetailData", "name": "Cameroon", "flag": "🇨🇲", "code": "CM", "dial_code": "+237"},
  "ca": {"@type": "languageDetailData", "name": "Canada", "flag": "🇨🇦", "code": "CA", "dial_code": "+1"},
  "cv": {"@type": "languageDetailData", "name": "Cape Verde", "flag": "🇨🇻", "code": "CV", "dial_code": "+238"},
  "ky": {"@type": "languageDetailData", "name": "Cayman Islands", "flag": "🇰🇾", "code": "KY", "dial_code": "+345"},
  "cf": {"@type": "languageDetailData", "name": "Central African Republic", "flag": "🇨🇫", "code": "CF", "dial_code": "+236"},
  "td": {"@type": "languageDetailData", "name": "Chad", "flag": "🇹🇩", "code": "TD", "dial_code": "+235"},
  "cl": {"@type": "languageDetailData", "name": "Chile", "flag": "🇨🇱", "code": "CL", "dial_code": "+56"},
  "cn": {"@type": "languageDetailData", "name": "China", "flag": "🇨🇳", "code": "CN", "dial_code": "+86"},
  "cx": {"@type": "languageDetailData", "name": "Christmas Island", "flag": "🇨🇽", "code": "CX", "dial_code": "+61"},
  "cc": {"@type": "languageDetailData", "name": "Cocos (Keeling) Islands", "flag": "🇨🇨", "code": "CC", "dial_code": "+61"},
  "co": {"@type": "languageDetailData", "name": "Colombia", "flag": "🇨🇴", "code": "CO", "dial_code": "+57"},
  "km": {"@type": "languageDetailData", "name": "Comoros", "flag": "🇰🇲", "code": "KM", "dial_code": "+269"},
  "cg": {"@type": "languageDetailData", "name": "Congo", "flag": "🇨🇬", "code": "CG", "dial_code": "+242"},
  "cd": {"@type": "languageDetailData", "name": "Congo, The Democratic Republic of the Congo", "flag": "🇨🇩", "code": "CD", "dial_code": "+243"},
  "ck": {"@type": "languageDetailData", "name": "Cook Islands", "flag": "🇨🇰", "code": "CK", "dial_code": "+682"},
  "cr": {"@type": "languageDetailData", "name": "Costa Rica", "flag": "🇨🇷", "code": "CR", "dial_code": "+506"},
  "ci": {"@type": "languageDetailData", "name": "Cote d'Ivoire", "flag": "🇨🇮", "code": "CI", "dial_code": "+225"},
  "hr": {"@type": "languageDetailData", "name": "Croatia", "flag": "🇭🇷", "code": "HR", "dial_code": "+385"},
  "cu": {"@type": "languageDetailData", "name": "Cuba", "flag": "🇨🇺", "code": "CU", "dial_code": "+53"},
  "cy": {"@type": "languageDetailData", "name": "Cyprus", "flag": "🇨🇾", "code": "CY", "dial_code": "+357"},
  "cz": {"@type": "languageDetailData", "name": "Czech Republic", "flag": "🇨🇿", "code": "CZ", "dial_code": "+420"},
  "dk": {"@type": "languageDetailData", "name": "Denmark", "flag": "🇩🇰", "code": "DK", "dial_code": "+45"},
  "dj": {"@type": "languageDetailData", "name": "Djibouti", "flag": "🇩🇯", "code": "DJ", "dial_code": "+253"},
  "dm": {"@type": "languageDetailData", "name": "Dominica", "flag": "🇩🇲", "code": "DM", "dial_code": "+1767"},
  "do": {"@type": "languageDetailData", "name": "Dominican Republic", "flag": "🇩🇴", "code": "DO", "dial_code": "+1849"},
  "ec": {"@type": "languageDetailData", "name": "Ecuador", "flag": "🇪🇨", "code": "EC", "dial_code": "+593"},
  "eg": {"@type": "languageDetailData", "name": "Egypt", "flag": "🇪🇬", "code": "EG", "dial_code": "+20"},
  "sv": {"@type": "languageDetailData", "name": "El Salvador", "flag": "🇸🇻", "code": "SV", "dial_code": "+503"},
  "gq": {"@type": "languageDetailData", "name": "Equatorial Guinea", "flag": "🇬🇶", "code": "GQ", "dial_code": "+240"},
  "en": {"@type": "languageDetailData", "name": "Inggris", "flag": "🇺🇸", "code": "EN", "dial_code": "+1"},
  "er": {"@type": "languageDetailData", "name": "Eritrea", "flag": "🇪🇷", "code": "ER", "dial_code": "+291"},
  "ee": {"@type": "languageDetailData", "name": "Estonia", "flag": "🇪🇪", "code": "EE", "dial_code": "+372"},
  "et": {"@type": "languageDetailData", "name": "Ethiopia", "flag": "🇪🇹", "code": "ET", "dial_code": "+251"},
  "fk": {"@type": "languageDetailData", "name": "Falkland Islands (Malvinas)", "flag": "🇫🇰", "code": "FK", "dial_code": "+500"},
  "fo": {"@type": "languageDetailData", "name": "Faroe Islands", "flag": "🇫🇴", "code": "FO", "dial_code": "+298"},
  "fj": {"@type": "languageDetailData", "name": "Fiji", "flag": "🇫🇯", "code": "FJ", "dial_code": "+679"},
  "fi": {"@type": "languageDetailData", "name": "Finland", "flag": "🇫🇮", "code": "FI", "dial_code": "+358"},
  "fr": {"@type": "languageDetailData", "name": "France", "flag": "🇫🇷", "code": "FR", "dial_code": "+33"},
  "gf": {"@type": "languageDetailData", "name": "French Guiana", "flag": "🇬🇫", "code": "GF", "dial_code": "+594"},
  "pf": {"@type": "languageDetailData", "name": "French Polynesia", "flag": "🇵🇫", "code": "PF", "dial_code": "+689"},
  "tf": {"@type": "languageDetailData", "name": "French Southern Territories", "flag": "🇹🇫", "code": "TF", "dial_code": "+262"},
  "ga": {"@type": "languageDetailData", "name": "Gabon", "flag": "🇬🇦", "code": "GA", "dial_code": "+241"},
  "gm": {"@type": "languageDetailData", "name": "Gambia", "flag": "🇬🇲", "code": "GM", "dial_code": "+220"},
  "ge": {"@type": "languageDetailData", "name": "Georgia", "flag": "🇬🇪", "code": "GE", "dial_code": "+995"},
  "de": {"@type": "languageDetailData", "name": "Germany", "flag": "🇩🇪", "code": "DE", "dial_code": "+49"},
  "gh": {"@type": "languageDetailData", "name": "Ghana", "flag": "🇬🇭", "code": "GH", "dial_code": "+233"},
  "gi": {"@type": "languageDetailData", "name": "Gibraltar", "flag": "🇬🇮", "code": "GI", "dial_code": "+350"},
  "gr": {"@type": "languageDetailData", "name": "Greece", "flag": "🇬🇷", "code": "GR", "dial_code": "+30"},
  "gl": {"@type": "languageDetailData", "name": "Greenland", "flag": "🇬🇱", "code": "GL", "dial_code": "+299"},
  "gd": {"@type": "languageDetailData", "name": "Grenada", "flag": "🇬🇩", "code": "GD", "dial_code": "+1473"},
  "gp": {"@type": "languageDetailData", "name": "Guadeloupe", "flag": "🇬🇵", "code": "GP", "dial_code": "+590"},
  "gu": {"@type": "languageDetailData", "name": "Guam", "flag": "🇬🇺", "code": "GU", "dial_code": "+1671"},
  "gt": {"@type": "languageDetailData", "name": "Guatemala", "flag": "🇬🇹", "code": "GT", "dial_code": "+502"},
  "gg": {"@type": "languageDetailData", "name": "Guernsey", "flag": "🇬🇬", "code": "GG", "dial_code": "+44"},
  "gn": {"@type": "languageDetailData", "name": "Guinea", "flag": "🇬🇳", "code": "GN", "dial_code": "+224"},
  "gw": {"@type": "languageDetailData", "name": "Guinea-Bissau", "flag": "🇬🇼", "code": "GW", "dial_code": "+245"},
  "gy": {"@type": "languageDetailData", "name": "Guyana", "flag": "🇬🇾", "code": "GY", "dial_code": "+592"},
  "ht": {"@type": "languageDetailData", "name": "Haiti", "flag": "🇭🇹", "code": "HT", "dial_code": "+509"},
  "hm": {"@type": "languageDetailData", "name": "Heard Island and Mcdonald Islands", "flag": "🇭🇲", "code": "HM", "dial_code": "+672"},
  "va": {"@type": "languageDetailData", "name": "Holy See (Vatican City State)", "flag": "🇻🇦", "code": "VA", "dial_code": "+379"},
  "hn": {"@type": "languageDetailData", "name": "Honduras", "flag": "🇭🇳", "code": "HN", "dial_code": "+504"},
  "hk": {"@type": "languageDetailData", "name": "Hong Kong", "flag": "🇭🇰", "code": "HK", "dial_code": "+852"},
  "hu": {"@type": "languageDetailData", "name": "Hungary", "flag": "🇭🇺", "code": "HU", "dial_code": "+36"},
  "is": {"@type": "languageDetailData", "name": "Iceland", "flag": "🇮🇸", "code": "IS", "dial_code": "+354"},
  "in": {"@type": "languageDetailData", "name": "India", "flag": "🇮🇳", "code": "IN", "dial_code": "+91"},
  "id": {"@type": "languageDetailData", "name": "Indonesia", "flag": "🇮🇩", "code": "ID", "dial_code": "+62"},
  "ir": {"@type": "languageDetailData", "name": "Iran, Islamic Republic of Persian Gulf", "flag": "🇮🇷", "code": "IR", "dial_code": "+98"},
  "iq": {"@type": "languageDetailData", "name": "Iraq", "flag": "🇮🇶", "code": "IQ", "dial_code": "+964"},
  "ie": {"@type": "languageDetailData", "name": "Ireland", "flag": "🇮🇪", "code": "IE", "dial_code": "+353"},
  "im": {"@type": "languageDetailData", "name": "Isle of Man", "flag": "🇮🇲", "code": "IM", "dial_code": "+44"},
  "il": {"@type": "languageDetailData", "name": "Israel", "flag": "🇮🇱", "code": "IL", "dial_code": "+972"},
  "it": {"@type": "languageDetailData", "name": "Italy", "flag": "🇮🇹", "code": "IT", "dial_code": "+39"},
  "jm": {"@type": "languageDetailData", "name": "Jamaica", "flag": "🇯🇲", "code": "JM", "dial_code": "+1876"},
  "jp": {"@type": "languageDetailData", "name": "Japan", "flag": "🇯🇵", "code": "JP", "dial_code": "+81"},
  "je": {"@type": "languageDetailData", "name": "Jersey", "flag": "🇯🇪", "code": "JE", "dial_code": "+44"},
  "jo": {"@type": "languageDetailData", "name": "Jordan", "flag": "🇯🇴", "code": "JO", "dial_code": "+962"},
  "kz": {"@type": "languageDetailData", "name": "Kazakhstan", "flag": "🇰🇿", "code": "KZ", "dial_code": "+7"},
  "ke": {"@type": "languageDetailData", "name": "Kenya", "flag": "🇰🇪", "code": "KE", "dial_code": "+254"},
  "ki": {"@type": "languageDetailData", "name": "Kiribati", "flag": "🇰🇮", "code": "KI", "dial_code": "+686"},
  "kp": {"@type": "languageDetailData", "name": "Korea, Democratic People's Republic of Korea", "flag": "🇰🇵", "code": "KP", "dial_code": "+850"},
  "ko": {"@type": "languageDetailData", "name": "Korea, Republic of South Korea", "flag": "🇰🇷", "code": "KO", "dial_code": "+82"},
  "xk": {"@type": "languageDetailData", "name": "Kosovo", "flag": "🇽🇰", "code": "XK", "dial_code": "+383"},
  "kw": {"@type": "languageDetailData", "name": "Kuwait", "flag": "🇰🇼", "code": "KW", "dial_code": "+965"},
  "kg": {"@type": "languageDetailData", "name": "Kyrgyzstan", "flag": "🇰🇬", "code": "KG", "dial_code": "+996"},
  "la": {"@type": "languageDetailData", "name": "Laos", "flag": "🇱🇦", "code": "LA", "dial_code": "+856"},
  "lv": {"@type": "languageDetailData", "name": "Latvia", "flag": "🇱🇻", "code": "LV", "dial_code": "+371"},
  "lb": {"@type": "languageDetailData", "name": "Lebanon", "flag": "🇱🇧", "code": "LB", "dial_code": "+961"},
  "ls": {"@type": "languageDetailData", "name": "Lesotho", "flag": "🇱🇸", "code": "LS", "dial_code": "+266"},
  "lr": {"@type": "languageDetailData", "name": "Liberia", "flag": "🇱🇷", "code": "LR", "dial_code": "+231"},
  "ly": {"@type": "languageDetailData", "name": "Libyan Arab Jamahiriya", "flag": "🇱🇾", "code": "LY", "dial_code": "+218"},
  "li": {"@type": "languageDetailData", "name": "Liechtenstein", "flag": "🇱🇮", "code": "LI", "dial_code": "+423"},
  "lt": {"@type": "languageDetailData", "name": "Lithuania", "flag": "🇱🇹", "code": "LT", "dial_code": "+370"},
  "lu": {"@type": "languageDetailData", "name": "Luxembourg", "flag": "🇱🇺", "code": "LU", "dial_code": "+352"},
  "mo": {"@type": "languageDetailData", "name": "Macao", "flag": "🇲🇴", "code": "MO", "dial_code": "+853"},
  "mk": {"@type": "languageDetailData", "name": "Macedonia", "flag": "🇲🇰", "code": "MK", "dial_code": "+389"},
  "mg": {"@type": "languageDetailData", "name": "Madagascar", "flag": "🇲🇬", "code": "MG", "dial_code": "+261"},
  "mw": {"@type": "languageDetailData", "name": "Malawi", "flag": "🇲🇼", "code": "MW", "dial_code": "+265"},
  "my": {"@type": "languageDetailData", "name": "Malaysia", "flag": "🇲🇾", "code": "MY", "dial_code": "+60"},
  "mv": {"@type": "languageDetailData", "name": "Maldives", "flag": "🇲🇻", "code": "MV", "dial_code": "+960"},
  "ml": {"@type": "languageDetailData", "name": "Mali", "flag": "🇲🇱", "code": "ML", "dial_code": "+223"},
  "mt": {"@type": "languageDetailData", "name": "Malta", "flag": "🇲🇹", "code": "MT", "dial_code": "+356"},
  "mh": {"@type": "languageDetailData", "name": "Marshall Islands", "flag": "🇲🇭", "code": "MH", "dial_code": "+692"},
  "mq": {"@type": "languageDetailData", "name": "Martinique", "flag": "🇲🇶", "code": "MQ", "dial_code": "+596"},
  "mr": {"@type": "languageDetailData", "name": "Mauritania", "flag": "🇲🇷", "code": "MR", "dial_code": "+222"},
  "mu": {"@type": "languageDetailData", "name": "Mauritius", "flag": "🇲🇺", "code": "MU", "dial_code": "+230"},
  "yt": {"@type": "languageDetailData", "name": "Mayotte", "flag": "🇾🇹", "code": "YT", "dial_code": "+262"},
  "mx": {"@type": "languageDetailData", "name": "Mexico", "flag": "🇲🇽", "code": "MX", "dial_code": "+52"},
  "fm": {"@type": "languageDetailData", "name": "Micronesia, Federated States of Micronesia", "flag": "🇫🇲", "code": "FM", "dial_code": "+691"},
  "md": {"@type": "languageDetailData", "name": "Moldova", "flag": "🇲🇩", "code": "MD", "dial_code": "+373"},
  "mc": {"@type": "languageDetailData", "name": "Monaco", "flag": "🇲🇨", "code": "MC", "dial_code": "+377"},
  "mn": {"@type": "languageDetailData", "name": "Mongolia", "flag": "🇲🇳", "code": "MN", "dial_code": "+976"},
  "me": {"@type": "languageDetailData", "name": "Montenegro", "flag": "🇲🇪", "code": "ME", "dial_code": "+382"},
  "ms": {"@type": "languageDetailData", "name": "Montserrat", "flag": "🇲🇸", "code": "MS", "dial_code": "+1664"},
  "ma": {"@type": "languageDetailData", "name": "Morocco", "flag": "🇲🇦", "code": "MA", "dial_code": "+212"},
  "mz": {"@type": "languageDetailData", "name": "Mozambique", "flag": "🇲🇿", "code": "MZ", "dial_code": "+258"},
  "mm": {"@type": "languageDetailData", "name": "Myanmar", "flag": "🇲🇲", "code": "MM", "dial_code": "+95"},
  "na": {"@type": "languageDetailData", "name": "Namibia", "flag": "🇳🇦", "code": "NA", "dial_code": "+264"},
  "nr": {"@type": "languageDetailData", "name": "Nauru", "flag": "🇳🇷", "code": "NR", "dial_code": "+674"},
  "np": {"@type": "languageDetailData", "name": "Nepal", "flag": "🇳🇵", "code": "NP", "dial_code": "+977"},
  "nl": {"@type": "languageDetailData", "name": "Netherlands", "flag": "🇳🇱", "code": "NL", "dial_code": "+31"},
  "an": {"@type": "languageDetailData", "name": "Netherlands Antilles", "flag": "", "code": "AN", "dial_code": "+599"},
  "nc": {"@type": "languageDetailData", "name": "New Caledonia", "flag": "🇳🇨", "code": "NC", "dial_code": "+687"},
  "nz": {"@type": "languageDetailData", "name": "New Zealand", "flag": "🇳🇿", "code": "NZ", "dial_code": "+64"},
  "ni": {"@type": "languageDetailData", "name": "Nicaragua", "flag": "🇳🇮", "code": "NI", "dial_code": "+505"},
  "ne": {"@type": "languageDetailData", "name": "Niger", "flag": "🇳🇪", "code": "NE", "dial_code": "+227"},
  "ng": {"@type": "languageDetailData", "name": "Nigeria", "flag": "🇳🇬", "code": "NG", "dial_code": "+234"},
  "nu": {"@type": "languageDetailData", "name": "Niue", "flag": "🇳🇺", "code": "NU", "dial_code": "+683"},
  "nf": {"@type": "languageDetailData", "name": "Norfolk Island", "flag": "🇳🇫", "code": "NF", "dial_code": "+672"},
  "mp": {"@type": "languageDetailData", "name": "Northern Mariana Islands", "flag": "🇲🇵", "code": "MP", "dial_code": "+1670"},
  "no": {"@type": "languageDetailData", "name": "Norway", "flag": "🇳🇴", "code": "NO", "dial_code": "+47"},
  "om": {"@type": "languageDetailData", "name": "Oman", "flag": "🇴🇲", "code": "OM", "dial_code": "+968"},
  "pk": {"@type": "languageDetailData", "name": "Pakistan", "flag": "🇵🇰", "code": "PK", "dial_code": "+92"},
  "pw": {"@type": "languageDetailData", "name": "Palau", "flag": "🇵🇼", "code": "PW", "dial_code": "+680"},
  "ps": {"@type": "languageDetailData", "name": "Palestinian Territory, Occupied", "flag": "🇵🇸", "code": "PS", "dial_code": "+970"},
  "pa": {"@type": "languageDetailData", "name": "Panama", "flag": "🇵🇦", "code": "PA", "dial_code": "+507"},
  "pg": {"@type": "languageDetailData", "name": "Papua New Guinea", "flag": "🇵🇬", "code": "PG", "dial_code": "+675"},
  "py": {"@type": "languageDetailData", "name": "Paraguay", "flag": "🇵🇾", "code": "PY", "dial_code": "+595"},
  "pe": {"@type": "languageDetailData", "name": "Peru", "flag": "🇵🇪", "code": "PE", "dial_code": "+51"},
  "ph": {"@type": "languageDetailData", "name": "Philippines", "flag": "🇵🇭", "code": "PH", "dial_code": "+63"},
  "pn": {"@type": "languageDetailData", "name": "Pitcairn", "flag": "🇵🇳", "code": "PN", "dial_code": "+64"},
  "pl": {"@type": "languageDetailData", "name": "Poland", "flag": "🇵🇱", "code": "PL", "dial_code": "+48"},
  "pt": {"@type": "languageDetailData", "name": "Portugal", "flag": "🇵🇹", "code": "PT", "dial_code": "+351"},
  "pr": {"@type": "languageDetailData", "name": "Puerto Rico", "flag": "🇵🇷", "code": "PR", "dial_code": "+1939"},
  "qa": {"@type": "languageDetailData", "name": "Qatar", "flag": "🇶🇦", "code": "QA", "dial_code": "+974"},
  "ro": {"@type": "languageDetailData", "name": "Romania", "flag": "🇷🇴", "code": "RO", "dial_code": "+40"},
  "ru": {"@type": "languageDetailData", "name": "Russia", "flag": "🇷🇺", "code": "RU", "dial_code": "+7"},
  "rw": {"@type": "languageDetailData", "name": "Rwanda", "flag": "🇷🇼", "code": "RW", "dial_code": "+250"},
  "re": {"@type": "languageDetailData", "name": "Reunion", "flag": "🇷🇪", "code": "RE", "dial_code": "+262"},
  "bl": {"@type": "languageDetailData", "name": "Saint Barthelemy", "flag": "🇧🇱", "code": "BL", "dial_code": "+590"},
  "sh": {"@type": "languageDetailData", "name": "Saint Helena, Ascension and Tristan Da Cunha", "flag": "🇸🇭", "code": "SH", "dial_code": "+290"},
  "kn": {"@type": "languageDetailData", "name": "Saint Kitts and Nevis", "flag": "🇰🇳", "code": "KN", "dial_code": "+1869"},
  "lc": {"@type": "languageDetailData", "name": "Saint Lucia", "flag": "🇱🇨", "code": "LC", "dial_code": "+1758"},
  "mf": {"@type": "languageDetailData", "name": "Saint Martin", "flag": "🇲🇫", "code": "MF", "dial_code": "+590"},
  "pm": {"@type": "languageDetailData", "name": "Saint Pierre and Miquelon", "flag": "🇵🇲", "code": "PM", "dial_code": "+508"},
  "vc": {"@type": "languageDetailData", "name": "Saint Vincent and the Grenadines", "flag": "🇻🇨", "code": "VC", "dial_code": "+1784"},
  "ws": {"@type": "languageDetailData", "name": "Samoa", "flag": "🇼🇸", "code": "WS", "dial_code": "+685"},
  "sm": {"@type": "languageDetailData", "name": "San Marino", "flag": "🇸🇲", "code": "SM", "dial_code": "+378"},
  "st": {"@type": "languageDetailData", "name": "Sao Tome and Principe", "flag": "🇸🇹", "code": "ST", "dial_code": "+239"},
  "sa": {"@type": "languageDetailData", "name": "Saudi Arabia", "flag": "🇸🇦", "code": "SA", "dial_code": "+966"},
  "sn": {"@type": "languageDetailData", "name": "Senegal", "flag": "🇸🇳", "code": "SN", "dial_code": "+221"},
  "rs": {"@type": "languageDetailData", "name": "Serbia", "flag": "🇷🇸", "code": "RS", "dial_code": "+381"},
  "sc": {"@type": "languageDetailData", "name": "Seychelles", "flag": "🇸🇨", "code": "SC", "dial_code": "+248"},
  "sl": {"@type": "languageDetailData", "name": "Sierra Leone", "flag": "🇸🇱", "code": "SL", "dial_code": "+232"},
  "sg": {"@type": "languageDetailData", "name": "Singapore", "flag": "🇸🇬", "code": "SG", "dial_code": "+65"},
  "sk": {"@type": "languageDetailData", "name": "Slovakia", "flag": "🇸🇰", "code": "SK", "dial_code": "+421"},
  "si": {"@type": "languageDetailData", "name": "Slovenia", "flag": "🇸🇮", "code": "SI", "dial_code": "+386"},
  "sb": {"@type": "languageDetailData", "name": "Solomon Islands", "flag": "🇸🇧", "code": "SB", "dial_code": "+677"},
  "so": {"@type": "languageDetailData", "name": "Somalia", "flag": "🇸🇴", "code": "SO", "dial_code": "+252"},
  "za": {"@type": "languageDetailData", "name": "South Africa", "flag": "🇿🇦", "code": "ZA", "dial_code": "+27"},
  "ss": {"@type": "languageDetailData", "name": "South Sudan", "flag": "🇸🇸", "code": "SS", "dial_code": "+211"},
  "gs": {"@type": "languageDetailData", "name": "South Georgia and the South Sandwich Islands", "flag": "🇬🇸", "code": "GS", "dial_code": "+500"},
  "es": {"@type": "languageDetailData", "name": "Spain", "flag": "🇪🇸", "code": "ES", "dial_code": "+34"},
  "lk": {"@type": "languageDetailData", "name": "Sri Lanka", "flag": "🇱🇰", "code": "LK", "dial_code": "+94"},
  "sd": {"@type": "languageDetailData", "name": "Sudan", "flag": "🇸🇩", "code": "SD", "dial_code": "+249"},
  "sr": {"@type": "languageDetailData", "name": "Suriname", "flag": "🇸🇷", "code": "SR", "dial_code": "+597"},
  "sj": {"@type": "languageDetailData", "name": "Svalbard and Jan Mayen", "flag": "🇸🇯", "code": "SJ", "dial_code": "+47"},
  "sz": {"@type": "languageDetailData", "name": "Swaziland", "flag": "🇸🇿", "code": "SZ", "dial_code": "+268"},
  "se": {"@type": "languageDetailData", "name": "Sweden", "flag": "🇸🇪", "code": "SE", "dial_code": "+46"},
  "ch": {"@type": "languageDetailData", "name": "Switzerland", "flag": "🇨🇭", "code": "CH", "dial_code": "+41"},
  "sy": {"@type": "languageDetailData", "name": "Syrian Arab Republic", "flag": "🇸🇾", "code": "SY", "dial_code": "+963"},
  "tw": {"@type": "languageDetailData", "name": "Taiwan", "flag": "🇹🇼", "code": "TW", "dial_code": "+886"},
  "tj": {"@type": "languageDetailData", "name": "Tajikistan", "flag": "🇹🇯", "code": "TJ", "dial_code": "+992"},
  "tz": {"@type": "languageDetailData", "name": "Tanzania, United Republic of Tanzania", "flag": "🇹🇿", "code": "TZ", "dial_code": "+255"},
  "th": {"@type": "languageDetailData", "name": "Thailand", "flag": "🇹🇭", "code": "TH", "dial_code": "+66"},
  "tl": {"@type": "languageDetailData", "name": "Timor-Leste", "flag": "🇹🇱", "code": "TL", "dial_code": "+670"},
  "tg": {"@type": "languageDetailData", "name": "Togo", "flag": "🇹🇬", "code": "TG", "dial_code": "+228"},
  "tk": {"@type": "languageDetailData", "name": "Tokelau", "flag": "🇹🇰", "code": "TK", "dial_code": "+690"},
  "to": {"@type": "languageDetailData", "name": "Tonga", "flag": "🇹🇴", "code": "TO", "dial_code": "+676"},
  "tt": {"@type": "languageDetailData", "name": "Trinidad and Tobago", "flag": "🇹🇹", "code": "TT", "dial_code": "+1868"},
  "tn": {"@type": "languageDetailData", "name": "Tunisia", "flag": "🇹🇳", "code": "TN", "dial_code": "+216"},
  "tr": {"@type": "languageDetailData", "name": "Turkey", "flag": "🇹🇷", "code": "TR", "dial_code": "+90"},
  "tm": {"@type": "languageDetailData", "name": "Turkmenistan", "flag": "🇹🇲", "code": "TM", "dial_code": "+993"},
  "tc": {"@type": "languageDetailData", "name": "Turks and Caicos Islands", "flag": "🇹🇨", "code": "TC", "dial_code": "+1649"},
  "tv": {"@type": "languageDetailData", "name": "Tuvalu", "flag": "🇹🇻", "code": "TV", "dial_code": "+688"},
  "ug": {"@type": "languageDetailData", "name": "Uganda", "flag": "🇺🇬", "code": "UG", "dial_code": "+256"},
  "ua": {"@type": "languageDetailData", "name": "Ukraine", "flag": "🇺🇦", "code": "UA", "dial_code": "+380"},
  "ae": {"@type": "languageDetailData", "name": "United Arab Emirates", "flag": "🇦🇪", "code": "AE", "dial_code": "+971"},
  "gb": {"@type": "languageDetailData", "name": "United Kingdom", "flag": "🇬🇧", "code": "GB", "dial_code": "+44"},
  "us": {"@type": "languageDetailData", "name": "United States", "flag": "🇺🇸", "code": "US", "dial_code": "+1"},
  "uy": {"@type": "languageDetailData", "name": "Uruguay", "flag": "🇺🇾", "code": "UY", "dial_code": "+598"},
  "uz": {"@type": "languageDetailData", "name": "Uzbekistan", "flag": "🇺🇿", "code": "UZ", "dial_code": "+998"},
  "vu": {"@type": "languageDetailData", "name": "Vanuatu", "flag": "🇻🇺", "code": "VU", "dial_code": "+678"},
  "ve": {"@type": "languageDetailData", "name": "Venezuela, Bolivarian Republic of Venezuela", "flag": "🇻🇪", "code": "VE", "dial_code": "+58"},
  "vn": {"@type": "languageDetailData", "name": "Vietnam", "flag": "🇻🇳", "code": "VN", "dial_code": "+84"},
  "vg": {"@type": "languageDetailData", "name": "Virgin Islands, British", "flag": "🇻🇬", "code": "VG", "dial_code": "+1284"},
  "vi": {"@type": "languageDetailData", "name": "Virgin Islands, U.S.", "flag": "🇻🇮", "code": "VI", "dial_code": "+1340"},
  "wf": {"@type": "languageDetailData", "name": "Wallis and Futuna", "flag": "🇼🇫", "code": "WF", "dial_code": "+681"},
  "ye": {"@type": "languageDetailData", "name": "Yemen", "flag": "🇾🇪", "code": "YE", "dial_code": "+967"},
  "zm": {"@type": "languageDetailData", "name": "Zambia", "flag": "🇿🇲", "code": "ZM", "dial_code": "+260"},
  "zw": {"@type": "languageDetailData", "name": "Zimbabwe", "flag": "🇿🇼", "code": "ZW", "dial_code": "+263"}
};

Map<String, LanguageDetailData> languageCodeDetailData = () {
  Map<String, LanguageDetailData> jsonData = {};
  for (var element in languageCodeJson.entries) {
    dynamic key = element.key;
    dynamic value = element.value;
    if (value is Map) {
      if (key is String) {
        jsonData[key] = LanguageDetailData(value);
      }
    }
  }
  return jsonData;
}.call();

List<String> languageCodeNames = languageCodeJson.keys.whereType<String>().toList();

extension LanguageDataExtensions on Map<String, LanguageDetailData> {
  Future<LanguageDetailData?> languageDetailDataQuery({
    required Future<bool> Function(LanguageDetailData languageDetailData) onData,
  }) async {
    for (var element in entries) {
      LanguageDetailData value = element.value;
      bool is_return_data = await onData(value);
      if (is_return_data) {
        return value;
      }
    }

    return null;
  }

  LanguageDetailData? languageDetailDataQuerySync({
    required bool Function(LanguageDetailData languageDetailData) onData,
  }) {
    for (var element in entries) {
      LanguageDetailData value = element.value;

      bool is_return_data = onData(value);
      if (is_return_data) {
        return value;
      }
    }

    return null;
  }

  Future<LanguageDetailData> languageDetailDataQueryForce({
    required Future<bool> Function(LanguageDetailData languageDetailData) onData,
    required LanguageDetailData defaultLanguageDetailData,
  }) async {
    return (await languageDetailDataQuery(onData: onData)) ?? defaultLanguageDetailData;
  }

  LanguageDetailData languageDetailDataQueryForceSync({
    required bool Function(LanguageDetailData languageDetailData) onData,
    required LanguageDetailData defaultLanguageDetailData,
  }) {
    return languageDetailDataQuerySync(onData: onData) ?? defaultLanguageDetailData;
  }

  LanguageDetailData? languageDetailDataGetByPhoneCode({
    required RegExp regExpPhoneCode,
  }) {
    for (var element in entries) {
      LanguageDetailData value = element.value;
      if (value.dial_code is String == false) {
        continue;
      }
      if ((value.dial_code as String).isEmpty) {
        continue;
      }

      if (regExpPhoneCode.hasMatch(value.dial_code ?? "")) {
        return value;
      }
    }

    return null;
  }
}
