
import 'dart:io';

void main(List<String> arguments) {
var input = "Flutter";
/* Try --- catch =
try {
  int number = int.parse(input);
}
catch(e)
{
  print(e.toString());
}

*/

/*

//Try -on- catch =
try {
  int number = int.parse(input);
}
on FormatException{
  print("Đây là lỗi nhập sai , bạn vui lòng nhập số không nhập chữ và kí tự khác");
}
catch(e)
{
  print(e.toString());
}
*/

try {
  int number = int.parse(input);
}
catch(e)
{
  print(e.toString());
}
finally{
 print("Khối lệnh luôn luôn được thực thi");

};

print("Chương trình kết thúc");

// Xảy ra 1 Exception : Ngoại lệ 
//Ảnh hưởng" 
// 1. Nó làm chương trình ngừng lại
// 2. Xử lý vấn đề này
// Khi đặt code nghi có ngoại lệ vào try .. catch 
// 2.1 Chương trình không bị ngừng đột ngột và vẫn có thể chaỵ đến lệnh tiếp theo 
// 2.2 Phát hiện được chính xác : Ngoại lệ đó là gì mà mình biết cách sử lý

// --------- Throw Exception -----------
danhGiaTuoi(age: 35);
try{
  danhGiaTuoi(age: -32);
}
catch(e)
{
print(e.toString());
}
print("Chương trình kết thúc");
}

void danhGiaTuoi({required int age}){

  if(age<= 0) throw Exception("Tuổi không được nhỏ hơn hoặc bằng 0, vui lòng nhập lại");
  if(age<40) print("Bạn vẫn còn trẻ");
  else if(age<= 60) print("Bạn đang trung niên");
  else if(age>60 ) print("Bạn đã già");

}
