import 'xe.dart';
class XeTai extends Xe{
  XeTai({brandXeTai, productionXeTaiYear}) : super(brand: brandXeTai, productionYear: productionXeTaiYear);
  
// 1. Khi kế thừa thì tất cả các thuộc tính , hàm public của class cha thì class con đều dùng được
// 2. Khi class cha có hàm khởi tạo thì lớp con khi khởi tạo cũng phải khởi tạo cho lớp cha
// 2.1 : Từ khoá super đại diện cho class cha
 
 int getBirthYear(){
   return super.productionYear!;
 }

 int getAgeOfXeTai(){
   return super.getXeAge();
 }

 @override
  void chuyenCho() {
    // TODO: implement chuyenCho
    print("Xe tải này chỉ để chở vật liệu xây dựng");
  }
 


}