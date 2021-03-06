
import 'package:flutter/material.dart';
import 'package:moviestro/auth/auth_service.dart';

class Register extends StatefulWidget {

  final Function changeView;
  Register(this.changeView);


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _key = GlobalKey<FormState>();
  final _auth = AuthService();
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("MOV",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.w900)),
                  Text(
                    "S",
                    style: TextStyle(
                        color: Color.fromARGB(255, 41, 196, 163),
                        fontSize: 40.0,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 15.0),
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator:(str) => str.isEmpty || !str.contains('@') ? "Enter correct email":null,
                      onChanged: (str) {
                        setState(() => email = str);
                      },
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      decoration: InputDecoration(
                          hintText: "Input email",
                          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16.0),
                          fillColor: Color.fromARGB(140, 40, 40, 40),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey[700],
                            size: 20.0,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 30.0),
                          focusColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[700], width: 0.5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[700], width: 0.5))),
                      cursorColor: Colors.white,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextFormField(
                      validator:(str) => str.length<6 ? "Enter password minimum 6 chars length" : null,
                      onChanged: (str) {
                        setState(() => password = str);
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          hintText: "Input password",
                          hintStyle: TextStyle(
                              color: Colors.grey[600], fontSize: 16.0),
                          fillColor: Color.fromARGB(140, 40, 40, 40),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.grey[700],
                            size: 20.0,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 30.0),
                          focusColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[700], width: 0.5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[700], width: 0.5))),
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.0),
                            ),
                            color: Color.fromARGB(255, 41, 196, 163),
                            padding: EdgeInsets.symmetric(
                                vertical: 25.0, horizontal: 20.0),
                            onPressed: () async {
                              if(_key.currentState.validate()){
                                 dynamic user = await _auth.registerWithEmailAndPassword(email.trim().replaceAll(" ",""), password);
                                 print(user);
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Do you have an account? ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: (){
                      widget.changeView();
                    },
                    child: Text(
                      "Sing In",
                      style: TextStyle(
                          color: Color.fromARGB(255, 41, 196, 163),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'img/bg.jpg',
              ),
              fit: BoxFit.cover)),
    );
  }
}
