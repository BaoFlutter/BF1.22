import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? userNameController, birthYearController;
  String userName = "Chưa xác định";
  String age = "Chưa xác định";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    birthYearController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController!.dispose();
    birthYearController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text("Thông tin người dùng"),
           centerTitle: true,
         ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            // Nhập tên
            textInputWidget(
                lableText: "Họ Và Tên",
                hintText: "Nhập họ và tên của bạn",
                controller: userNameController),
            // Nhập năm sinh
            textInputWidget(
                lableText: "Năm sinh",
                hintText: "Nhập năm sinh của bạn",
                controller: birthYearController),
            // nút
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Xác nhận"),
              onPressed: (){
                setState(() {
                  userName = userNameController!.text;
                  age = (DateTime.now().year - int.parse(birthYearController!.text)).toString();
                });
              },
            ),
            // hiển thị kết quả
            informationCard(
                userName: userName,
                age: age)
          ],
        )
      ),
    );
  }

  Widget textInputWidget({ required String lableText, required String hintText, required controller }){
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: lableText,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }

  Widget informationCard({required String userName, required String age}){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            children: [
              Text("Thông tin", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Text(userName),
              const SizedBox(height: 10,),
              Text(age)
            ],
          ),
        ),

      ),
    );
  }

}
