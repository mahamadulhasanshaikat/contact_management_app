import 'package:go_router/go_router.dart';
import '../../views/add_contact/add_contact_page.dart';
import '../../views/my_contact/contact_page.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.contacts,

  routes: [
    GoRoute(
      path: AppRoutes.contacts,
      builder: (context, state) => MyContactPage(),
    ),

    GoRoute(
      path: AppRoutes.addContact,
      builder: (context, state) => AddContactPage(),
    ),

    // GoRoute(
    //   path: AppRoutes.contactDetails,
    //   builder: (context, state) {
    //     final contact = state.extra as Map<String, dynamic>;

    //     return ContactDetailsPage(contact: contact);
    //   },
    // ),

    // GoRoute(
    //   path: AppRoutes.editContact,
    //   builder: (context, state) => const EditContactPage(contact: {}),
    // ),
  ],
);
