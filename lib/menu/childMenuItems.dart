import 'package:flutter/material.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'services/menuGalleryChildItem.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'search/searchContainer.dart';
import 'navigate/pageNavigate.dart';
import 'services/todo_service.dart';
import 'services/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'services/scopedModel.dart';
class ChildMenuItems extends StatefulWidget {
  @override
//  _ChildMenuItemsState createState() => _ChildMenuItemsState();
  State<StatefulWidget> createState() {
    return _ChildMenuItemsState();
  }
}
class _ChildMenuItemsState extends State<ChildMenuItems> {
  @override
  Widget build(BuildContext context) {
    final TodoService todoService = StateContainer.of(context).todoService;
//    final TodoServiceId todoServiceId = StateContainer.of(context).todoServiceId;
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return FutureBuilder<List<parentMenu>>(
            future: fetchParentMenu(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError);
              return snapshot.hasData ?
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: snapshot.data == null ?0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      var details = new Map();
                      details['"ID"'] ='"${snapshot.data[index].ID}"';
                      details['"ItemName"'] ='"${snapshot.data[index].ItemName}"';
                      details['"CategoryID"'] ='"${snapshot.data[index].CategoryID}"';
                      details['"ItemCode"'] ='"${snapshot.data[index].ItemCode}"';
                      details['"IsExpirable"'] ='"${snapshot.data[index].IsExpirable}"';
                      details['"ItemCategory"'] ='"${snapshot.data[index].ItemCategory}"';
                      details['"UOMID"'] ='"${snapshot.data[index].UOMID}"';
                      details['"MeasurementUnit"'] ='"${snapshot.data[index].MeasurementUnit}"';
                      details['"Procedures"'] ='"${snapshot.data[index].Procedures}"';
                      details['"PricePerUnit"'] ='"${snapshot.data[index].PricePerUnit}"';
//                                details['"ImageURL"'] ='"${snapshot.data[index].ImageURL}"';
                      details['"HasExtraItem"'] ='"${snapshot.data[index].HasExtraItem}"';
                      details['"ExtraIngredientJSON"'] ='"${snapshot.data[index].ExtraIngredientJSON}"';
                      details['"IngredientJSON"'] ='"${snapshot.data[index].IngredientJSON}"';
                      details['"IngredientID"'] ='"${snapshot.data[index].IngredientID}"';
                      details['"IngredientQuantity"'] ='"${snapshot.data[index].IngredientQuantity}"';
                      details['"IncludedTax"'] ='"${snapshot.data[index].IncludedTax}"';



                      todoService.addTodo(snapshot.data[index].ItemName,details.toString());
                      model.incrementCount(snapshot.data[index].ID,snapshot.data[index].PricePerUnit);
                      // TODO Menu Child Items Button (Image Tap)

                    },
                    splashColor: Colors.amber,
                    child:Stack(
                        children: <Widget>[
                          Container(
                            child: snapshot.data[index].ImageURL == null ?
                            Container( width: 150, height: 100,
                                child: Padding(padding: EdgeInsets.all(20),
                                  child: SvgPicture.asset(mainLogo),
                                )                           ):
                            Image.network(snapshot.data[index].ImageURL),
                            decoration: new BoxDecoration(boxShadow: [
                              new BoxShadow(
                                color: Colors.black45,
                                blurRadius: 3,
                                offset: Offset(4.0,5.0),
                              ),
                            ]),
                          ),
                          Padding(padding: EdgeInsets.only(top: 80),
                            child: Opacity(
                              opacity: 0.5,
                              child: Container(
                                color: Colors.black,
                                height: 70,
                                width: 150,
                                child: Align(
                                  alignment: Alignment
                                      .center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        '${snapshot.data[index].ItemName[0].toUpperCase() + snapshot.data[index].ItemName.substring(1)}',
                                        style: TextStyle(fontSize: 16,color: Colors.white,
                                          letterSpacing:0.5,
                                        ),
                                      ),
                                      Text(
                                        'Rs. ${ snapshot.data[index].PricePerUnit}',
                                        style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600,
                                          letterSpacing:0.5,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),

                  );
                },
              ):Center(child: CircularProgressIndicator());
            },);

        });
  }
}
