class AppConstants{
 static String getRemainingDays(String validUntil) {
    final now = DateTime.now();
    final endDate = DateTime.parse(validUntil);

    final difference = endDate.difference(now).inDays;

    if (difference <= 0) {
      return "انتهى";
    } else if (difference == 1) {
      return "يوم واحد";
    } else if (difference == 2) {
      return "يومين";
    } else if (difference <= 10) {
      return "$difference أيام";
    } else {
      return "$difference يوم";
    }
  }
  static const double deviceHeight = 812;
  static const double deviceWidth = 375;
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

}