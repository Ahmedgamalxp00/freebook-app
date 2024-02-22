import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:freebook_app/features/home/presentation/manager/book_detailes_cubit/book_detailes_cubit.dart';
import 'package:freebook_app/features/home/presentation/views/widgets/detailes_view_appbar.dart';
import 'widgets/book_detailes.dart';
import 'widgets/botton_action.dart';
import 'widgets/related_Books_section.dart';

class HomeDetailesView extends StatefulWidget {
  const HomeDetailesView({super.key, required this.book});
  final BookModel book;
  @override
  State<HomeDetailesView> createState() => _HomeDetailesViewState();
}

class _HomeDetailesViewState extends State<HomeDetailesView> {
  _HomeDetailesViewState();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BookDetailesCubit>(context).fetchRelatedBooks(
      category: widget.book.volumeInfo!.categories![0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DetailesViewAppBar(),
          BookDetailes(
            book: widget.book,
          ),
          const SizedBox(
            height: 30,
          ),
          BottonAction(
            book: widget.book,
          ),
          const SizedBox(
            height: 20,
          ),
          const Spacer(),
          const RelatedBooksSection(),
        ],
      ),
    );
  }
}
