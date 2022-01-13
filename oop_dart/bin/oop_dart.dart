



import 'hinh_chu_nhat.dart';
import 'hinh_vuong.dart';
import 'user.dart';
import 'xe_tai.dart';

void main(List<String> arguments) {
  // Tạo một đối tượng hay tạo 1 instance
  User bao = User(userName: "Bao Flutter", phoneNumber: "0349582808", birthYear: 1991);
  print("Họ tên của người dùng: ${bao.userName}"  );
  int money = bao.getMoney();
  bao.setMoney(2000000000);
  print("Tài sản của người dùng: ${bao.getMoney()}"  );

  User lan = User(userName: "Nguyễn Thị Lan", birthYear: 1995, phoneNumber: '05235252523') ;
  User hoa = User(userName: "Pham Thu Hoa", birthYear: 1998, phoneNumber: '052356346523') ;
  User diep = User(userName: "Luu Manh Diep", birthYear: 1990, phoneNumber: '0523524455523') ;

  List<User> userList = [];
  userList.add(lan);
  userList.add(hoa);
  userList.add(diep);
  // List<User> = [lan, hoa, diep] ;
  
  User maxAgePerson = getMaxAgeUser(userList: userList);
  print("Họ tên người lớn tuổi nhất: ${maxAgePerson.userName}, có độ tuổi là: ${maxAgePerson.getAge()}");

  //================= Thuộc tính hướng đối tượng =================
  XeTai xeTai = XeTai(brandXeTai: "Huyndai", productionXeTaiYear: 1999);
  print("Thương hiệu của xe tải: ${xeTai.brand}, có độ tuổi là: ${xeTai.getXeAge()}");
  int year = xeTai.getBirthYear();
  print("Năm sản xuất xe tải: $year ");
  print("Tuổi của xe tải: ${xeTai.getAgeOfXeTai()}");
  xeTai.chuyenCho();

  // ============= Bài Tập ===========
  HinhVuong hinhVuong = HinhVuong(canh: 4.5);
  double dienTichHinhVuong = hinhVuong.tinhDienTich();
  print("Diện tích hình vuông: $dienTichHinhVuong");
  

}

// xác định người nào lớn tuổi nhất 

User getMaxAgeUser({ required List<User> userList}){
  User? maxAgeUser;
  int maxAge = 0 ; 

  for(User user in userList)
  {
    int age = user.getAge();
    if( maxAge < age){
      maxAge = age;
      maxAgeUser = user;
    }
  }

  return maxAgeUser!;
}
