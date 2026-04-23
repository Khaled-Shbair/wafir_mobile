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
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
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
            _buildStatsSection(context),
            verticalSpace(ManagerHeights.h15),
            _buildInfoCard(
              context: context,
              title: 'عن المتجر',
              icon: Icons.info_outline,
              child: Text(
                vendor.description.trim().isNotEmpty
                    ? vendor.description
                    : 'لا يوجد وصف متاح',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            verticalSpace(ManagerHeights.h15),
            _buildInfoCard(
              title: 'الفروع',
              context: context,
              icon: Icons.account_tree_outlined,
              child: vendor.branches.isEmpty
                  ? Text(
                      'لا يوجد فروع متاحة',
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  : Column(
                      children: vendor.branches
                          .map((branch) => _buildBranchTile(branch, context))
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
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: ManagerWidths.w18,
        vertical: ManagerHeights.h18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r22),
        gradient: LinearGradient(
          colors: [ManagerColors.primaryColor, ManagerColors.blackColor],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
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
            width: ManagerWidths.w100,
            height: ManagerHeights.h100,
            decoration: BoxDecoration(
              color: ManagerColors.whiteColor,
              borderRadius: BorderRadius.circular(
                ManagerRadius.r22,
              ),
              image: vendor.logoUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(vendor.logoUrl),
                      fit: BoxFit.fill,
                    )
                  : null,
            ),
            child: vendor.logoUrl.trim().isEmpty
                ? Icon(Icons.storefront, size: ManagerIconsSizes.i28)
                : null,
          ),
          verticalSpace(ManagerHeights.h15),
          Text(
            vendor.businessName.trim().isNotEmpty
                ? vendor.businessName
                : 'اسم المتجر غير متوفر',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: ManagerFontsSizes.f22,
                ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(ManagerHeights.h8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined,
                  color: Colors.white70, size: ManagerIconsSizes.i18),
              horizontalSpace(ManagerWidths.w5),
              Flexible(
                child: Text(
                  address,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: ManagerFontsSizes.f14,
                        color: Colors.white70,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context: context,
            title: 'عدد الفروع',
            value: vendor.branches.length.toString(),
            icon: Icons.storefront_outlined,
          ),
        ),
        horizontalSpace(ManagerWidths.w12),
        Expanded(
          child: _buildStatCard(
            context: context,
            title: 'العروض النشطة',
            value: vendor.activeOffersCount.toString(),
            icon: Icons.local_offer_outlined,
          ),
        ),
        horizontalSpace(ManagerWidths.w12),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required BuildContext context,
  }) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: ManagerWidths.w12,
        vertical: ManagerHeights.h12,
      ),
      decoration: BoxDecoration(
        color: ManagerColors.whiteColor,
        borderRadius: BorderRadius.circular(ManagerRadius.r15),
        border: Border.all(color: const Color(0xffECECEC)),
      ),
      child: Column(
        children: [
          Container(
            width: ManagerWidths.w45,
            height: ManagerHeights.h45,
            decoration: BoxDecoration(
              color: const Color(0xffF3F4F6),
              borderRadius: BorderRadius.circular(ManagerRadius.r15),
            ),
            child: Icon(icon, color: Colors.black87),
          ),
          verticalSpace(ManagerHeights.h10),
          Text(value,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith()),
          verticalSpace(ManagerHeights.h5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildBranchTile(
      VendorPublicBranchModel branch, BuildContext context) {
    final address = _formatBranchAddress(branch);

    return Container(
        margin: EdgeInsets.only(bottom: ManagerHeights.h10),
        padding: EdgeInsets.symmetric(
          horizontal: ManagerWidths.w12,
          vertical: ManagerHeights.h12,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffF9FAFB),
          borderRadius: BorderRadius.circular(ManagerRadius.r10),
          border: branch.isMain
              ? Border.all(color: ManagerColors.primaryColor, width: 1.2)
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              branch.isMain ? Icons.star_rounded : Icons.location_on_outlined,
              size: ManagerIconsSizes.i18,
              color: branch.isMain
                  ? ManagerColors.primaryColor
                  : ManagerColors.greyColor,
            ),
            horizontalSpace(ManagerWidths.w10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          branch.name.trim().isNotEmpty ? branch.name : 'فرع',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      if (branch.isMain)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: ManagerWidths.w7,
                            vertical: ManagerHeights.h3,
                          ),
                          decoration: BoxDecoration(
                            color: ManagerColors.primaryColor,
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r10),
                          ),
                          child: Text(
                            'الرئيسي',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: ManagerColors.whiteColor,
                                ),
                          ),
                        ),
                    ],
                  ),
                  verticalSpace(ManagerHeights.h5),
                  Text(
                    address,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: ManagerFontsSizes.f14,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Widget child,
    required BuildContext context,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: ManagerWidths.w15, vertical: ManagerHeights.h15),
      decoration: BoxDecoration(
        color: ManagerColors.whiteColor,
        borderRadius: BorderRadius.circular(ManagerRadius.r22),
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
                width: ManagerWidths.w45,
                height: ManagerHeights.h45,
                decoration: BoxDecoration(
                  color: const Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(ManagerRadius.r15),
                ),
                child: Icon(icon, color: ManagerColors.blackColor),
              ),
              horizontalSpace(ManagerWidths.w10),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: ManagerFontsSizes.f18,
                    ),
              ),
            ],
          ),
          verticalSpace(ManagerHeights.h12),
          child,
        ],
      ),
    );
  }

  VendorPublicBranchModel? _getMainBranch(
      List<VendorPublicBranchModel> branches) {
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
