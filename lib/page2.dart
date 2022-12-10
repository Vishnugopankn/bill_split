import 'package:bill_split2/main.dart';
import 'package:flutter/material.dart';


class Bill_split extends StatefulWidget {
  double friends;
  int tax;
  int tip;
  List<String> total;

  Bill_split({Key? key, required  this.friends, required this.tax, required  this.tip, required  this.total}) : super(key: key);

  @override
  State<Bill_split> createState() => _Bill_splitState();
}

class _Bill_splitState extends State<Bill_split> {
  String k = " ";
  double bill=0;
  @override
  void initState() {
    super.initState();
    taxcalculation();
  }
  void taxcalculation(){
    for(int i=0;i<(widget.total).length;i++){
      k=k+widget.total[i];
    }
    double taxamount=double.parse(k)* widget.tax/100;
    double finalbill=(double.parse(k)+taxamount+widget.tip)/widget.friends;
    setState(() {
      bill=finalbill;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                  child: Text("RESULT",style: TextStyle(fontSize: 50,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                color: Colors.yellow,width: double.maxFinite,height: 200,
                child:
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Equally Divided",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text("\$$bill",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Friends",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          Text("Tax",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          Text("Tip",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.friends.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          Text(widget.tax.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          Text(widget.tip.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ],
                ),
              ),
            ),
            SizedBox(height: 30,),

            Center(child: Text("Everybody Should Pay \$$bill",style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold),)),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                  width: double.maxFinite,
                  child:
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow,),
                      onPressed: (){
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (BuildContext context) => const bill_split2(),));
                      },
                      child:
                      Text("Calculate Again ?",style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold),))),
            ),
          ],
        ),
      ),
    );

  }
}
