import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/sectors/presentation/model/offer_model.dart';
import 'package:wafir_mobile/features/sectors/presentation/view/widgets/custom_hero_card_widget.dart';
import 'package:wafir_mobile/features/sectors/presentation/view/widgets/custom_offer_card_widget.dart';
import 'package:wafir_mobile/features/sectors/presentation/view/widgets/custom_service_box_widget.dart';

class SectorDetailsScreen extends StatelessWidget {
  const SectorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = [
      const OfferModel(
        title: 'وجبة التوفير العائلية',
        subtitle: '2 بيتزا + أصابع موزاريلا + كولا',
        price: '89 ر.س',
        oldPrice: '178 ر.س',
        discount: 'خصم 50%',
        imageUrl:
            'https://images.unsplash.com/photo-1524593166156-312f362cada0?q=80&w=1200&auto=format&fit=crop',
      ),
      const OfferModel(
        title: 'وجبة التوفير العائلية',
        subtitle: '2 بيتزا + أصابع موزاريلا + كولا',
        price: '89 ر.س',
        oldPrice: '178 ر.س',
        discount: 'خصم 50%',
        imageUrl:
            'https://images.unsplash.com/photo-1488459716781-31db52582fe9?q=80&w=1200&auto=format&fit=crop',
      ),
      const OfferModel(
        title: 'وجبة التوفير العائلية',
        subtitle: '2 بيتزا + أصابع موزاريلا + كولا',
        price: '89 ر.س',
        oldPrice: '178 ر.س',
        discount: 'خصم 50%',
        imageUrl:
            'https://images.unsplash.com/photo-1513694203232-719a280e022f?q=80&w=1200&auto=format&fit=crop',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('وافر'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidths.w20,
                end: ManagerWidths.w20,
                bottom: ManagerHeights.h10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeroCardWidget(),
                  verticalSpace(ManagerHeights.h20),
                  Text(
                    'عن المتجر',
                    style: TextStyle(
                      color: ManagerColors.blackColor,
                      fontSize: 24,
                      fontWeight: ManagerFontWeight.extraBold,
                      fontFamily: ManagerFontFamily.tajawal,
                    ),
                  ),
                  verticalSpace(ManagerHeights.h10),
                  Text(
                    'بيتزا كينج هو الوجهة الأولى لعشاق البيتزا الإيطالية الأصيلة. نحن نؤمن بأن الجودة تبدأ من المكونات الطازجة، لذا نحضر عجينتنا يومياً ونستخدم أجود أنواع الجبن والخضروات. مهمتنا هي تقديم تجربة طعام استثنائية تجمع بين الطعم التقليدي والابتكار الحديث في كل شريحة.',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: ManagerColors.blackColor,
                      fontSize: ManagerFontsSizes.f16,
                      fontWeight: ManagerFontWeight.regular,
                      fontFamily: ManagerFontFamily.tajawal,
                    ),
                  ),
                  verticalSpace(ManagerHeights.h10),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: ManagerWidths.w10),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomServiceBox(
                            title: 'جلسات عائلية',
                            icon: Icons.restaurant,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomServiceBox(
                            title: 'توصيل سريع',
                            icon: Icons.delivery_dining,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(ManagerHeights.h10),
                  Text(
                    'العروض المنشورة',
                    style: TextStyle(
                      color: ManagerColors.blackColor,
                      fontSize: 24,
                      fontWeight: ManagerFontWeight.extraBold,
                      fontFamily: ManagerFontFamily.tajawal,
                    ),
                  ),
                  Text(
                    'اكتشف أفضل الخصومات الحصرية لهذا المتجر',
                    style: const TextStyle(
                      color: ManagerColors.blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildOffersGrid(offers),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOffersGrid(List<OfferModel> offers) {
    return GridView.builder(
      itemCount: offers.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: ManagerHeights.h15,
        mainAxisSpacing: ManagerWidths.w15,
        childAspectRatio: 0.60,
      ),
      itemBuilder: (context, index) => CustomOfferCard(item: offers[index]),
    );
  }
}
