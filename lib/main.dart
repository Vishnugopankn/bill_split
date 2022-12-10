import 'package:bill_split2/page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const bill_split2(),
  ));
}

class bill_split2 extends StatefulWidget {
  const bill_split2({Key? key}) : super(key: key);

  @override
  State<bill_split2> createState() => _bill_split2State();
}

class _bill_split2State extends State<bill_split2> {
  double slidervalue = 0;
  double friends = 0;
  int count=0;
  int taxValue=0;
  TextEditingController Tax=TextEditingController();
  List<String> gridVals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "SPLIT BILL",
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                color: Colors.yellow,
                width: double.maxFinite,
                height: 200,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            gridVals.join(""),
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Friends",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Tax",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Tip",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$slidervalue",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "$taxValue\%",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "$count",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "How Many Friends ?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(60),
              child: Slider(
                  inactiveColor: Colors.grey,
                  activeColor: Colors.yellow,
                  thumbColor: Colors.orangeAccent,
                  min: 0.0,
                  max: 100,
                  divisions: 10,
                  value: slidervalue,
                  onChanged: (value) {
                    setState(() {
                      slidervalue = value;
// print('valu is${value}');
// print('slider valu is${slidervalue}');
                    });
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellow,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Tip",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        decrementtip();
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      )),
                                  maxRadius: 15,
                                  backgroundColor: Colors.grey,
                                ),
                                Text(
                                  "\$ $count",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        incrementtip();
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                  maxRadius: 15,
                                  backgroundColor: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(fontSize: 20),
                        controller: Tax,
                        onChanged: (val)
                        {
                         setState(() {
                           taxValue= int.parse(val);
                         });

                        },
                        decoration: InputDecoration(
                            label: Text(
                              "Tax in %",
                              style: TextStyle(fontSize: 20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 70)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                //mainAxisSpacing: 10,
                 //crossAxisSpacing: 10,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("1");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      elevation: 4.0,
                      child: Center(child: Text("1",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("2");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text("2",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("3");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text("3",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("4");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text("4",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("5");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text("5",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("6");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text("6",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("7");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text("7",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("8");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text("8",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("9");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text("9",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add(".");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text(".",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("0");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text("0",style: TextStyle(fontSize: 40),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gridVals.add("-");
                      });
                    },
                    child: Card(color: Colors.blueGrey,
                      child: Center(child: Text("-",style: TextStyle(fontSize: 40),)),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.maxFinite,height: 50,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Bill_split(friends:slidervalue,
                      tax:taxValue,tip:count,total:gridVals)));
                }, child: Text("SPLIT BILL",style: TextStyle(fontSize: 20),)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void incrementtip()
  {
    setState(() {
      count++;
    });
  }

  void decrementtip() {
    setState(() {
      if(count==0){
        count=0;
      }else{
        count--;
      }

    });
  }

}
