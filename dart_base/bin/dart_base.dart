import 'package:dart_base/dart_base.dart' as dart_base;
import 'package:test/expect.dart';

int total = 100; // biến toàn cục 
void main(List<String> arguments) {
  // Biến 
  int number = 10 ; 
  String userName = "Báo Flutter"; 
  bool isLogined = false; 
  double mathMark = 7.5;
  // Kiểu dữ liệu : int , String, bool, double, DateTime, List, Map ....
  number = 20; 
  const double PI = 3.143; // biến hằng : giá trị luôn không thay đổi 
  final int BIRTH_YEAR = number ; // biến hằng final; không thể cập nhật lại 
  // Kiểu dữ liệu dynamic : var , dynamic
  var testNumber1 = "Hello"; 
  var testNumber2 = 5;
  // lỗi : testNumber7 = 7;
  const PI2 = 3.143;

  dynamic testNumber3 = "Hello"; 
  dynamic testNumber4 = 5;
  // Sự khác nhau của var & dynamic
  // 1. var : 1 biến var được gán giá trị thì biến đó có kiểu dữ liệu theo giá trị ban đầu, sau này
  var testNumber5 = 7; // testNumber5 nhận kiểu dữ liệu int
  // testNumber5 = 7.5; -- Lỗi 
  dynamic testNumber6 = "hello" ;
  testNumber6 = 9; 
  if(checkChanLe(testNumber6)){
    print("Số $testNumber6 là số chẵn");
  } else print("Số $testNumber6 là số lẻ");

  // 2. dùng trong hàm: var không thể là kiểu dữ liệu đầu ra của hàm, dynamic ngược lại
  // Toán tử gán
  testNumber6 += 2; // testNumber6 = testNumber6 + 2 ;
  print("Số đã cập nhật là: " + testNumber6.toString());
  if(testNumber6 > 10 ) print("Số này đạt điều kiện");
  else if(testNumber6 < 0) print ("Số này âm");
  // && , ||
  // && : * ; true : 1; false : 0 ; true && false = false; 
  // || : + ; true : 1; false : 0 ; true || false = true;
  if(( testNumber6 > 12)&&(testNumber6 < 30 )) print("OK");
  //       false && true = false

 
  // label : là khái niệm dùng trong biến truyền vào
  //ketLuanChanLe(checkingNumber: testNumber5);
  ketLuanChanLe(checkingNumber: testNumber4);

  // Chưa Null Safety 
  //int testVariable1 ; // trươc đó : Null
  //print(testVariable1.toString()); // trươc đó : Null
  // Null Safty
  int? testVariable2 ; // testVariable2 được gán là  Null
  print(testVariable2.toString()); // trươc đó : Null
  testVariable2 = 6; 
  int testSum = testVariable2 + 6;

  // List : là một tập hợp các phần tử có cùng kiểu dữ liệu
  List<int> intList = [4, 5, 6, 7, 26, 9,  20, 81, 92];
          // chỉ số:   0 , 1, 2, 3, 4, 5,  6, 7,    8
          // length: 9 
  List list = [3, 4.5, 6, 9, "hello", true]; // cùng kiểu dynamic
  inSoChiaHetCho3(numberList: intList);

  // while 
  inSoChiaHet6(maxNumber: 100);

  // Collection Type 
  //List <int> list = new List<int>(5);  // Lỗi, Không sử dụng nữa 
  List testList1 = [];
  List<double>? testList2;

  // Map : Là một tập hợp các cặp : key - value 
  Map<String, int> testMap1 = {
    "age": 40,
    "birth_year": 1991,
  };

  Map<dynamic,dynamic>  testMap2 = {
    "name": "Bao Flutter",
    1: 1991,
    1.5 : false, 
    "hh": 9.5,
    true : 8,
  };
  print(testMap2['name'].toString());




  }

// Hàm 
int tinhTong(int soHang1, int soHang2)
{
  int sum = 0; // biến cục bộ 
  return soHang1 + soHang2; 
}
/*  Lỗi 
var tinhHieu(int soBiTru, int soTru){
  return soBiTru - soTru;
}
*/

tinhHieu(soBiTru, soTru){
  return soBiTru - soTru;
}

bool checkChanLe(int checkingNumber){
  if(checkingNumber%2 == 0) return true;
  return false;
}

void ketLuanChanLe({ required int checkingNumber }){
  int soDu = checkingNumber %2;
  switch(soDu){
    case 0:
    print('$checkingNumber là số chẵn');
    break; 
    case 1:
    print('$checkingNumber là số lẻ');
    break;
    default:
    print("Không hợp lệ");
    break;
  }

}
// for 
void inSoChiaHetCho3({ required List<int> numberList}){
  print("Số chia hết cho 3");
  /*
  // for -- in 
  
  for (int number in numberList)
  {
    if(number%3==0) print("$number");
  }
  */
  //index 
  for (int i = 0 ; i< numberList.length ; i++) // i++ ; i = i+ 1; 
  {
    if(numberList[i]%3 == 0) print(numberList[i].toString());
  }
}

// while , do ... while 
inSoChiaHet6({ required int maxNumber}){
 int count = 1; 
 print("Số chia hết cho 6");
/*
 // while 
 while(count <= maxNumber){
   if(count%6 == 0) print ("$count");
   count++;
 }
 */

 do {
   if(count%6 == 0) print ("$count");
   count++;
 }
 while(count<=maxNumber);

 print("Vòng While kết thúc");
}

