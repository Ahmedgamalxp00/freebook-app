import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebook_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:freebook_app/features/search/presentation/views/widgets/search_listview.dart';
import 'package:freebook_app/features/search/presentation/views/widgets/search_textformfield.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              CustomFormField(
                onSubmitted: (value) {
                  BlocProvider.of<SearchCubit>(context).fetchSearchList(
                    category: value,
                  );
                },
                onChanged: (value) {
                  BlocProvider.of<SearchCubit>(context).fetchSearchList(
                    category: value,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(child: SearchListView()),
            ],
          ),
        ),
      ),
    );
  }
}
