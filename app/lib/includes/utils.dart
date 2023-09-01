import 'package:app/models/cash_flow.dart';

List<DateTime> dates(List<CashFlow> cashflow){
  List<DateTime> dates = [];
  cashflow.forEach((CashFlow cashflow) {
    List date = dates.where((e) => e.day == cashflow.date.day && e.month == cashflow.date.month && e.year == cashflow.date.year).toList();
    if(date.isEmpty){
      dates.add(cashflow.date);
    }
  });
  dates.sort((a, b) => b.compareTo(a));
  // Remove duplicates
  dates.toSet().toList();
  return dates;
}

List<String> categories(List list) {
  List<String> categories = [];
  list.forEach((element) {
    if(!categories.contains(element.category)){
      categories.add(element.category ?? "");
    }
  });
  return categories;
}

int total(List<CashFlow> cashflow) {
  int total = 0;
  cashflow.forEach((element) {
    total += element.amount;
  });
  return total;
}

// List<(String, int, int)> taskCategoriesWithCount(List<Task> tasks) {
//   List<(String, int, int)> categories = [];
//   tasks.forEach((element) {
//     if(categories.indexWhere((e) => e.item1 == element.category) == -1){
//       categories.add((element.category ?? "", 1, 0));
//     } else {
//       categories[categories.indexWhere((e) => e.item1 == element.category)].item2++;
//     }
//   });
//   return categories;
// }