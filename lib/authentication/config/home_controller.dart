import 'dart:convert';
import 'package:fintech/authentication/config/model.dart';
import 'package:fintech/authentication/values/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Future<UserBalanceModel>? userBalance;
  Future<List<TransactionsModel>>? allTransactions;

  @override
  void onInit() {
    userBalance;
    allTransactions;
    userBalance = getUserDetails();
    allTransactions = getAllTransactions();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<UserBalanceModel> getUserDetails() async {
    final response =
        await http.get(Uri.parse('${AppConstants.baseUrl}/balance'));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final reform = UserBalanceModel.fromJson(
          json.decode(response.body),
        );
        return reform;
      } else {
        throw Exception('Failed to load items');
      }
    } else {
      throw Exception('Failed to load items');
    }
  }

    Future<List<TransactionsModel>> getAllTransactions() async {
    final response =
        await http.get(Uri.parse('${AppConstants.baseUrl}/transactions'));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final reform =List<TransactionsModel>.from(
          json.decode(response.body)['transactions'].map(
                (data) => TransactionsModel.fromJson(data),
              ),
        );
        return reform;
      } else {
        throw Exception('Failed to load items');
      }
    } else {
      throw Exception('Failed to load items');
    }
  }
}
