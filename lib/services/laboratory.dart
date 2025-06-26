
// services/api_service.dart
import 'dart:convert';
import 'package:anesu_library_app/models/inventory.dart';
import 'package:anesu_library_app/models/laboratory.dart' hide InventoryItem;
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://am-backend-laboritory.onrender.com/api';

  // Inventory Methods
  static Future<List<InventoryItem>> getInventoryItems() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/inventory'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> items = data['data'] ?? data['inventory'] ?? [];
        
        return items.map((item) => InventoryItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load inventory: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching inventory: $e');
    }
  }

  static Future<InventoryItem> getInventoryItemById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/inventory/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return InventoryItem.fromJson(data['data'] ?? data);
      } else {
        throw Exception('Failed to load item details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching item details: $e');
    }
  }

  static Future<List<InventoryItem>> getInventoryByLaboratory(String labId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/inventory?laboratory=$labId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> items = data['data'] ?? data['inventory'] ?? [];
        
        return items.map((item) => InventoryItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load laboratory inventory: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching laboratory inventory: $e');
    }
  }

  // Laboratory Methods
  static Future<List<Laboratory>> getLaboratories() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/labs'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> labs = data['data'] ?? data['labs'] ?? [];
        
        return labs.map((lab) => Laboratory.fromJson(lab)).toList();
      } else {
        throw Exception('Failed to load laboratories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching laboratories: $e');
    }
  }

  static Future<Laboratory> getLaboratoryById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/labs/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Laboratory.fromJson(data['data'] ?? data);
      } else {
        throw Exception('Failed to load laboratory details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching laboratory details: $e');
    }
  }
}