import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebook_app/core/widgets/custom_indicator.dart';
import 'package:freebook_app/core/widgets/error_widget.dart';
import 'package:freebook_app/features/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';

import 'best_seller_listview_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return BestSellerListViewItem(
                book: state.books[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: state.books.length,
          );
        } else if (state is BestSellerFailure) {
          return CustomErorrWidget(errMassage: state.errMassage);
        } else {
          return const Center(child: CustomIndicator());
        }
      },
    );
  }
}
