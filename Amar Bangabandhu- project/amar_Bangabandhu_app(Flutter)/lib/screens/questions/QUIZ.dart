/*
Developed by: Sakaid Sakir
email: sakirislam7@gmail.com
facebook: fb.com/sakir.me
Project: AMAR BANGABANDHU
*/





void main() {
  final items = [
    ["1. বঙ্গবন্ধু কোন গ্রামে জন্মগ্রহণ করেন?","q1",[[1,"ক. ঠুনকোপাড়া"],[2,"খ. মুন্সিপাড়া"],[3,"গ. টুঙ্গিপাড়া"],[4," ঘ. তুলসিপাড়া"]]],
    ["1. বঙ্গবন্ধু কোন গ্রামে জন্মগ্রহণ করেন?","q1",[[1,"ক. ঠুনকোপাড়া"],[2,"খ. মুন্সিপাড়া"],[3,"গ. টুঙ্গিপাড়া"],[4," ঘ. তুলসিপাড়া"]]],
    ["1. বঙ্গবন্ধু কোন গ্রামে জন্মগ্রহণ করেন?","q1",[[1,"ক. ঠুনকোপাড়া"],[2,"খ. মুন্সিপাড়া"],[3,"গ. টুঙ্গিপাড়া"],[4," ঘ. তুলসিপাড়া"]]],


  ];

  final quiz_seg1_junior = [

    //QSN_ID
    ["QSN_ID", "বঙ্গবন্ধু কোন গ্রামে জন্মগ্রহণ করেন?",[[1,"ঠুনকোপাড়া"],[2,"মুন্সিপাড়া"],[3,"টুঙ্গিপাড়া"],[4," তুলসিপাড়া"]]],
    ["QSN_ID", "গোপালগঞ্জ পাবলিক স্কুলে শেখ মুজিব কোন শ্রেণিতে ভর্তি হন?",[[1,"চতুর্থ শ্রেণী"],[2,"তৃতীয় শ্রেণী"],[3,"প্রথম শ্রেণী"],[4,"দ্বিতীয় শ্রেণী"]]],

  ];



  print(pickRandomItems(items, 3));                  // (7, 4, 3)
  print(pickRandomItemsAsList(items, 3));

  List my=pickRandomItemsAsList(items, 3);

  print(my[0][2]);

  List ans=pickRandomItemsAsList(my[0][2], 4);

  print(ans);
  List hee=ans[0];
  print(hee[0]);



  print(pickRandomItemsAsListWithSubList(items, 3)); // [1, 3, 6]
  print(items); // [1, 2, 3, 4, 5, 6, 7] (just to show that the original List is untouched)
}

Iterable<T> pickRandomItems<T>(List<T> items, int count) =>
    (items.toList()..shuffle()).take(count);

List<T> pickRandomItemsAsList<T>(List<T> items, int count) =>
    (items.toList()..shuffle()).take(count).toList();

List<T> pickRandomItemsAsListWithSubList<T>(List<T> items, int count) =>
    (items.toList()..shuffle()).sublist(0, count);
