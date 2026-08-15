import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../core/widgets/custom_search_bar.dart';

class MyContactPage extends StatefulWidget {
  const MyContactPage({super.key});

  @override
  State<MyContactPage> createState() => _MyContactPageState();
}

class _MyContactPageState extends State<MyContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: Container(),
      //AppBar
      appBar: AppBar(
        title: Text("My Contacts", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.appbar,
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

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),

                    child: Material(
                      elevation: 3,
                      shadowColor: Colors.black26,
                      borderRadius: BorderRadius.circular(12),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColors.primary,
                          child: const Text(
                            "AS",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        title: const Text(
                          "Alice Smith",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "alice@example.com",
                              style: TextStyle(fontSize: 11),
                            ),
                            Text("01711111111", style: TextStyle(fontSize: 11)),
                          ],
                        ),
                        trailing: const Icon(Icons.chevron_right, size: 22),
                        onTap: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
