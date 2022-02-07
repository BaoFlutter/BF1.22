import 'package:flutter/material.dart';
import 'package:state_base/databases/result_database.dart';
import 'package:state_base/models/result.dart';
import 'package:state_base/resources/strings.dart';
import 'package:state_base/resources/widgets/information_card.dart';
import 'package:state_base/resources/widgets/text_input_widget.dart';
import 'package:state_base/views/information_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
 // 1. Tạo State lần đầu và Build context đc tạo ra và gắn với State đó
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? mathMarkController, litetureMarkController, englishMarkController;
  String averageMark = "Chưa xác định";
  String adjustmentResult = "Chưa xác định" ;

  final db = ResultDatabase();


  //3. Khởi tạo State
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Thêm lệnh gì đó trước khi build
    mathMarkController = TextEditingController();
    litetureMarkController = TextEditingController();
    englishMarkController = TextEditingController();
  }
  //4. Chạy khi lần đầu load Widget và chạy khi có dependencies thay đổi
  // Có thể sử dụng context
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // 5. Hàm build ( context, state đã có )
  // Build giao diện
  @override
  Widget build(BuildContext context) {
    // 2. Biến mounted có giá trị là true vì State đã được tạo
    if(mounted) print("State đã có rồi");
    return Scaffold(
      appBar: AppBar(
        title: Text(STUDENT_ADJUSTMENT),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              // nhập điểm toán
              TextInputWidget(
                  lableText: "Điểm Toán",
                  hintText: "Nhập điểm Toán",
                  controller: mathMarkController),
              // nhập điểm Văn
              TextInputWidget(
                  lableText: "Điểm Văn",
                  hintText: "Nhập điểm Văn",
                  controller: litetureMarkController),
              // Nhập điểm Anh
              TextInputWidget(
                  lableText: "Điểm Anh",
                  hintText: "Nhập điểm Anh",
                  controller: englishMarkController),
              const SizedBox(
                height: 30,
              ),
              // Nut Đánh giá
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      averageMark = ((double.parse(mathMarkController!.text)+double.parse(litetureMarkController!.text)+ double.parse(englishMarkController!.text)  )/3).toStringAsFixed(2).toString();
                      adjustmentResult = adjustStudent(mark: double.parse(averageMark));
                    });
                    saveResultToDatabase(
                        result: Result(id: null, average_mark: double.parse(averageMark), adjustment: adjustmentResult ));

                  },
                  child: Text(ADJUSTMENT)),

              // Information Result
              InformationCard(
                  averageMark: averageMark,
                  adjustmentResult: adjustmentResult),
              TextButton(
                  onPressed: (){
                    var route = MaterialPageRoute(builder: (context) => InformationScreen());
                    Navigator.push(context, route);
                  },
                  child: Text(CHANGE_PAGE))
            ],
          ),
        ),
      )
    );
  }

  saveResultToDatabase({required Result result }) async {
    await db.addResult(result);
  }


  // 6. DidUpdate Widget : Chỉ được gọi khi Widget congfiguration thay dổi
@override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  //  7. Hàm SetState
// Được chạy khi hàm build đã xong
// Khi hàm này được chạy : chạy lại hàm build với các giá trị đã được cập nhật bên trong

  // 8. deactivate State : Dừng hoạt động của State , khi người dùng chuyển màn hình , tắt áp , tắt màn hình
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  // 9. dispose
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mathMarkController!.dispose();
    englishMarkController!.dispose();
    litetureMarkController!.dispose();
    print("Đóng trang");
  }
  // 10. mounted = false;




  String adjustStudent({required double mark})
{
  if(mark< 5) return "Không đạt";
  if(mark<8.5) return "Đạt";
  if(mark<= 10) return "Xuất sắc";
  return "Không xác định" ;
}
}

