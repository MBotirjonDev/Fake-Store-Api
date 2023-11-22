
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/buisnessLogic/selectProductbloc/select_bloc.dart';
import 'package:onlineshop/buisnessLogic/selectProductbloc/select_event.dart';
import 'package:onlineshop/buisnessLogic/selectProductbloc/select_state.dart';
import 'package:onlineshop/core/widgets/text_widget.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  SelectBloc selectBloc = SelectBloc();
  @override
  void initState() {
    selectBloc.add(SelectGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_basket_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 10.0),
        ],
        title: TextForAppBar(title: "Product detail", fs: 25),
      ),
      body: BlocProvider(
        create: (context) => selectBloc,
        child: BlocBuilder<SelectBloc, SelectState>(
          builder: (context, state) {
            if (state is SelectInitial) {
              return const Center(
                child: Text("Initial ..."),
              );
            } else if (state is SelectLoading) {
              return const Center(
                child: Text("Loading ..."),
              );
            } else if (state is SelectLoaded) {
              return ListView.builder(
                itemCount: state.selsectPro.length,
                itemBuilder: (context,index){
                  return Image.network(state.selsectPro[index].image.toString());
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
