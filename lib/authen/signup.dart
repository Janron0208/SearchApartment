import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scanapartment/utility/my_style.dart';
import '../utility/my_constant.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? user, password;
  String? type, name, lastname, identification, phone, avatar, token;
  String? sex;
  File? file;
  String status = '0';

  final List<String> items = [
    'ชาย',
    'หญิง',
    'ไม่ระบุ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              buildAppBar(context),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 35, right: 35, top: 10),
                      child: Column(
                        children: [
                          buildAvatar(),
                          buildName(context),
                          heightBox10(),
                          buildSex(),
                          heightBox10(),
                          buildIdentification(),
                          heightBox10(),
                          buildPhone(),
                          heightBox10(),
                          buildUser(),
                          heightBox10(),
                          buildPassword(),
                          heightBox10(),
                          buildType(),
                          heightBox10(),
                          heightBox10(),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                // print(
                                //     '$name, $lastname, $type, $sex, $identification, $phone, $user, $password');

                                checkemptytext();
                              },
                              child: Text(
                                'สมัครสมาชิก',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 168, 168, 168),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  status == '0' ? Text('') : Container(color: Color.fromARGB(111, 255, 255, 255),
                      height: MediaQuery.of(context).size.height,
                      child: MyStyle().showProgress())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea buildAppBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_rounded)),
            Text(
              'สมัครสมาชิก',
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 95, 95, 95)),
            ),
          ],
        ),
      ),
    );
  }

  Container heightBox10() {
    return Container(
      height: 10,
    );
  }

  Container buildType() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFDBE2E7), width: 2)),
      child: Column(
        children: [
          Text(
            'ประเภทผู้ใช้',
            style: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
          ),
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: 'เจ้าของ',
                    groupValue: type,
                    onChanged: (val) {
                      setState(() {
                        type = 'เจ้าของ';
                      });
                    },
                  ),
                  Text(
                    'เจ้าของหอพัก',
                    style: new TextStyle(
                        fontSize: 13, color: Color.fromARGB(255, 90, 90, 90)),
                  ),
                ],
              ),
              Container(
                width: 20,
              ),
              Row(
                children: [
                  Radio(
                    value: 'ผู้ใช้',
                    groupValue: type,
                    onChanged: (val) {
                      setState(() {
                        type = 'ผู้ใช้';
                      });
                    },
                  ),
                  Text(
                    'ผู้ใช้ทั่วไป',
                    style: new TextStyle(
                        fontSize: 13, color: Color.fromARGB(255, 90, 90, 90)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildPassword() {
    return Container(
      height: 50,
      child: TextFormField(
          onChanged: (value) {
            password = value.trim();
            setState(() {
              password = value;
            });
          },
          style: TextStyle(fontSize: 13),
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'รหัสผ่าน(10ตัวอักษรขึ้นไป)',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFDBE2E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFDBE2E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
          )),
    );
  }

  Container buildUser() {
    return Container(
      height: 50,
      child: TextFormField(
          onChanged: (value) {
            user = value.trim();
            setState(() {
              user = value;
            });
          },
          style: TextStyle(fontSize: 13),
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'ชื่อบัญชีผู้ใช้(6ตัวอักษรขึ้นไป)',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFDBE2E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFDBE2E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
          )),
    );
  }

  Container buildPhone() {
    return Container(
      height: 50,
      child: TextFormField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          onChanged: (value) {
            phone = value.trim();
            setState(() {
              phone = value;
            });
          },
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 13),
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'เบอร์โทรศัพท์',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFDBE2E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFDBE2E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
          )),
    );
  }

  Container buildIdentification() {
    return Container(
      height: 50,
      child: TextFormField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          onChanged: (value) {
            identification = value.trim();
            setState(() {
              identification = value;
            });
          },
          keyboardType: TextInputType.phone,
          style: TextStyle(fontSize: 13),
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'เลขบัตรประชาชน',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFDBE2E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFDBE2E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
          )),
    );
  }

  DropdownButtonHideUnderline buildSex() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Text(
          'เพศ',
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: sex,
        onChanged: (value) {
          setState(() {
            sex = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        iconSize: 16,
        buttonHeight: 50,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFFDBE2E7),
            width: 2,
          ),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        buttonElevation: 0,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 300,
        dropdownWidth: 200,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-20, 0),
      ),
    );
  }

  Row buildName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.4,
          child: TextFormField(
              onChanged: (value) {
                name = value.trim();
                setState(() {
                  name = value;
                });
              },
              style: TextStyle(fontSize: 13),
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'ชื่อ',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              )),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.4,
          child: TextFormField(
              onChanged: (value) {
                lastname = value.trim();
                setState(() {
                  lastname = value;
                });
              },
              style: TextStyle(fontSize: 13),
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'นามสกุล',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              )),
        ),
      ],
    );
  }

  Row buildAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          width: 100,
          child: file == null
              ? Container(
                  width: 100.0,
                  height: 100.0,
                  child: Image.network(
                      'https://www.autoskola-praha.cz/images/user.png'),
                )
              : Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: FileImage(file!)))),
        ),
        Column(
          children: [
            Container(
              height: 40,
              width: 150,
              child: ElevatedButton(
                onPressed: () => chooseImage(ImageSource.camera),
                child: Text(
                  'กล้องถ่ายรูป',
                  style: const TextStyle(
                      fontSize: 13, color: Color.fromARGB(255, 95, 95, 95)),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              height: 40,
              width: 150,
              child: ElevatedButton(
                onPressed: () => chooseImage(ImageSource.gallery),
                child: Text(
                  'อัลบัมภาพ',
                  style: const TextStyle(
                      fontSize: 13, color: Color.fromARGB(255, 95, 95, 95)),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  void showToast(String? string) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(string!),
        action: SnackBarAction(
            label: 'ปิด', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void checkemptytext() {
    if (name == null ||
        name!.isEmpty ||
        lastname == null ||
        lastname!.isEmpty ||
        sex == null ||
        sex!.isEmpty ||
        identification == null ||
        identification!.isEmpty ||
        phone == null ||
        phone!.isEmpty ||
        user == null ||
        user!.isEmpty ||
        user == null ||
        user!.isEmpty ||
        password == null ||
        password!.isEmpty) {
      showToast('กรุณากรอกข้อมูลให้ครบถ้วน');
    } else {
      checkIndenttification();
    }
  }

  void checkIndenttification() {
    int lengthiden = identification!.length;
    print(lengthiden);
    if (lengthiden < 13) {
      showToast('เลขบัตรประชาชนไม่ถึง13หลัก กรุณาตรวจสอบอีกครั้ง');
    } else if (lengthiden > 13) {
      showToast('เลขบัตรประชาชนเกิน13หลัก กรุณาตรวจสอบอีกครั้ง');
    } else {
      checkPhoneNumber();
    }
  }

  void checkPhoneNumber() {
    int lengthphone = phone!.length;
    print(lengthphone);

    String mystringphone = phone!;
    print('${mystringphone[0]}');

    if (lengthphone > 10) {
      showToast('เบอร์ติดต่อผิด กรุณากรอกให้ถูกต้อง');
    } else if (lengthphone < 7) {
      showToast('เบอร์ติดต่อผิด กรุณากรอกให้ถูกต้อง');
    } else if (mystringphone[0] != '0') {
      showToast('เบอร์ติดต่อผิด กรุณากรอกให้ถูกต้อง');
    } else {
      checkType();
    }
  }

  void checkType() {
    print(type);

    if (type == null) {
      showToast('กรุณาเลือกประเภทผู้ใช้');
    } else {
      checkUserPass();
    }
  }

  void checkUserPass() {
    int lengthuser = user!.length;
    print(lengthuser);

    int lengthpass = password!.length;
    print(lengthpass);

    if (lengthuser < 5) {
      showToast('ชื่อบัญชีผู้ใช้สั้นเกินไป');
    } else if (lengthpass < 10) {
      showToast('รหัสผ่านสั้นเกินไป');
    } else {
      checkUsername();
    }
  }

  void checkUsername() {
    // String url =
    //     '${MyConstant().domain}/champshop/getUserWhereUser.php?isAdd=true&User=$user';
    // try {
    //   Response response = await Dio().get(url);
    //   if (response.toString() == 'null') {
    //     uploadpictureThread();
    //   } else {
    //     normalDialog(
    //         context, 'User นี่ $user มีคนอื่นใช้ไปแล้ว กรุณาเปลี่ยน User ใหม่');
    //   }
    // } catch (e) {}

    if (password == '1234') {
      showToast('ชื่อ User นี้มีคนอื่นใช้ไปแล้ว กรุณาเปลี่ยนชื่อ User ใหม่');
    } else {
      checkIden2();
    }
  }

  void checkIden2() {
    if (password == '1234') {
      showToast('เลขบัตรประชาชนนี้ถูกใช้ไปแล้ว');
    } else {
      checkAvatar();
    }
  }

  void checkAvatar() {
    if (file == null) {
      showToast('กรุณาเลือกรูปภาพให้เรียบร้อย');
    } else {
      uploadImage();
    }
  }

  Future<Null> uploadImage() async {

    setState(() {
      status = '1';
    });

    // String apiSaveAvatar =
    //     '${MyConstant().domain}/searchapartment/Apiauthen/saveAvatar.php';

    // int i = Random().nextInt(100000000);
    // String nameAvatar = 'avatar$i.jpg';
    // Map<String, dynamic> map = Map();
    // map['file'] =
    //     await MultipartFile.fromFile(file!.path, filename: nameAvatar);
    // FormData data = FormData.fromMap(map);
    // await Dio().post(apiSaveAvatar, data: data).then((value) {
    //   avatar = '/searchapartment/Avatar/$nameAvatar';
    // });

    // print(avatar);
    // print('upload image success');
    
 setState(() {
      status = '0';
    });
    
  }
}
