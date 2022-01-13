import 'xe.dart';
class XeVeSinh extends Xe{
  XeVeSinh(brandXe, xeYear) : super(brand: brandXe, productionYear: xeYear);

@override
  void chuyenCho() {
    // TODO: implement chuyenCho
    print("Chuyên để chở rác");
  }
}