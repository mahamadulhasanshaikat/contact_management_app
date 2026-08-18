import 'package:flutter/material.dart';
import '../data/db_helper.dart';
import '../models/contact_model.dart';

class ContactViewModel extends ChangeNotifier {
  static final ContactViewModel instance = ContactViewModel._internal();
  ContactViewModel._internal();

  final DBHelper _dbHelper = DBHelper.instance;

  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  String _searchQuery = '';
  bool _isLoading = false;

  List<Contact> get contacts => _contacts;
  List<Contact> get favoriteContacts => _contacts.where((c) => c.isFavorite == 1).toList();
  List<Contact> get filteredContacts => _filteredContacts;
  String get searchQuery => _searchQuery;
  bool get isLoading => _isLoading;

  Future<void> fetchContacts() async {
    _isLoading = true;
    notifyListeners();
    _contacts = await _dbHelper.getAllContacts();
    _isLoading = false;
    notifyListeners();
  }

  // Add Contact Method
  Future<void> addContact(Contact contact) async {
    await _dbHelper.insertContact(contact);
    await fetchContacts();
  }

  // Update Contact Method
  Future<void> updateContact(Contact contact) async {
    await _dbHelper.updateContact(contact);
    await fetchContacts();
  }

  // Toggle Favorite
  Future<void> toggleFavorite(Contact contact) async {
    final updated = contact.copyWith(isFavorite: contact.isFavorite == 1 ? 0 : 1);
    await _dbHelper.updateContact(updated);
    await fetchContacts();
  }

  // Delete Contact Method
  Future<void> deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    await fetchContacts();
  }

  // Search Logic
  void search(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _filteredContacts = [];
    } else {
      _filteredContacts = _contacts
          .where((c) =>
              c.name.toLowerCase().contains(query.toLowerCase()) ||
              c.phone.contains(query) ||
              c.email.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}