const String bosField = "Bu alanın doldurulması zorunlu";
const String reservationActive = 'Active';
const String reservationExpired = 'Expired';
const String accessToken = 'accessToken';
const String loginTime = 'loginTime';
const String expirationDuration = 'expirationDuration';
const String busTypeNonAc = 'NON-AC';
const String busTypeACEconomy = 'AC-ECONOMY';
const String busTypeACBusiness = 'AC-BUSINESS';

enum ResponseStatus {
  SAVED,
  FAILED,
  UNAUTHORIZED,
  AUTHORIZED,
  EXPIRED,
  NONE,
}

const cities = ["Istanbul", "Izmir", "konya", "Antalya"];

const planeTypes = [busTypeACBusiness, busTypeACEconomy, busTypeNonAc];

const seatLabelList = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
];
