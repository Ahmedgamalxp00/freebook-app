import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebook_app/core/widgets/custom_indicator.dart';
import 'package:freebook_app/core/widgets/error_widget.dart';
import 'package:freebook_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:freebook_app/features/home/presentation/views/widgets/book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 30),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return BookItem(
                    imageUrl:
                        state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                            '',
                    book: state.books[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: state.books.length),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErorrWidget(errMassage: state.errMassage);
        } else {
          return const Center(
            child: CustomIndicator(),
          );
        }
      },
    );
  }
}
