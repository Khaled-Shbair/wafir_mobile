import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/features/offers/domain/model/my_claims_model.dart';
import 'package:wafir_mobile/features/offers/presentation/controller/my_claims_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyClaimsScreen extends StatelessWidget {
  const MyClaimsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('طلباتي'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<MyClaimsBloc, MyClaimsState>(
        builder: (context, state) {
          if (state is MyClaimsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: ManagerColors.primaryColor,
              ),
            );
          } else if (state is MyClaimsLoaded) {
            final items = state.claims.claims;
            if (items.isEmpty) {
              return Center(
                child: Text(
                  'لا توجد طلبات حالياً',
                  style: TextStyle(
                    fontSize: ManagerFontsSizes.f16,
                    fontWeight: FontWeight.w500,
                    color: ManagerColors.blackColor,
                  ),
                ),
              );
            }
            return ListView.builder(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidths.w15,
                end: ManagerWidths.w15,
                top: ManagerHeights.h15,
                bottom: ManagerHeights.h15,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _buildClaimCard(items[index]);
              },
            );
          } else if (state is MyClaimsFailure) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildClaimCard(ClaimItemModel claim) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    final expiryDate = DateTime.tryParse(claim.expiresAt);

    return Container(
      margin: EdgeInsets.only(bottom: ManagerHeights.h15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // صورة العرض
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: claim.offer.imageUrl,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Container(
                    color: ManagerColors.greyColor.withValues(alpha: 0.2),
                    child: const Icon(Icons.image_not_supported_outlined),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ManagerWidths.w12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم العرض مع التخفيف
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        claim.offer.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ManagerFontsSizes.f14,
                          fontWeight: FontWeight.bold,
                          color: ManagerColors.blackColor,
                        ),
                      ),
                    ),
                    horizontalSpace(ManagerWidths.w5),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ManagerWidths.w5,
                        vertical: ManagerHeights.h3,
                      ),
                      decoration: BoxDecoration(
                        color: ManagerColors.primaryColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '-${claim.offer.discountPercentage}%',
                        style: TextStyle(
                          fontSize: ManagerFontsSizes.f12,
                          fontWeight: FontWeight.bold,
                          color: ManagerColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(ManagerHeights.h8),
                // اسم المتجر
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: claim.offer.vendorLogoUrl,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) {
                            return Container(
                              color: ManagerColors.greyColor.withValues(alpha: 0.2),
                              child: const Icon(
                                Icons.store_outlined,
                                size: 12,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    horizontalSpace(ManagerWidths.w5),
                    Expanded(
                      child: Text(
                        claim.offer.vendorBusinessName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ManagerFontsSizes.f12,
                          color: ManagerColors.greyColor,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(ManagerHeights.h10),
                // كود الطلب
                Container(
                  padding: EdgeInsets.all(ManagerWidths.w5),
                  decoration: BoxDecoration(
                    color: ManagerColors.primaryColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.confirmation_num_outlined,
                        size: 16,
                        color: ManagerColors.primaryColor,
                      ),
                      horizontalSpace(ManagerWidths.w5),
                      Expanded(
                        child: Text(
                          'الكود: ${claim.claimCode}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ManagerFontsSizes.f12,
                            fontWeight: FontWeight.bold,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(ManagerHeights.h8),
                // التاريخ والحالة
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الحالة: ${_getStatusText(claim.status)}',
                      style: TextStyle(
                        fontSize: ManagerFontsSizes.f11,
                        color: _getStatusColor(claim.status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (expiryDate != null)
                      Text(
                        'ينتهي: ${dateFormat.format(expiryDate)}',
                        style: TextStyle(
                          fontSize: ManagerFontsSizes.f11,
                          color: ManagerColors.greyColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return 'قيد الانتظار';
      case 'redeemed':
        return 'مستخدم';
      case 'expired':
        return 'منتهي الصلاحية';
      default:
        return status;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'redeemed':
        return Colors.green;
      case 'expired':
        return Colors.red;
      default:
        return ManagerColors.greyColor;
    }
  }
}






