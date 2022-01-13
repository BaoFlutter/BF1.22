import 'xe.dart';
class XeBus extends Xe{
  XeBus(brandXe, xeYear) : super(brand: brandXe, productionYear: xeYear);

  @override
  void chuyenCho() {
    // TODO: implement chuyenCho
    print("Chỉ để chở khách");
  }

}