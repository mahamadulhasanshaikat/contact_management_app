import 'package:contact_management_app/views/contact_details/contact_details_page.dart';
import 'package:go_router/go_router.dart';
import '../../models/contact_model.dart';
import '../../views/add_contact/add_contact_page.dart';
import '../../views/edit_contact/edit_contact_page.dart';
import '../../views/favorites/favorites_page.dart';
import '../../views/my_contact/contact_page.dart';
import '../../views/settings/settings_page.dart';
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

    GoRoute(
      path: AppRoutes.contactDetails,
      builder: (context, state) {
        final contact = state.extra as Contact;
        return ContactDetailsPage(contact: contact);
      },
    ),

    GoRoute(
      path: AppRoutes.favorites,
      builder: (context, state) => FavoritesPage(),
    ),
    GoRoute(
      path: AppRoutes.editContact,
      builder: (context, state) {
        final contact = state.extra as Contact;
        return EditContactPage(contact: contact);
      },
    ),

    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => SettingsPage(),
    ),
  ],
);
