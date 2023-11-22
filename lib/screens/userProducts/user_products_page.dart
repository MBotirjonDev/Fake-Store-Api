import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/buisnessLogic/product/get_pro_bloc.dart';
import 'package:onlineshop/buisnessLogic/product/get_pro_event.dart';
import 'package:onlineshop/buisnessLogic/product/get_pro_state.dart';
import 'package:onlineshop/core/widgets/text_widget.dart';
import 'package:onlineshop/models/user_by_basket_model.dart';

class UserProductPage extends StatefulWidget {
  UserBybasketModel getData;
  UserProductPage({required this.getData, super.key});

  @override
  State<UserProductPage> createState() => _UserProductPageState();
}

class _UserProductPageState extends State<UserProductPage> {
  GetProductBloc getProductBloc = GetProductBloc();
  @override
  void initState() {
    super.initState();
    getProductBloc.add(GetAllProduct());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: TextForAppBar(
          title: "User Carts!",
          fs: 28.0,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "${widget.getData.userId} User id",
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: BlocProvider(
                    create: (context) => getProductBloc,
                    child: BlocBuilder<GetProductBloc, GetProductState>(
                      builder: (context, state) {
                        if (state is GetProductInitial) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is GetProductLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is GetProductLoaded) {
                          return ListView.builder(
                            itemCount: widget.getData.products.length,
                            itemBuilder: (context, index) {
                              for (var i = 0;
                                  i < state.getDataALL.length;
                                  i++) {
                                if (state.getDataALL[i].id ==
                                    widget.getData.products[index].productId) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Column(
                                      children: [
                                        Card(
                                          color: Colors.greenAccent,
                                          elevation: 2.0,
                                          child: ListTile(
                                            title: Column(
                                              children: [
                                                Text(
                                                    "${widget.getData.products[index].productId} Product id"),
                                                Text(
                                                    "${widget.getData.products[index].quantity} Quantity "),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10.0),
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          elevation: 3.0,
                                          shadowColor: Colors.green,
                                          child: SizedBox(
                                             height: 300,
                                            child: Banner(
                                              color: Colors.green,
                                              location: BannerLocation.topEnd,
                                              message: state
                                                  .getDataALL[i].rating!.rate
                                                  .toString(),
                                              child: Column(
                                                children: [
                                                  const SizedBox(height: 5.0),
                                                  SizedBox(
                                                    height: 200,
                                                    width: 200,
                                                    child: Image.network(
                                                      state.getDataALL[i].image
                                                          .toString(),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5.0),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 4.0),
                                                    child: Text(
                                                      state.getDataALL[i].title
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 11.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }

                              return Container();
                            },
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
