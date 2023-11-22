import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/buisnessLogic/tapcategorybloc/tap_category_bloc.dart';
import 'package:onlineshop/buisnessLogic/tapcategorybloc/tap_category_event.dart';
import 'package:onlineshop/buisnessLogic/tapcategorybloc/tap_category_state.dart';
import 'package:onlineshop/core/constants/category.dart';
import 'package:onlineshop/core/widgets/text_widget.dart';
import 'package:onlineshop/repositories/get_filter_repo.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool getPro = false;
  TapFilterBloc tapFilterBloc = TapFilterBloc();

// bu yerda agar json to'g'ri bo'lsa ishlaydigan kod bor

  // CategoryBloc categoryBloc = CategoryBloc();
  // @override
  // void initState() {
  //   super.initState();
  //   categoryBloc.add(CategoryGet());
  // }
  String? urll;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: TextForAppBar(title: "Filter", fs: 28.0),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 270.0,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: categoryListFilterPage.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    FilterCategoryRepository.urildata =
                        categoryListFilterPage[index];
                    getPro ? tapFilterBloc.add(GetFilterEvent()) : null;

                    getPro = true;
                    setState(() {});
                  },
                  child: Card(
                    elevation: 2.0,
                    shadowColor: Colors.amberAccent,
                    child: ListTile(
                      leading: const Icon(
                        Icons.category_outlined,
                      ),
                      title: Text(
                        categoryListFilterPage[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          getPro
              ? BlocProvider(
                  create: (context) => tapFilterBloc,
                  child: BlocBuilder<TapFilterBloc, TapFilterState>(
                    builder: (context, state) {
                      if (state is TapFilterInitial) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is TapFilterLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is TapFilterLoaded) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 450.0,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 2.0,
                              crossAxisSpacing: 2.0,
                              crossAxisCount: 2,
                            ),
                            itemCount: state.getFilter.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(30.0),
                                  elevation: 3.0,
                                  shadowColor: Colors.amberAccent,
                                  child: Banner(
                                    color: Colors.amberAccent,
                                    location: BannerLocation.topEnd,
                                    message: state.getFilter[index].rating.rate
                                        .toString(),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 5.0),
                                        SizedBox(
                                          height: 140,
                                          width: 140,
                                          child: Image.network(
                                            state.getFilter[index].image
                                                .toString(),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(height: 5.0),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: Text(
                                            state.getFilter[index].title
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              : const SizedBox(),
        ],
      ),
      // bu yerda agar json to'g'ri bo'lsa ishlaydigan kod bor

      // body: BlocProvider(
      //   create: (context) => categoryBloc,
      //   child: BlocBuilder<CategoryBloc, CategoryState>(
      //     builder: (context, state) {
      //       if (state is CategoryInitial) {
      //         return const Center(
      //           child: Text("Initial ..."),
      //         );
      //       } else if (state is CategoryLoading) {
      //         return const Center(
      //           child: Text("Loading ..."),
      //         );
      //       } else if (state is CategoryLoaded) {
      //         return ListView.builder(
      //           itemCount: state.getData.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               child: ListTile(
      //                 title: Text(state.getData[index].categories.toString()),
      //               ),
      //             );
      //           },
      //         );
      //       } else {
      //         return const SizedBox();
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
