import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';


class CardFoDetails extends StatefulWidget {
  const CardFoDetails({super.key});

  @override
  State<CardFoDetails> createState() => _CardFoDetailsState();
}

class _CardFoDetailsState extends State<CardFoDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Card Form"),
            const SizedBox(height: 20),
                  CardFormField(controller: CardFormEditController()),
                  SizedBox(height: 10),
          ElevatedButton(onPressed: (){}, child: Text("PayNow"))
          ],
        ),
      ));
  }
}