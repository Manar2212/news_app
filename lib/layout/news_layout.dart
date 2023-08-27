import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_projects/layout/cubit/states.dart';
import '../modules/search_screen/search_screen.dart';
import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import 'cubit/cubit.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({super.key});

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              navigateTo(context, SearchScreen());
            },
          ),
          IconButton(
              onPressed: () {
                AppCubit.get(context).changeMode();
              },
              icon: Icon(Icons.brightness_4_outlined))
        ],
      ),
      body: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            body: cubit.screes[cubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentindex,
              onTap: (value) {
                cubit.changeBottomNavBar(value);
              },
            ),
          );
        },
      ),
    );
  }
}
