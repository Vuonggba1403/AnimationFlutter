import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MainPage(),
    debugShowCheckedModeBanner: false,
  ));
}

// Enum để quản lý trạng thái của nút bấm
enum ButtonState { init, loading, done }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ButtonState state =
      ButtonState.init; // Trạng thái hiện tại của nút bấm, mặc định là init

  @override
  Widget build(BuildContext context) {
    // Kiểm tra xem nút bấm có đang ở trạng thái "init" không
    bool isStretched = state == ButtonState.init;
    // Kiểm tra xem nút bấm có đang ở trạng thái "done" không
    bool isDone = state == ButtonState.done;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Progress Button Animation"), // Tiêu đề của thanh công cụ
        centerTitle: true, // Canh giữa tiêu đề
        backgroundColor: Colors.lightGreenAccent, // Màu nền của thanh công cụ
      ),
      body: Center(
        child: SizedBox(
          width: isStretched ? MediaQuery.of(context).size.width * 0.9 : 80,
          height: 80,
          // Hiển thị nút tùy thuộc vào trạng thái
          child: isStretched ? buildOutlineButton() : buildSmallButton(isDone),
        ),
      ),
    );
  }

  // Hàm tạo nút bấm dạng đường viền (trạng thái "init")
  Widget buildOutlineButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.red[300], // Màu nền của nút bấm
        foregroundColor: Colors.blueAccent[300], // Màu chữ
      ),
      onPressed: () async {
        setState(() =>
            state = ButtonState.loading); // Đổi trạng thái thành "loading"
        await Future.delayed(const Duration(seconds: 3)); // Đợi 3 giây
        setState(() => state = ButtonState.done); // Đổi trạng thái thành "done"
        await Future.delayed(const Duration(seconds: 3)); // Đợi 3 giây nữa
        setState(() => state = ButtonState.init); // Trả về trạng thái "init"
      },
      child: const Text(
        // Nội dung của nút bấm
        "Submit",
        style: TextStyle(fontSize: 30), // Kích thước chữ
      ),
    );
  }

  // Hàm tạo nút bấm nhỏ hơn, dạng hình tròn (cho trạng thái "loading" và "done")
  Widget buildSmallButton(bool isDone) {
    final color = isDone
        ? Colors.green
        : Colors.indigo; // Màu sắc phụ thuộc vào trạng thái

    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: color), // Định dạng nút bấm
      child: Center(
        // Canh giữa nội dung
        child: isDone // Nội dung phụ thuộc vào trạng thái
            ? const Icon(
                // Nếu đã hoàn thành, hiển thị biểu tượng "done"
                Icons.done,
                size: 52,
                color: Colors.white, // Màu của biểu tượng
              )
            : const CircularProgressIndicator(
                // Nếu chưa hoàn thành, hiển thị vòng xoay
                color: Colors.white, // Màu của vòng xoay
              ),
      ),
    );
  }
}
