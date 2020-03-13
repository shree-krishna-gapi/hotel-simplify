//import 'package:flutter/material.dart';
//
//class Bill extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: ListView(
//          children: <Widget>[
//            billHeader(context),
//            Container(
//              color: Colors.grey[400],
//              padding: const EdgeInsets.all(15),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text('S.N.', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('Items', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('Quantity', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('Rate', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('Amount', style: TextStyle(fontWeight: FontWeight.w500))
//                ],
//              ),
//            ),
//            Container(
//              color: Colors.grey[300],
//              padding: const EdgeInsets.all(15),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text('', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('KOT', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('680.00', style: TextStyle(fontWeight: FontWeight.w500))
//                ],
//              ),
//            ),
//            Container(
//              padding: const EdgeInsets.all(15),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text('1.'),
//                  Text('Chopsuey', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('1', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('250.00', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('250.00', style: TextStyle(fontWeight: FontWeight.w500))
//                ],
//              ),
//            ),
//            Container(
//              padding: const EdgeInsets.all(15),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text('2.'),
//                  Text('Veg. Chowmein',
//                      style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('1', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('230.00', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('230.00', style: TextStyle(fontWeight: FontWeight.w500))
//                ],
//              ),
//            ),
//            Container(
//              padding: const EdgeInsets.all(15),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text('3.'),
//                  Text('Veg. Momo', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('1', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('200.00', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('200.00', style: TextStyle(fontWeight: FontWeight.w500))
//                ],
//              ),
//            ),
//            Container(
//              color: Colors.grey[300],
//              padding: const EdgeInsets.all(15),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text('', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('Pizza', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('1100.00', style: TextStyle(fontWeight: FontWeight.w500))
//                ],
//              ),
//            ),
//            ListView.builder(
//                itemCount: 4,
//                itemBuilder: (BuildContext,context){
//                return Row(
//                  children: <Widget>[
//                    Text('hello1')
//                  ],
//                );
//            }),
//            Container(
//              padding: const EdgeInsets.all(15),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text(''),
//                  Text('Onion Paste(E)',
//                      style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('1', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('30.00', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('30.00', style: TextStyle(fontWeight: FontWeight.w500))
//                ],
//              ),
//            ),
//            Container(
//              padding: const EdgeInsets.all(15),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text('5.'),
//                  Text('Margherita Pizza',
//                      style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('1', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('500.00', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('500.00', style: TextStyle(fontWeight: FontWeight.w500))
//                ],
//              ),
//            ),
//            Container(
//              padding: const EdgeInsets.all(15),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text(''),
//                  Text('Onion Paste(E)',
//                      style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('1', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('30.00', style: TextStyle(fontWeight: FontWeight.w500)),
//                  Text('30.00', style: TextStyle(fontWeight: FontWeight.w500))
//                ],
//              ),
//            ),
//            Divider(
//              color: Colors.black,
//            ),
//            billFooter(context),
//          ],
//        ));
//  }
//
//  Widget billHeader(BuildContext context) => Container(
//    color: Colors.purple,
//    padding: const EdgeInsets.all(30),
//    child: Column(
//      children: <Widget>[
//        Container(
//            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text('Bill No.    ', style: TextStyle(color: Colors.white)),
//                Text('Table Name:HT-01/HT-11',
//                    style: TextStyle(color: Colors.white)),
//                Text('Room: 3', style: TextStyle(color: Colors.white))
//              ],
//            )),
//        Container(
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              Text('TimeStamp:6/5/2019,4:04:33 PM',
//                  style: TextStyle(color: Colors.white)),
//              Text('Waiter: "Superuser"',
//                  style: TextStyle(color: Colors.white))
//            ],
//          ),
//        ),
//      ],
//    ),
//  );
//  Widget billFooter(BuildContext context) => Container(
//    padding: const EdgeInsets.all(30),
//    child: Row(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        Container(
//          child: Column(
//            children: <Widget>[
//              Text('Discount Method',
//                  style: TextStyle(
//                      fontSize: 27.0, fontWeight: FontWeight.bold)),
//              SizedBox(
//                height: 10.0,
//              ),
//              Text('Discount Type'),
//              Row(
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      Radio(
//                          groupValue: 1,
//                          onChanged: (value) {},
//                          value: true),
//                      Text('   Flat')
//                    ],
//                  ),
//                  Row(
//                    children: <Widget>[
//                      Radio(
//                          groupValue: 1,
//                          onChanged: (value) {},
//                          value: true),
//                      Text('   Percentage')
//                    ],
//                  )
//                ],
//              ),
//              Text('KOT (Rs 0.00)'),
//              SizedBox(
//                height: 10.0,
//              ),
//              Text('BAR (Rs 0.00)'),
//              SizedBox(
//                height: 10.0,
//              ),
//              Text('Bakery (Rs 0.00)'),
//              SizedBox(
//                height: 10.0,
//              ),
//              Text('Pizza (Rs 0.00)')
//            ],
//          ),
//        ),
//        Container(
//          child: Column(
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.end,
//                    children: <Widget>[
//                      Text('Sub Amount:     '),
//                      Divider(),
//                      Text('Discounted Amount:    '),
//                      Divider(),
//                      Text('Basic Amount:    '),
//                      Divider(
//                        color: Colors.black,
//                      ),
//                      Text('Service Charge(+10%):    '),
//                      Divider(),
//                      Text('VAT(+13%):    '),
//                      SizedBox(
//                        height: 15,
//                      ),
//                      Text(
//                        'Total Amount:    ',
//                        style: TextStyle(fontWeight: FontWeight.bold),
//                      )
//                    ],
//                  ),
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.end,
//                    children: <Widget>[
//                      Text('1780.00'),
//                      Divider(),
//                      Text('0.00'),
//                      Divider(),
//                      Text('1780.00'),
//                      Divider(),
//                      Text('178.00'),
//                      Divider(),
//                      Text('254.54'),
//                      SizedBox(
//                        height: 15,
//                      ),
//                      Text('2212.54',
//                          style: TextStyle(fontWeight: FontWeight.bold)),
//                    ],
//                  )
//                ],
//              ),
//              SizedBox(
//                height: 25.0,
//              ),
//              FlatButton(
//                child: Text(
//                  'Pay Bill',
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () {},
//                color: Colors.yellow[700],
//              )
//            ],
//          ),
//        ),
//      ],
//    ),
//  );
//}
