const String bosField = "Bu alanin doldurulmasi zorunlu";
const String reservationActive = 'Active';
const String reservationExpired = 'Expired';
const String accessToken = 'accessToken';
const String loginTime = 'loginTime';
const String expirationDuration = 'expirationDuration';
const String Economy = 'Yolcu Ucagi';
const String Private = 'Ozel Ucak';

enum ResponseStatus {
  SAVED,
  FAILED,
  UNAUTHORIZED,
  AUTHORIZED,
  EXPIRED,
  NONE,
}

const cities = ["Istanbul", "Izmir", "konya", "Antalya"];

const planeTypes = [
  Private,
  Economy,
];

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
  'M',
  'N',
  'O',
  'P',
  'R',
  'S',
  'T',
  'U',
  'V',
  'Y',
  'Z',
];
