import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/home/home_view.dart';
import 'package:instagram/home/search_view.dart';
import 'package:instagram/state/bottom_now_bar_cubit.dart';

class instagram2 extends StatefulWidget {
  const instagram2({super.key});

  @override
  State<instagram2> createState() => _instagram2State();
}

class _instagram2State extends State<instagram2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: context.watch<BottomNowBarCubit>().state.a,
        children: [
          HomeView(),
          SearchView(),
          Text('Reels'),
          Text('Oynatma'),
          Text('Profil'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: BlocProvider.of<BottomNowBarCubit>(context).onTop,
        type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<BottomNowBarCubit>().state.a,
        items: [
          BottomNavigationBarItem(
            label: "Anasayfa",
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Arama",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Reels",
            icon: Icon(Icons.plus_one_rounded),
          ),
          BottomNavigationBarItem(
            label: "Oynatma",
            icon: Icon(Icons.play_arrow),
          ),
          BottomNavigationBarItem(
            label: "Profil",
            icon: Icon(Icons.photo),
          ),
        ],
      ),
    );
  }
}
