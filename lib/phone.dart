import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  static String verify="";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryCode=TextEditingController();
  var phone="";
@override
void initState(){
  countryCode.text="+91";
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25,right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img1.png',
              width: 150,
              height: 150,),
              SizedBox(
                height: 20,
              ),
              // Container( 
              //   height: 55,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1,color: Colors.grey),
              //     borderRadius: BorderRadius.circular(10)
              //   ),
              //   child: Row(
              //     children: [
              //       SizedBox(
              //       width: 10,
              //      ),
              //      SizedBox(
              //       width: 40,
              //       child: TextField(
              //         controller: countryCode,
              //         decoration: InputDecoration(
              //           border: InputBorder.none
              //         ),
              //       ),
              //      ),
                   
              //      Text("|",style: TextStyle(fontSize: 33,color: Colors.grey),),
              //      SizedBox(
              //       width: 10,
              //      ),
              //      Expanded(
              //      // width: 40,
              //       child: TextField(
              //         decoration: InputDecoration(
              //           border: InputBorder.none,
              //           hintText: "Phone number"
              //         ),
              //       ),
              //      ),
              //     ],
              //   ),
              // ),
             Text('Phone Verification',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
               Text('We need to register your phone before getting started !',style: TextStyle(fontSize: 16 ,),
               textAlign: TextAlign.center,),
               SizedBox(
                height: 30,
               ),
               Container( 
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    SizedBox(
                    width: 10,
                   ),
                   SizedBox(
                    width: 40,
                    child: TextField(
                      controller: countryCode,
                      decoration: InputDecoration(
                        border: InputBorder.none
                      ),
                    ),
                   ),
                   
                   Text("|",style: TextStyle(fontSize: 33,color: Colors.grey),),
                   SizedBox(
                    width: 10,
                   ),
                   Expanded(
                   // width: 40,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        phone=value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone number"
                      ),
                    ),
                   ),
                  ],
                ),
              ),
              SizedBox(height: 20,), 
              SizedBox(
                height: 45,
                width: double.infinity,
                child:  ElevatedButton(
                  onPressed: () async{
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countryCode.text+phone}',
                    //'+44 7123 123 456',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      MyPhone.verify=verificationId;
                      Navigator.pushNamed(context, "otp");

                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                 // Navigator.pushNamed(context, "otp");
                }, 
               child:Text('Send the code'),
               style: ElevatedButton.styleFrom(primary: Colors.green.shade600,
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
               )),),
              )


            ],
          ),
        ),
      ),
    );
  }
}