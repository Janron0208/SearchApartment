import 'package:flutter/material.dart';
import 'package:scanapartment/authen/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? username = '';
  String? password = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      key: scaffoldKey,
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network(
            'https://png.pngtree.com/png-vector/20190327/ourlarge/pngtree-apartment-building-business-logo-design-png-image_880947.jpg',
            width: 200,
            height: 200,
          ),
          Text('HaHorPak'),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextFormField(
              onChanged: (value) {
                username = value.trim();
                setState(() {
                  username = value;
                });
              },
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'บัญชีผู้ใช้',
                hintText: 'กรอกบัญชีผู้ใช้ของคุณ...',
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
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextFormField(keyboardType: TextInputType.number,
              onChanged: (value) {
                password = value.trim();
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'รหัสผ่าน',
                hintText: 'กรอกรหัสผ่าน...',
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
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print('$username , $password');
              },
              child: Text('เข้าสู่ระบบ')),
          Container(
          
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
              child: Text(
                'สมัครสมาชิก',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 138, 92),
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
