import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/routes/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../viewmodels/contact_viewmodel.dart';
import '../drawer/custom_drawer.dart';
import '../../core/widgets/custom_search_bar.dart';
import 'widgets/user_list.dart';

class MyContactPage extends StatefulWidget {
  const MyContactPage({super.key});

  @override
  State<MyContactPage> createState() => _MyContactPageState();
}

class _MyContactPageState extends State<MyContactPage> {
  final ContactViewModel _viewModel = ContactViewModel.instance;
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchContacts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ModernDrawer(),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          "My Contacts",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.appbar,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            color: Colors.white,
            onPressed: () {},
            //onPressed: () => context.push(AppRoutes.searchContact),
          ),
          IconButton(
            icon: Icon(Icons.more_vert_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            return Column(
              children: [
                CustomSearchBar(
                  controller: _searchController,
                  onChanged: (query) => _viewModel.search(query),
                  onClear: () {
                    _searchController.clear();
                    _viewModel.search('');
                  },
                ),
                UserList(viewModel: _viewModel),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoutes.addContact),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
