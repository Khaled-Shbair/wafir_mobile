class AppConstants {
  static const double deviceHeight = 812;
  static const double deviceWidth = 375;
  static const String baseUrl = 'https://api.example.com';
  static const String privacyPolicy =
      'https://discount-platform-three.vercel.app/privacy-policy';
  static const String faq = 'https://discount-platform-three.vercel.app/faq';
  static const String termsOfUse =
      'https://discount-platform-three.vercel.app/terms-of-use';

  // قائمة الفئات
  static const List<String> categories = [
    'الكل',
    'المطاعم',
    'المقاهي',
    'الفنادق',
    'السياحة',
    'الملابس',
    'الإلكترونيات',
    'الصحة والجمال',
    'الرياضة',
    'التعليم',
  ];

  static final Map<String, List<String>> omanLocations = {
    'محافظة مسقط': [
      'مسقط',
      'مطرح',
      'السيب',
      'بوشر',
      'العامرات',
      'قريات',
    ],
    'محافظة شمال الباطنة': [
      'صحار',
      'شناص',
      'لوى',
      'صحم',
      'الخابورة',
    ],
    'محافظة جنوب الباطنة': [
      'الرستاق',
      'بركاء',
      'نخل',
      'وادي المعاول',
      'العوابي',
    ],
    'محافظة الداخلية': [
      'نزوى',
      'بهلاء',
      'إزكي',
      'سمائل',
      'منح',
      'أدم',
    ],
    'محافظة ظفار': [
      'صلالة',
      'طاقة',
      'مرباط',
      'سدح',
      'ثمريت',
    ],
    'محافظة الشرقية (شمال + جنوب)': [
      'صور',
      'إبراء',
      'بدية',
      'جعلان بني بوعلي',
      'جعلان بني بو حسن',
      'الكامل والوافي',
    ],
    'محافظة الظاهرة': [
      'عبري',
      'ينقل',
      'ضنك',
    ],
    'محافظة البريمي': [
      'البريمي',
      'محضة',
      'السنينة',
    ],
    'محافظة الوسطى': [
      'الدقم',
      'هيماء',
      'محوت',
      'الجازر',
    ],
    'محافظة مسندم': [
      'خصب',
      'دبا',
      'بخا',
      'مدحاء',
    ],
  };

  static String getRemainingDays(String startDate, String endDate) {
    final now = DateTime.now();
    final start = DateTime.parse(startDate);
    final end = DateTime.parse(endDate);

    // إذا كان العرض قد بدأ بالفعل (الآن أكبر من تاريخ البداية)
    if (now.isAfter(start)) {
      final difference = end.difference(now);
      final differenceInDays = difference.inDays;
      final differenceInHours = difference.inHours;

      // تحقق إذا كان العرض انتهى
      if (differenceInDays < 0 ||
          (differenceInDays == 0 && differenceInHours < 0)) {
        return "انتهى";
      }

      // إذا بقي أيام
      if (differenceInDays > 0) {
        if (differenceInDays == 1) {
          return "ينتهي بعد يوم";
        } else if (differenceInDays == 2) {
          return "ينتهي بعد يومين";
        } else {
          return "ينتهي بعد $differenceInDays ايام";
        }
      }
      // إذا بقيت ساعات فقط
      else if (differenceInDays == 0 && differenceInHours > 0) {
        if (differenceInHours == 1) {
          return "ينتهي بعد ساعة";
        } else if (differenceInHours == 2) {
          return "ينتهي بعد ساعتين";
        } else {
          return "ينتهي بعد $differenceInHours ساعة";
        }
      }
    }
    // إذا كان العرض لم يبدأ بعد
    else {
      final difference = start.difference(now);
      final differenceInDays = difference.inDays;
      final differenceInHours = difference.inHours;

      if (differenceInDays > 0) {
        if (differenceInDays == 1) {
          return "يبدا بعد يوم";
        } else if (differenceInDays == 2) {
          return "يبدا بعد يومين";
        } else {
          return "يبدا بعد $differenceInDays ايام";
        }
      } else if (differenceInDays == 0 && differenceInHours > 0) {
        if (differenceInHours == 1) {
          return "يبدا بعد ساعة";
        } else if (differenceInHours == 2) {
          return "يبدا بعد ساعتين";
        } else {
          return "يبدا بعد $differenceInHours ساعة";
        }
      }
    }

    return "انتهى";
  }
}