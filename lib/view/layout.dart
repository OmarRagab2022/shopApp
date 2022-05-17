import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/home/cubit.dart';
import '../viewModel/home/states.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: ShopCubit.get(context).widgets[ShopCubit.get(context).index],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: ShopCubit.get(context).index,
            onTap: (int index){
              ShopCubit.get(context).changeBottomBarIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}