import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebook_app/core/utils/app_router.dart';
import 'package:freebook_app/core/widgets/custom_indicator.dart';
import 'package:freebook_app/features/home/presentation/manager/book_detailes_cubit/book_detailes_cubit.dart';
import 'package:go_router/go_router.dart';

class RelatedBooksListView extends StatelessWidget {
  const RelatedBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailesCubit, BookDetailesState>(
      builder: (context, state) {
        if (state is BookDetailesSuccess) {
          return SizedBox(
            height: 125,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 30),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push(AppRouter.kHomeDetailesView,
                          extra: state.books[index]);
                    },
                    child: SizedBox(
                      height: 125,
                      child: AspectRatio(
                        aspectRatio: 2.7 / 4,
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Center(child: Icon(Icons.error)),
                          fit: BoxFit.fill,
                          imageUrl: state.books[index].volumeInfo?.imageLinks
                                  ?.thumbnail ??
                              'https://www.shutterstock.com/image-vector/no-image-available-icon-template-260nw-1036735678.jpg',
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: state.books.length),
          );
        } else if (state is BookDetailesfailure) {
          return ErrorWidget(state.errMassage);
        } else {
          return const CustomIndicator();
        }
      },
    );
  }
}
