import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebook_app/core/utils/styles.dart';
import 'package:freebook_app/core/widgets/custom_indicator.dart';
import 'package:freebook_app/core/widgets/error_widget.dart';
import 'package:freebook_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:freebook_app/features/search/presentation/views/widgets/search_item.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({super.key});

  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return SearchListViewItem(
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
        } else if (state is SearchFailure) {
          return CustomErorrWidget(errMassage: state.errMassage);
        } else if (state is SearchLoading) {
          return const CustomIndicator();
        } else {
          return const Column(
            children: [
              Center(
                child: Text(
                  'no result',
                  style: Styles.textstyle18,
                ),
              )
            ],
          );
        }
      },
    );
  }
}
