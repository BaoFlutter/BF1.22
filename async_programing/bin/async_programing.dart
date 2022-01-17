

void main(List<String> arguments) async  {
/*
 Future<int> futureNumber = makeLateNumber();
 int number = await futureNumber;

// print("Số trả về là: ${makeLateNumber()}");
print("Số trả về là: $number");
*/
Future<int> futureNumber = makeLateNumber();
// --- Dùng then sau dữ liệu loại Future, không cần từ khoá async  -----
futureNumber.then((number){
  print("Số trả về là: $number");
});

makeLateNumber().then((number){
  print("Số trả về là: $number");
});

// ------- Stream ----------------
// ----  Tạo Stream - cách 1 
Stream<int> numberStream = Stream<int>.periodic(Duration(seconds: 2), makeNumberUp);
//----- Lấy dữ liệu từ Stream -------
//-----1. Dùng listen -----------
/*
numberStream.listen(
  (number){
    print("Số lấy từ Stream: $number");
  }
  );
  */

  //------- 2. Dùng For in - asyn - await 
 /*
  readStreamNumber(numberStream: numberStream);
  */

  Stream<int> numberStreamByYield = makeNumberStreamByAsyncYield(maxNumber: 10);
  readStreamNumber(numberStream: numberStreamByYield);


print("Chương trình kết thúc");

}

// ---- Cách tạo Stream - cách 2 
Stream<int> makeNumberStreamByAsyncYield({required int maxNumber}) async*
{
  for(int i = 1; i<=maxNumber ; i++ )
  {
    yield i;
  }

}

Future<int> makeLateNumber(){
 return Future.delayed(Duration(seconds: 2), (){
  return 6;
 });

}

void readStreamNumber({required Stream<int> numberStream}) async
{
  await for (int number in numberStream) 
  {
    print("Số lấy từ Stream: $number");
  }

}

int makeNumberUp(int value) => value + 1; 
