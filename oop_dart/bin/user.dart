class User {
  // Mô tả thuộc tính  : là các biến
  String? userName;  //biến public
  int? birthYear; //biến public
  String? phoneNumber; //biến public
  String? address;   // biến public
  int? _money_value; // biến private 
  // public, private: private: những biến và hàm nào có dấu _ đằng trước, là private : chỉ dùng được trong class này thôi 

  // Hàm khởi tạo : Chỉ tồn tại duy nhất một hàm khởi tạo
  // Hàm khởi tạo mặc định :  User();
  User({ required this.userName,  required this.birthYear, required this.phoneNumber});

  // Hàm getter & setter 
  // getter 
  int getMoney()
  {
    return this._money_value??0;
  }

  get money => this._money_value!;

  // setter 
  void setMoney(int? money_value)
  {
    this._money_value = money_value;
  }

  // Mô tả các hành vi : Là các hàm ( có thể xử lý các thuộc tính)
  int getAge(){
    return DateTime.now().year - this.birthYear!;
  }

  int _showMoney(){ // hàm private
    return this._money_value!;
  }

}

// Tính kế thừa
// 1. Tôi phải viết lại rất nhiều thứ tương tự như nhau  => Giải quyết => Viết 1 lớp cha có chứa những thứ tương tự đó => các lớp con sau này không phải viết lại mà dùng sẵn thông qua kế thứ
// 2. Vất vả viết một bộ thư viện sịn xò ( gọi là SDK , Framework ) => Dùng kế thừa để sử dụng bộ thư viện này thông qua kế thừa