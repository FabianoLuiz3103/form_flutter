import 'package:estudos_app/second.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
       body: const MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    firstNameController.addListener((){
      setState(() {
        firstName = firstNameController.text;
      });
    });

    lastNameController.addListener((){
      setState(() {
        lastName = lastNameController.text;
      });
    });

    emailController.addListener((){
      setState(() {
        email = emailController.text;
      });
    });

    passwordController.addListener((){
      setState(() {
        password = passwordController.text;
      });
    });
  }


  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(32),
        children: <Widget>[
          buidCampo(
          controller: firstNameController,
          errorMessage: 'First Name is required! ', 
          hintName: 'Fulano', 
          labelName: 'First Name', 
          inputType: TextInputType.name),
          Text(firstName),

          const SizedBox(height: 20,),

          buidCampo(
          controller: lastNameController,
          errorMessage: 'Last Name is required! ', 
          hintName: 'Souza', 
          labelName: 'Last Name', 
          inputType: TextInputType.name),
          Text(lastName),

          const SizedBox(height: 20,),

          buidCampo(
          controller: emailController,
          errorMessage: 'Email is required! ', 
          hintName: 'fulano@example.com', 
          labelName: 'Email', 
          inputType: TextInputType.emailAddress),
          Text(email),

          const SizedBox(height: 20,),

          buidCampo(
          controller: passwordController,
          errorMessage: 'Password is required! ', 
          hintName: 'Your Password...', 
          labelName: 'Password', 
          inputType: TextInputType.visiblePassword),
          Text(password),

          const SizedBox(height: 20,),

          ElevatedButton(onPressed: (){
            if(formKey.currentState!.validate()){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Details(firstName: firstName, lastName: lastName, email: email, password: password)));
              print('Nome: ${firstNameController.text} ${lastNameController.text}');
            print('Email: ${emailController.text}');
            print('Senha: ${passwordController.text}');
            }
            
          }, child: Text('SUBMIT'))
        ],
      )
      );
  }

  Widget buidCampo({required controller, required String errorMessage, required String hintName, required String labelName, required TextInputType inputType}){
    return TextFormField(
      controller: controller,
      validator: (value){
        if(value == null || value.isEmpty){
          return errorMessage;
        } 
        return null;
      },

      decoration: InputDecoration(
        hintText: hintName,
        labelText: labelName,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: (){
            firstNameController.clear();
          },
        )
      ),
      keyboardType: inputType,
    );
  }
  

}

