import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/buisnessLogic/userbasketadminbloc/user_basket_admin_bloc.dart';
import 'package:onlineshop/buisnessLogic/userbasketadminbloc/user_basket_admin_event.dart';
import 'package:onlineshop/buisnessLogic/userbasketadminbloc/user_basket_admin_state.dart';
import 'package:onlineshop/core/widgets/text_widget.dart';
import 'package:onlineshop/screens/userProducts/user_products_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  UserByBasketAdminBloc userByBasketAdminBloc = UserByBasketAdminBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userByBasketAdminBloc.add(UserBasketGetAdmin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: TextForAppBar(title: "Admin", fs: 28.0),
      ),
      body: BlocProvider(
        create: (context) => userByBasketAdminBloc,
        child: BlocBuilder<UserByBasketAdminBloc, UserBasketAdminState>(
          builder: (context, state) {
            if (state is UserBasketAdminInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserBasketAdminLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserBasketAdminLoaded) {
              return ListView.builder(
                itemCount: state.getdata.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProductPage(
                            getData: state.getdata[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text("UserID"),
                        subtitle: Text(state.getdata[index].date.toString()),
                        leading: Text(state.getdata[index].userId.toString()),
                      ),
                    ),
                  );
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
