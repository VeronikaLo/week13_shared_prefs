import 'package:flutter/material.dart';
import 'package:week13_shared_prefs/user_pref.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String note ="";
  
  void _logInCheck(){

  if( (UserPreferences.getUsername() == _usernameController.text) && (UserPreferences.getPassword() == _passwordController.text)){ 

                      setState(() {
                        note ="Welcome, ${_usernameController.text} !";
                        _usernameController.clear();
                        _passwordController.clear();
                      });
                      }
                      else{setState(() {
                        note ="Ops, incorrect data\n Please try again";
                        _usernameController.clear();
                        _passwordController.clear();
                      });}
  }

  @override
  void initState() {
    super.initState();
    UserPreferences.init();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green.shade500,),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 10,),
              const Text('Log In',
                style: TextStyle(fontSize: 30 ),
                textAlign: TextAlign.center,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                margin: const EdgeInsets.all(20),
                width: 350,
                height: 300,
                decoration:   BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.green.shade200,
                  boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(3, 3),
                      )
                    ]
                ),
                child:  Column(children:[
                  TextFormField(
                    controller: _usernameController,
                    decoration:  const InputDecoration(
                      
                      labelText: "Username",
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15),),
                      ),
                      prefixIcon: Icon(Icons.person)
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _passwordController,
                    decoration:  const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),),
                      ),
                      prefixIcon: Icon(Icons.password)
                    ),
                  ),
          
                  const SizedBox(height:35),
                  OutlinedButton.icon(
                    onPressed: _logInCheck,
                    icon:  Icon(Icons.login, size: 36, color: Colors.green.shade800,),
                    label: Text('Login', 
                    style: TextStyle(
                      color: Colors.green.shade800,
                      fontSize: 18 ),)),
          
          
                
                ],
                    
                ),
              ),
              Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                      const Text("Don't have an account yet?"),
                      TextButton(onPressed: () => Navigator.pushNamed(context, '/register'),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green.shade800,
                          ),))
          
                    ],
          
                    ),
                  ),
              const SizedBox(height: 30,),
              Text(note ,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amberAccent ),),
            ],
          ),
        ),
      ),
    );
  }
}