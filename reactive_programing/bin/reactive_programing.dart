import 'package:reactive_programing/reactive_programing.dart' as reactive_programing;
import 'package:rxdart/rxdart.dart';

void main(List<String> arguments) {
//demoBehaviourSubject();
//demoPubSlishSubject();
demoReplaySubject();
}
// BehaviorSubject chỉ lấy dữ liệu thêm vào sau đó và lấy một giá trị gần nhất thêm vào trước đó

demoBehaviourSubject(){
  // Tạo ra một Stream 
 BehaviorSubject<int> behaviourSubject = BehaviorSubject<int>();
 behaviourSubject.listen((value) {
   print("Lấy dữ liệu lần 1: $value");
  });
  behaviourSubject.add(101);
  behaviourSubject.add(102);
   behaviourSubject.listen((value) {
   print("Lấy dữ liệu lần 2: $value");
  });
  behaviourSubject.add(201);
  behaviourSubject.add(202);
}

 // PublishSubject chỉ lấy dữ liệu thêm vào sau đó 
demoPubSlishSubject(){
  // Tạo ra một Stream 
 PublishSubject<int> publishSubject = PublishSubject<int>();
 publishSubject.listen((value) {
   print("Lấy dữ liệu lần 1: $value");
  });
  publishSubject.add(101);
  publishSubject.add(102);
   publishSubject.listen((value) {
   print("Lấy dữ liệu lần 2: $value");
  });
  publishSubject.add(201);
  publishSubject.add(202);
}

 // ReplaySubject lấy toàn bộ dữ liệu có trong Stream 
demoReplaySubject(){
  // Tạo ra một Stream 
 ReplaySubject<int> replaysubject = ReplaySubject<int>();
 replaysubject.listen((value) {
   print("Lấy dữ liệu lần 1: $value");
  });
  replaysubject.add(101);
  replaysubject.add(102);
   replaysubject.listen((value) {
   print("Lấy dữ liệu lần 2: $value");
  });
  replaysubject.add(201);
  replaysubject.add(202);
}

