import 'package:bmi_calculator/feathers/auth/screens/BMI_Calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginscreen extends StatefulWidget {
  loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {

  @override
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  late bool newuser;

  void check_if_already_login() async {
    final pre = await SharedPreferences.getInstance();
    newuser = (pre.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {

      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => BMI()));
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Login screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 100,

                      child: Image.network(
                          'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png')),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone number, email or username',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                  controller: name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  controller: password,
                ),
              ),
              SizedBox(
                height: 65,
                width: 360,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      child: const Text(
                        'Log in ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () async {
                        final pre = await SharedPreferences.getInstance();
                        pre.setString('N', name.text);
                        pre.setString('P', password.text);
                        pre.setBool('login', false);
                        Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) {
                              return  BMI();
                            }));

                        print('Successfully log in ');
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                  child: Center(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 62),
                          child: Text('Forgot your login details? '),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.0),
                          child: InkWell(
                              onTap: () {

                              },
                              child: const Text(
                                'Get help logging in.',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.blue),
                              )),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    }
  }


