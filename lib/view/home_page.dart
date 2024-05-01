import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hush_day/controller/payment_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              // controller.displayPaymentSheet();
              controller.makePayment(amount: '910', currency: 'USD');
              // showCupertinoDialog(context: context, builder: (BuildContext context) => CupertinoActionSheet(
              //   title: Text("Hey Android"),
              //   actions: [
              //     CupertinoActionSheetAction(onPressed: (){
                    
              //       Navigator.pop(context);
              //     }, child: Text("Rajesh")),
              //     CupertinoActionSheetAction(onPressed: (){}, child: Text("sundar"))
              //   ],

              // )
              // );
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Make Payment',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
