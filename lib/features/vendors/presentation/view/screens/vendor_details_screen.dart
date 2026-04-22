import 'package:flutter/material.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendors_public_model.dart';

class VendorDetailsScreen extends StatelessWidget {
  const VendorDetailsScreen({
    super.key,
    required this.vendor,
  });

  final VendorPublicItemModel vendor;

  @override
  Widget build(BuildContext context) {
    final mainBranch = _getMainBranch(vendor.branches);

    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('تفاصيل المتجر'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidths.w15,
          end: ManagerWidths.w15,
          top: ManagerHeights.h10,
          bottom: ManagerHeights.h20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, mainBranch),
            verticalSpace(ManagerHeights.h15),
            _buildStatsSection(),
            verticalSpace(ManagerHeights.h15),
            _buildInfoCard(
              title: 'عن المتجر',
              icon: Icons.info_outline,
              child: Text(
                vendor.description.trim().isNotEmpty
                    ? vendor.description
                    : 'لا يوجد وصف متاح',
                style: const TextStyle(
                  height: 1.8,
                  fontSize: 14,
                  color: Colors.black87,
                  fontFamily: ManagerFontFamily.tajawal,
                ),
              ),
            ),
            verticalSpace(ManagerHeights.h15),
            _buildInfoCard(
              title: 'القطاع',
              icon: Icons.category_outlined,
              child: Row(
                children: [
                  _buildSectorIcon(),
                  horizontalSpace(ManagerWidths.w10),
                  Expanded(
                    child: Text(
                      vendor.sectorName.trim().isNotEmpty
                          ? vendor.sectorName
                          : 'غير محدد',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: ManagerFontFamily.tajawal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(ManagerHeights.h15),
            _buildInfoCard(
              title: 'الفروع',
              icon: Icons.account_tree_outlined,
              child: vendor.branches.isEmpty
                  ? const Text(
                      'لا يوجد فروع متاحة',
                      style: TextStyle(fontFamily: ManagerFontFamily.tajawal),
                    )
                  : Column(
                      children: vendor.branches
                          .map((branch) => _buildBranchTile(branch))
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    VendorPublicBranchModel? mainBranch,
  ) {
    final address = _formatBranchAddress(mainBranch);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xff1F2937), Color(0xff374151)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              image: vendor.logoUrl.trim().isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(vendor.logoUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: vendor.logoUrl.trim().isEmpty
                ? const Icon(Icons.storefront, size: 40)
                : null,
          ),
          const SizedBox(height: 14),
          Text(
            vendor.businessName.trim().isNotEmpty
                ? vendor.businessName
                : 'اسم المتجر غير متوفر',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontFamily: ManagerFontFamily.tajawal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on_outlined,
                  color: Colors.white70, size: 18),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  address,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontFamily: ManagerFontFamily.tajawal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'عدد الفروع',
            value: vendor.branches.length.toString(),
            icon: Icons.storefront_outlined,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'العروض النشطة',
            value: vendor.activeOffersCount.toString(),
            icon: Icons.local_offer_outlined,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffECECEC)),
      ),
      child: Column(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xffF3F4F6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: Colors.black87),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontFamily: ManagerFontFamily.tajawal,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
              fontFamily: ManagerFontFamily.tajawal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectorIcon() {
    if (vendor.sectorIconUrl.trim().isEmpty) {
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xffF3F4F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.category_outlined),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        vendor.sectorIconUrl,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xffF3F4F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.category_outlined),
        ),
      ),
    );
  }

  Widget _buildBranchTile(VendorPublicBranchModel branch) {
    final address = _formatBranchAddress(branch);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffF9FAFB),
        borderRadius: BorderRadius.circular(14),
        border: branch.isMain
            ? Border.all(color: ManagerColors.primaryColor, width: 1.2)
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            branch.isMain ? Icons.star_rounded : Icons.location_on_outlined,
            size: 18,
            color: branch.isMain
                ? ManagerColors.primaryColor
                : ManagerColors.greyColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        branch.name.trim().isNotEmpty ? branch.name : 'فرع',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: ManagerFontFamily.tajawal,
                        ),
                      ),
                    ),
                    if (branch.isMain)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: ManagerColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'الرئيسي',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: ManagerFontFamily.tajawal,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    fontFamily: ManagerFontFamily.tajawal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xffECECEC)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.black87),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: ManagerFontFamily.tajawal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  VendorPublicBranchModel? _getMainBranch(List<VendorPublicBranchModel> branches) {
    if (branches.isEmpty) return null;
    return branches.firstWhere(
      (branch) => branch.isMain,
      orElse: () => branches.first,
    );
  }

  String _formatBranchAddress(VendorPublicBranchModel? branch) {
    if (branch == null) return 'لا يوجد عنوان متاح';

    final parts = <String>[branch.governorate, branch.wilaya, branch.address]
      ..removeWhere((part) => part.trim().isEmpty);

    return parts.isEmpty ? 'لا يوجد عنوان متاح' : parts.join(' - ');
  }
}
