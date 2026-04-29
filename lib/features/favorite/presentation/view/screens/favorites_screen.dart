import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';
import 'package:wafir_mobile/core/resource/manager_sizes.dart';
import 'package:wafir_mobile/core/resource/manager_strings.dart';
import 'package:wafir_mobile/features/favorite/presentation/controller/favorite_bloc.dart';
import 'package:wafir_mobile/core/widgets/custom_offer_item_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.favourite),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: ManagerColors.primaryColor,
              ),
            );
          } else if (state is FavoriteLoaded) {
            final items = state.favorites.items;
            if (items.isEmpty) {
              return const Center(
                child: Text(
                  'لا توجد عناصر مفضلة حالياً',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }
            return GridView.builder(
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidths.w15,
                end: ManagerWidths.w15,
                bottom: ManagerHeights.h15,
              ),
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: ManagerWidths.w15,
                mainAxisSpacing: ManagerWidths.w15,
                childAspectRatio: 3 / 5.2,
              ),
              itemBuilder: (context, index) {
                return CustomOfferItemWidget(item: items[index]);
              },
            );
          } else if (state is FavoriteFailure) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
