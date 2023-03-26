/* import 'package:flutter/material.dart';

class UserProfileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Thông tin cá nhân'),
      
      content: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Tên: Nguyễn Mạnh Cường'),
          Text('Tuổi: 20'),
          Text('Email: nvancuong792@gmail.com'),
          
          
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Đóng'),
        ),
      ],
    );
  }
}
void _onAvatarTap(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return UserProfileDialog();
    },
  );
}
 */

import 'package:flutter/material.dart';

class UserProfileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          
          children: [
            
            
           Row(
    children: [
      Icon(Icons.account_circle, size: 30, color: Colors.red),
      SizedBox(width: 10),
      Text(
        'THÔNG TIN CÁ NHÂN',
        style: TextStyle(fontSize: 20, color: Colors.red),
      ),
    ],
  ),
            SizedBox(height: 10),
            Text(
              ' Tên: Nguyễn Mạnh Cường',
              style: TextStyle(fontSize: 20),
            ),
             SizedBox(height: 2),
              Text(
              ' Tuổi: 30',
              style: TextStyle(fontSize: 20),
            ),
             SizedBox(height: 2),
            Text(
              ' Địa chỉ: Hà Nội, Việt Nam',
              style: TextStyle(fontSize: 20),
            ),
            

             Text(
              '____________________________',
              style: TextStyle(fontSize: 20),
            ),
             SizedBox(height: 10),
             SizedBox(height: 0),
             
             
             
              Row(
    children: [
      Icon(Icons.public, size: 30, color: Colors.red),
      SizedBox(width: 10),
      Text(
        'THÔNG TIN LIÊN HỆ',
        style: TextStyle(fontSize: 20, color: Colors.red),
      ),
    ],
  ),
               
               
                SizedBox(height: 10),
               
               Row(
    children: [
      Icon(Icons.facebook, size: 25, color: Colors.blue),
      SizedBox(width: 10),
      Text(
        'Facebook',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ],
  ),
            Row(
    children: [
      Icon(Icons.add_call, size: 25, color: Colors.blue),
      SizedBox(width: 10),
      Text(
        'Phone',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ],
  ),
            Row(
    children: [
      Icon(Icons.email, size: 25, color: Colors.blue),
      SizedBox(width: 10),
      Text(
        'Gmail',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ],
  ),
 
           
           
               Text(
              '____________________________',
              style: TextStyle(fontSize: 20),
            ),
                SizedBox(height: 10),
           Row(
    children: [
      Icon(Icons.settings, size: 25, color: Colors.red),
      SizedBox(width: 10),
      Text(
        'CÀI ĐẶT TÀI KHOẢN',
        style: TextStyle(fontSize: 20, color: Colors.red),
      ),
    ],
  ),

 SizedBox(height: 10),
  Row(
    children: [
      Icon(Icons.person, size: 25, color: Colors.blue),
      SizedBox(width: 10),
      Text(
        'Cập nhật thông tin',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ],
  ),
  Row(
    children: [
      Icon(Icons.key, size: 25, color: Colors.blue),
      SizedBox(width: 10),
      Text(
        'Đổi mật khẩu',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ],
  ),
  Row(
    children: [
      Icon(Icons.delete, size: 25, color: Colors.blue),
      SizedBox(width: 10),
      Text(
        'Xóa tài khoản',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ],
  ),
 
 
           
             SizedBox(height: 10),
            Spacer(),
     Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8), // Bo tròn viền
    color: Colors.red, // Màu nền của khung
  ),
  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5), // Khoảng cách giữa nội dung và khung
  child: TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: Text(
      'Thoát',
      style: TextStyle(
        fontSize: 16, // Kích thước chữ
        color: Colors.white, // Màu chữ
      ),
    ),
  ),
),


          ],
        ),
      ),
    );
  }
}