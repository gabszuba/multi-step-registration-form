import 'package:flutter/material.dart';

class PlanProvider extends ChangeNotifier {
  List<String> planNamesList = ["Individual", "Equipe", "Empresa"];
  List<double> planPricesList = [99.99, 199.99, 299.99];
  String planType;
  double planPrice;
  Map data = {'name': String, 'email': String, 'age': String};

  PlanProvider({this.planType = "Individual", this.planPrice = 99.99});

  selectPlan(int newPlanIndex) {
    planType = planNamesList[newPlanIndex];
    planPrice = planPricesList[newPlanIndex];
    notifyListeners();
  }

  updateAccount(input) {
    data = input;
    notifyListeners();
  }
}
