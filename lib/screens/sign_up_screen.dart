import 'package:flutter/material.dart';
import 'package:week13_shared_prefs/user_pref.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void registration(){
    if (_formKey.currentState!.validate()) {
    //данные для регистрации записываются в память
      UserPreferences.setUsername(_usernameController.text);
      UserPreferences.setPassword(_passwordController.text);
                                    
      Navigator.pop(context);
      }
  }


  @override
  void initState() {
    super.initState();
    UserPreferences.init();

  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink.shade800,),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              children: [
                const SizedBox(height: 10,),
                const Text('Sign Up',
                      style: TextStyle(fontSize: 30 ),
                      textAlign: TextAlign.center,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: const EdgeInsets.all(20),
                  width: 350,
                  height: 300,
                  decoration:   BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Colors.pink.shade200,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(3, 3),
                      )
                    ],
                  ),
                  child:  Column(children:[
                    TextFormField(
                      controller: _usernameController,
                      validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter username';
                              }
                            },
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
                      //onChanged: ,
                      validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                            },
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
                      onPressed: registration,
                      icon: Icon(Icons.house, size: 36, color: Colors.pink.shade800,),
                      label: Text('Register',
                      style: TextStyle(
                        color: Colors.pink.shade800,
                        fontSize: 18,
                      ))),
        
        
                  
                  ],
                      
                  ),
                ),
                Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, 
                        children: [
                        const Text('Already have an account?'),
                        TextButton(onPressed: () => Navigator.pop(context),
                        child: Text('Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.pink.shade800,), ))
        
                      ],
        
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}