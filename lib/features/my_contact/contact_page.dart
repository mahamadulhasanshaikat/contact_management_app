import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../drawer/custom_drawer.dart';
import '../../core/constant/custom_search_bar.dart';
import 'widgets/user_list.dart';

class MyContactPage extends StatefulWidget {
  const MyContactPage({super.key});

  @override
  State<MyContactPage> createState() => _MyContactPageState();
}

class _MyContactPageState extends State<MyContactPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: ModernDrawer(),
      backgroundColor: AppColors.background,
      //AppBar
      appBar: AppBar(
        title: Text("My Contacts", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.appbar,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            //SearchBar
            CustomSearchBar(),

            //user list
            UserList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         context.push(AppRoutes.addContact);
        },
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Icon(Icons.person_add_alt_1, color: Colors.white, size: 25),
      ),
    );
  }
}
