class Xe {

  String? brand; 
  int? productionYear;

  Xe({ required this.brand, required this.productionYear});
  
  int getXeAge(){
    return DateTime.now().year - this.productionYear!;
  }

  void chuyenCho(){
    print("Xe để chở");
  }

}