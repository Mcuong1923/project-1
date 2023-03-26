// 1:39 24/3


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widget/dscongviec.dart';
import 'widget/addcv.dart';
import 'model/congviec.dart';
import 'package:intl/intl.dart';
import 'widget/user_profile_dialog.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      //tắt chữ debug
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final dateFormat = DateFormat('dd/MM/yyyy'); //ép kiểu cho ngày tháng

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _searchController =
      TextEditingController(); //khai báo đối search
  
  
 
  
  
  List<Congviec> _look = [];
  final List<Congviec> look = [
    Congviec(
      id: 0,
      tencv: 'quantrong',
      motacv: '90%',
      deadline: dateFormat.parse('24/06/2023'), 
    ),
   
  ];
  
  
  
  
  List<Congviec> _filteredCongViec = [];
  final List<Congviec> danhSachCongviec = [
    Congviec(
      id: 1,
      tencv: 'Dự án Website ứng dụng trực tuyến',
      motacv: '90%',
      deadline: dateFormat.parse('24/06/2023'), // ép kiểu
    ),
    Congviec(
      id: 2,
      tencv: 'Dự án phàn mềm quản lí khách sạn',
      motacv: '0%',
      deadline: dateFormat.parse('24/02/2023'),
    ),
    Congviec(
      id:3,
      tencv: 'Dự án Blockchain',
      motacv: '0%',
      deadline: dateFormat.parse('25/4/2023'),
    ),
  ];
  void _onAvatarTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return UserProfileDialog();     //  thoong tin avt
      },
    );
  }


  @override
  void initState() {
    //sao chép hết nội dung của danh sách cv
    _filteredCongViec.addAll(danhSachCongviec);
    super.initState(); //gọi
  }

  @override
  void dispose() {
    // được sử dụng để giải phóng tài nguyên của _searchController
    _searchController.dispose();
    super.dispose();
  }
  
  void _filterCongViec(String query) {
    List<Congviec> filteredCongViec = []; //copy
    filteredCongViec.addAll(danhSachCongviec);

    if (query.isNotEmpty) {
      //nếu query không rỗng
      filteredCongViec.retainWhere((congViec) => //duyệt từng phần tử
          congViec.tencv.toLowerCase().contains(query
              .toLowerCase())); //chuyển về chữ thường duyệt phần tử xem có giống query
    }

    setState(() {
      _filteredCongViec.clear(); //xóa hết các phần tử cũ
      _filteredCongViec.addAll(filteredCongViec); //copy tất cả
    });
  }

  
  
  
  
  
  void addNewCongviec(
      String tencv, String motacv, String deadline) //thêm phần tử
  {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final newCongviec = Congviec(
      id: danhSachCongviec.length + 1,
      tencv: tencv,
      motacv: motacv,
      deadline: dateFormat.parse(deadline),
    );
    setState(() {
     
if (tencv.toLowerCase().contains('look')) { // contains" được sử dụng để kiểm tra chuỗi "tencv"
                                            // toLowerCase" được sử dụng để chuyển đổi chuỗi "tencv" thành chữ thường, 
                                            //để đảm bảo rằng tất cả các chữ cái "look" đều được xử lý giống nhau
  look.add(newCongviec);
} else {
  danhSachCongviec.add(newCongviec);
}

    });
  }

  void deleteCongViec(int index) {
    setState(() {
      danhSachCongviec.removeAt(index); //xóa id
      _filteredCongViec.removeAt(index);
      for (int i = index; i < danhSachCongviec.length; i++) {
        //giảm id mỗi cái sau vị trí đi 1
        danhSachCongviec[i].id--;
      }
    });
  }

  void startAddNewCongviec(BuildContext context) {
    showModalBottomSheet(
      //cửa sổ hiển thị từ dưới lên hiển thị chỗ nhập dữ liệu
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Newcv(addNewCongviec),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // màu nền trắng

      //thanh tiêu đề
      appBar: AppBar(
        backgroundColor: Colors.red, // màu của thanh tren cùng
        elevation: 0,
        title: Row(
          mainAxisAlignment:
              //căn chỉnh các đối tượng
              MainAxisAlignment.spaceBetween,
          children: [
            //căn chỉnh text
            Expanded(
              child: Text(
                'MY TASKS',
                textAlign: TextAlign.center,
              ),
            ),
            //cotainer chứa ảnh
            GestureDetector(
        onTap: () => _onAvatarTap(context),
        child: Container(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assets/images/mc.jpg'),
          ),
        ),
      ),
    ],
  ),
),
      //nút drawer
      drawer: Drawer(
        //thanh chức năng
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 85,
                child: DrawerHeader(
                  child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(5, 0, 50, 0),
                      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        color: Colors.red,
      ),
                    
                    
                    child: Text(
                      '     MENU',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),


              
              ElevatedButton(  // dòng thứ 1 từ tab
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(400, 50)),
                ),
                child: Text("Chưa đến hạn"),
                onPressed: () {
                  setState(() {
                    // Kết quả của phương thức where là một Iterable chứa các phần tử của danh sách danhSachCongviec thỏa mãn điều kiện trên.Cuối cùng, phương thức toList() được gọi để chuyển đổi Iterable sang List
                    _filteredCongViec = danhSachCongviec
                        .where((congViec) =>
                            congViec.deadline.isAfter(DateTime.now()))
                        .toList();
                  });
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 5),
              ElevatedButton(  // dòng thứ 2 từ tab
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(400, 50)),
                ),
                child: Text("Đã quá hạn"),
                onPressed: () {
                  setState(() {
                    _filteredCongViec = danhSachCongviec
                        .where((congViec) =>
                            congViec.deadline.isBefore(DateTime.now()))
                        .toList();
                  });
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 5),
              ElevatedButton(     // dòng thứ 3 từ tab
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(400, 50)),
                ),
                child: Text("Tất cả"),
                onPressed: () {
                  setState(() {
                    _filteredCongViec = danhSachCongviec
                        
                          
                        .toList();
                         
                  });
                  Navigator.of(context).pop();
                },
              ),

            SizedBox(height: 5),
                            
                            
                            
                            
                            ElevatedButton( // quan trọng
                            style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(400, 50)),
                ),
  
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String password = '';

        return AlertDialog(
          title: Text('Mật khẩu'),
          content: TextField(
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            decoration: InputDecoration(
              hintText: 'Mật khẩu của bạn',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
               
                if (password == '12345') {
                 
                   setState(() {
                    _filteredCongViec = look.toList();
                                                
                  });
                } else {
                  // Do something if the password is incorrect
                  return;
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  },
  child: Text('Quan trọng'),
),




            ],
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Tìm kiếm công việc",
                hintText: "Nhập từ khóa...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              onChanged: (value) {
                //. Khi người dùng nhập hoặc thay đổi dữ liệu trong Textfield, hàm _filterCongViec(value) sẽ được gọi với giá trị mới của Textfield là tham số đầu vào.
                _filterCongViec(value);
              },
            ),
          ),
          Expanded(
            //tự điều chỉnh kích cỡ
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CongViecList(_filteredCongViec, deleteCongViec),
                ],
              ),
            ),
          ),
        ],
      ),
      //nút thêm
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // căn nút sang phải
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_task_rounded  ),
         backgroundColor: Color(0xFFC20000),
         
        onPressed: () => startAddNewCongviec(context),
      ),
    );
  }
}
