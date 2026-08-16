import 'package:go_router/go_router.dart';
import '../../features/add_contact/add_contact_page.dart';
import '../../features/my_contact/contact_page.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.contacts,

  routes: [
    GoRoute(
      path: AppRoutes.contacts,
      builder: (context, state) => const MyContactPage(),
    ),

    GoRoute(
      path: AppRoutes.addContact,
      builder: (context, state) => const AddContactPage(),
    ),

    
  ],
);