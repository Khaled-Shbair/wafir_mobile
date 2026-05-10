import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/config/constants/app_constants.dart';
import 'package:wafir_mobile/config/dependency_injection.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_fonts.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/core/widgets/custom_search_filter_bottom_sheet.dart';
import 'package:wafir_mobile/core/widgets/custom_spacing.dart';
import 'package:wafir_mobile/core/widgets/custom_text_field.dart';
import 'package:wafir_mobile/features/home/presentation/view/widgets/custom_section_header.dart';
import 'package:wafir_mobile/features/vendors/domain/model/vendors_public_model.dart';
import 'package:wafir_mobile/features/vendors/presentation/controller/vendors_bloc.dart';
import 'package:wafir_mobile/routes/routes.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({this.sectorName, super.key});

  final String? sectorName;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VendorsBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('المتاجر'),
        leading: IconButton(
          onPressed: () {
            disposePublicVendors();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: BlocBuilder<VendorsBloc, VendorsState>(
        builder: (context, state) {
          if (state is VendorsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: ManagerColors.primaryColor,
              ),
            );
          }

          if (state is VendorsFailure) {
            return Center(child: Text(state.message));
          }

          if (state is VendorsLoaded) {
            return SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidths.w15,
                end: ManagerWidths.w15,
                top: ManagerHeights.h15,
                bottom: ManagerHeights.h15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    textInputAction: TextInputAction.search,
                    controller: bloc.search,
                    onFieldSubmitted: (_) =>
                        bloc.add(GetPublicVendorsEvent(sectorName)),
                    hintText: ManagerStrings.searchOnStoreOrOffer,
                    prefixIcon: Icon(
                      Icons.search,
                      size: ManagerIconsSizes.i24,
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(ManagerRadius.r20),
                            ),
                          ),
                          builder: (context) => CustomSearchFilterBottomSheet(
                            categories: AppConstants.categories,
                            selectedCategory: state.selectedCategory,
                            selectedGovernorate: state.selectedGovernorate,
                            selectedWilaya: state.selectedWilaya,
                            onApply: (selection) {
                              bloc.add(
                                CategoryChangedVendorsEvent(selection.category),
                              );
                              bloc.add(
                                GovernorateChangedVendorsEvent(
                                  selection.governorate,
                                ),
                              );
                              bloc.add(
                                WilayaChangedVendorsEvent(selection.wilaya),
                              );
                              bloc.add(GetPublicVendorsEvent(sectorName));
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.filter_list_outlined,
                        size: ManagerIconsSizes.i24,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  verticalSpace(ManagerHeights.h20),
                  const CustomSectionHeader(title: 'المتاجر المتاحة'),
                  verticalSpace(ManagerHeights.h15),
                  if (state.vendors.isEmpty)
                    Center(
                      child: Text(
                        'لا توجد متاجر متاحة حالياً',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.vendors.length,
                      separatorBuilder: (_, __) =>
                          verticalSpace(ManagerHeights.h10),
                      itemBuilder: (context, index) {
                        return _VendorListCard(vendor: state.vendors[index]);
                      },
                    ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _VendorListCard extends StatelessWidget {
  const _VendorListCard({required this.vendor});

  final VendorPublicItemModel vendor;

  @override
  Widget build(BuildContext context) {
    final branch = _primaryBranch(vendor.branches);
    final address = _formatAddress(branch);

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        Routes.vendorDetailsScreen,
        arguments: vendor.id,
      ),
      child: Container(
        padding: EdgeInsetsDirectional.all(ManagerWidths.w12),
        decoration: BoxDecoration(
          color: ManagerColors.whiteColor,
          borderRadius: BorderRadius.circular(ManagerRadius.r15),
          border: Border.all(color: const Color(0xFFE2E8EA)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _VendorLogo(url: vendor.logoUrl),
            horizontalSpace(ManagerWidths.w12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vendor.businessName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: ManagerFontsSizes.f16,
                          fontWeight: ManagerFontWeight.bold,
                        ),
                  ),
                  verticalSpace(ManagerHeights.h5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: ManagerIconsSizes.i18,
                        color: ManagerColors.secondaryColor,
                      ),
                      horizontalSpace(ManagerWidths.w5),
                      Expanded(
                        child: Text(
                          address,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontWeight: ManagerFontWeight.regular,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(ManagerHeights.h5),
                  Text(
                    vendor.sectorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ManagerColors.greyColor,
                          fontSize: ManagerFontsSizes.f12,
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

  VendorPublicBranchModel? _primaryBranch(
    List<VendorPublicBranchModel> branches,
  ) {
    if (branches.isEmpty) return null;
    return branches.firstWhere(
      (branch) => branch.isMain,
      orElse: () => branches.first,
    );
  }

  String _formatAddress(VendorPublicBranchModel? branch) {
    if (branch == null) {
      return 'لا يوجد عنوان متاح';
    }

    final parts = <String>[
      branch.governorate,
      branch.wilaya,
      branch.address,
    ]..removeWhere((part) => part.trim().isEmpty);

    if (parts.isEmpty) {
      return 'لا يوجد عنوان متاح';
    }

    return parts.join(' - ');
  }
}

class _VendorLogo extends StatelessWidget {
  const _VendorLogo({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider = url.trim().isNotEmpty
        ? CachedNetworkImageProvider(url)
        : const AssetImage('assets/images/icons/info.png');

    return Container(
      width: ManagerWidths.w55,
      height: ManagerHeights.h55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r10),
        color: const Color(0xFFEAF3F4),
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    );
  }
}
