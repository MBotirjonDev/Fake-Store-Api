import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/buisnessLogic/product/get_pro_bloc.dart';
import 'package:onlineshop/buisnessLogic/product/get_pro_event.dart';
import 'package:onlineshop/buisnessLogic/product/get_pro_state.dart';
import 'package:onlineshop/core/constants/bottom_item.dart';
import 'package:onlineshop/core/constants/category.dart';
import 'package:onlineshop/core/widgets/text_widget.dart';
import 'package:onlineshop/repositories/select_product_repository.dart';
import 'package:onlineshop/screens/admin/admin_page.dart';
import 'package:onlineshop/screens/basket/basket_page.dart';
import 'package:onlineshop/screens/filter/filter_page.dart';
import 'package:onlineshop/screens/product/product_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tappedIndex = 0;
  final PageController _pageController = PageController();
  GetProductBloc _getProductBloc = GetProductBloc();
  @override
  void initState() {
    _getProductBloc.add(GetAllProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          homePage(),
          const FilterPage(),
          const BasketPage(),
          const AdminPage(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: tappedIndex,
        onTap: (index) {
          tappedIndex = index;
          _pageController.jumpToPage(index);
        },
      ),
      // bottomNavigationBar: BlocConsumer<BottomBloc, BottomState>(
      //   listener: (context, state) {},
      //   builder: (context, state) {
      //     return BottomNavigationBar(
      //       items: bottomNavItems,
      //       currentIndex: state.tabIndex,
      //       onTap: (index) {
      //         BlocProvider.of<BottomBloc>(context)
      //             .add(TabChange(tabIndex: index));
      //       },
      //     );
      //   },
      // ),
    );
  }

  Widget homePage() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: TextForAppBar(
          title: "Welcome !",
          fs: 28.0,
        ),
      ),
      body: BlocProvider(
        create: (context) => _getProductBloc,
        child: BlocBuilder<GetProductBloc, GetProductState>(
          builder: (context, state) {
            if (state is GetProductInitial) {
              return const Center(
                child: Text("Initial ..."),
              );
            } else if (state is GetProductLoading) {
              return const Center(
                child: Text("Loading ..."),
              );
            } else if (state is GetProductLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  crossAxisCount: 2,
                ),
                itemCount: state.getDataALL.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () async {
                        // String selectID;
                        // selectID = state.getData[index].id.toString();
                        // SelectProRepository.selectId = selectID;
                        String url =
                            "https://fakestoreapi.com/products/${state.getDataALL[index].id.toString()}";

                        // selectIdPro.add(index.toString());
                        // SelectProRepository.selectId = selectIdPro[0];
                        SelectProRepository.selectId = url;

                        print(state.getDataALL[index].id.toString() +
                            "  bu ontap");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailPage(),
                          ),
                        );
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 3.0,
                        shadowColor: Colors.green,
                        child: Banner(
                          color: Colors.green,
                          location: BannerLocation.topEnd,
                          message:
                              state.getDataALL[index].rating!.rate.toString(),
                          child: Column(
                            children: [
                              const SizedBox(height: 5.0),
                              SizedBox(
                                height: 140,
                                width: 140,
                                child: Image.network(
                                  state.getDataALL[index].image.toString(),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  state.getDataALL[index].title.toString(),
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
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
