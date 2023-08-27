import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchcontroller = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: ((context, state) {}),
      builder: ((context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: defaultTextFormField(
                    controller: searchcontroller,
                    inputType: TextInputType.text,
                    text: 'Search',
                    prefix: (Icons.search),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    }),
              ),
              Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      }),
    );
  }
}
