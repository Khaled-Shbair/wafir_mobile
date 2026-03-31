import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primary = Color(0xFF006D73);
  static const Color lightBg = Color(0xFFF4F7F8);
  static const Color textDark = Color(0xFF162326);
  static const Color textMuted = Color(0xFF7F8D92);
  static const Color gold = Color(0xFFD8A62A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildTopBar(),
              const SizedBox(height: 14),
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildCategories(),
              const SizedBox(height: 18),
              _buildSectionHeader('تنتهي قريباً', actionText: 'عرض الكل'),
              const SizedBox(height: 10),
              _buildNearExpiryOffers(),
              const SizedBox(height: 22),
              _buildSectionHeader('أحدث العروض'),
              const SizedBox(height: 10),
              _buildLatestOffers(),
              const SizedBox(height: 22),
              _buildSectionHeader(
                'العروض الأمثل لك',
                subtitle: 'ترشيحات بناءً على اهتماماتك',
              ),
              const SizedBox(height: 10),
              _buildBestForYou(),
              const SizedBox(height: 18),
              _buildPromoBanner(),
              const SizedBox(height: 22),
              _buildSectionHeader('أفضل المطاعم تقييماً', actionText: 'عرض الكل'),
              const SizedBox(height: 10),
              _buildTopRatedRestaurants(),
              const SizedBox(height: 22),
              _buildSectionHeader('أفضل المتاجر الموثقة'),
              const SizedBox(height: 10),
              _buildVerifiedStores(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Text(
                '%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'وافر',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: textDark,
            ),
          ),
          const Spacer(),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x11000000),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.notifications_none_rounded, color: primary),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8EA)),
        ),
        child: const Row(
          children: [
            SizedBox(width: 12),
            Icon(Icons.search, color: textMuted),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'ابحث عن عروض، مطاعم، أو متاجر...',
                style: TextStyle(
                  color: textMuted,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final items = [
      {'icon': Icons.restaurant_rounded, 'label': 'مطاعم', 'active': true},
      {'icon': Icons.bed_rounded, 'label': 'فنادق', 'active': false},
      {'icon': Icons.directions_car_filled_rounded, 'label': 'سيارات', 'active': false},
      {'icon': Icons.checkroom_rounded, 'label': 'موضة', 'active': false},
      {'icon': Icons.more_horiz_rounded, 'label': 'أخرى', 'active': false},
    ];

    return SizedBox(
      height: 78,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = items[index];
          final active = item['active'] as bool;
          return Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: active ? primary : Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: active ? primary : const Color(0xFFE4EAEC),
                  ),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  color: active ? Colors.white : const Color(0xFF47666B),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item['label'] as String,
                style: const TextStyle(
                  fontSize: 11,
                  color: textDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemCount: items.length,
      ),
    );
  }

  Widget _buildSectionHeader(
      String title, {
        String? actionText,
        String? subtitle,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (actionText != null)
            Text(
              actionText,
              style: const TextStyle(
                color: primary,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          if (actionText != null) const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: textDark,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNearExpiryOffers() {
    final offers = [
      const OfferModel(
        title: 'بوكس السعادة العائلي',
        category: 'بيتزا وكنتاكي',
        price: '45 ريال',
        oldPrice: '70',
        discount: '30%+',
        buttonText: 'انتهز الفرصة الآن',
        imageUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1200&auto=format&fit=crop',
      ),
      const OfferModel(
        title: 'وجبة التوفير',
        category: 'وجبات ومطاعم',
        price: '28 ريال',
        oldPrice: '40',
        discount: '40%+',
        buttonText: 'اطلب الآن',
        imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1200&auto=format&fit=crop',
      ),
    ];

    return SizedBox(
      height: 286,
      child: ListView.separated(
        reverse: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: offers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) => OfferCard(offer: offers[index]),
      ),
    );
  }

  Widget _buildLatestOffers() {
    final offers = [
      const OfferModel(
        title: 'مطعم الشفرة الخليجية',
        category: 'مطعم راقٍ في الأكلات الرئيسية',
        discount: '40%',
        buttonText: 'عرض التفاصيل',
        imageUrl: 'https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=1200&auto=format&fit=crop',
      ),
      const OfferModel(
        title: 'متجر الأناقة',
        category: 'تشكيلة أزياء جديدة',
        discount: '25%',
        buttonText: 'عرض التفاصيل',
        imageUrl: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=1200&auto=format&fit=crop',
      ),
    ];

    return SizedBox(
      height: 268,
      child: ListView.separated(
        reverse: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: offers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) => OfferCard(
          offer: offers[index],
          showPrice: false,
        ),
      ),
    );
  }

  Widget _buildBestForYou() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _simpleBestCard(
              tag: 'مميز',
              title: 'متاجر الموضة',
              subtitle: 'عروض يومية تناسب ذائقتك',
              icon: Icons.shopping_bag_outlined,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _simpleBestCard(
              tag: 'جديد',
              title: 'أحدث التقنيات',
              subtitle: 'عروض حصرية بأفضل الأسعار',
              icon: Icons.devices_outlined,
            ),
          ),
        ],
      ),
    );
  }

  Widget _simpleBestCard({
    required String tag,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Icon(icon, color: primary, size: 42),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: textDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: primary,
                side: const BorderSide(color: primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text('استكشاف العروض'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFE7F0F1),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFD6E3E6)),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.card_giftcard_rounded, color: primary),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'مقترح لك اليوم!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: primary,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'احصل على خصم إضافي 10% باستخدام كود "NEW"',
                    style: TextStyle(
                      fontSize: 12,
                      color: textDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRatedRestaurants() {
    final items = [
      const RatedPlaceModel(
        title: 'برجر بلس',
        rating: '4.8',
        reviews: '500+',
        imageUrl: 'https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?q=80&w=1200&auto=format&fit=crop',
      ),
      const RatedPlaceModel(
        title: 'بيتزا إيطاليانو',
        rating: '4.6',
        reviews: '320+',
        imageUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1200&auto=format&fit=crop',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: items
            .map(
              (item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _ratedPlaceTile(item),
          ),
        )
            .toList(),
      ),
    );
  }

  Widget _ratedPlaceTile(RatedPlaceModel item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8EA)),
      ),
      child: Row(
        children: [
          const Icon(Icons.chevron_left_rounded, color: Color(0xFFB7C1C5)),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: textDark,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '(${item.reviews} تقييم)',
                    style: const TextStyle(
                      color: textMuted,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    item.rating,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.star_rounded, color: Color(0xFFF5B400), size: 18),
                ],
              ),
            ],
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.imageUrl,
              width: 52,
              height: 52,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifiedStores() {
    final stores = ['ألتيوم', 'ترف', 'أنازين'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: stores
            .map(
              (store) => Expanded(
            child: Container(
              margin: EdgeInsets.only(left: store == stores.last ? 0 : 10),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8EA)),
              ),
              child: Column(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEAF3F4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.verified_rounded, color: primary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    store,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: textDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
            .toList(),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 18,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _BottomNavItem(icon: Icons.home_rounded, label: 'الرئيسية', active: true),
          _BottomNavItem(icon: Icons.local_offer_outlined, label: 'العروض'),
          _BottomNavItem(icon: Icons.favorite_border_rounded, label: 'المفضلة'),
          _BottomNavItem(icon: Icons.person_outline_rounded, label: 'الملف الشخصي'),
        ],
      ),
    );
  }
}

class OfferModel {
  final String title;
  final String category;
  final String? price;
  final String? oldPrice;
  final String discount;
  final String buttonText;
  final String imageUrl;

  const OfferModel({
    required this.title,
    required this.category,
    this.price,
    this.oldPrice,
    required this.discount,
    required this.buttonText,
    required this.imageUrl,
  });
}

class RatedPlaceModel {
  final String title;
  final String rating;
  final String reviews;
  final String imageUrl;

  const RatedPlaceModel({
    required this.title,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });
}

class OfferCard extends StatelessWidget {
  final OfferModel offer;
  final bool showPrice;

  const OfferCard({
    super.key,
    required this.offer,
    this.showPrice = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Stack(
              children: [
                Image.network(
                  offer.imageUrl,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE84552),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      'أوفر بـ${offer.discount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showPrice && offer.price != null)
                  Row(
                    children: [
                      if (offer.oldPrice != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            offer.oldPrice!,
                            style: const TextStyle(
                              color: Color(0xFFB5BFC3),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      Text(
                        offer.price!,
                        style: const TextStyle(
                          color: Color(0xFF2D7F34),
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                Text(
                  offer.title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: HomeScreen.textDark,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  offer.category,
                  style: const TextStyle(
                    color: HomeScreen.textMuted,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HomeScreen.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      offer.buttonText,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: active ? HomeScreen.primary : const Color(0xFF94A3B8),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: active ? FontWeight.w800 : FontWeight.w600,
            color: active ? HomeScreen.primary : const Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }
}
