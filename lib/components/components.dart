import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:messanger/NewsApp%20copy/webview/web_view.dart';
import 'package:messanger/todo_cubit%20copy/cubit.dart';

import '../NewsApp/webview/web_view.dart';

Widget defaultButton({
  double width = double.infinity,
  Color backGroundColor = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required void Function() onTap,
  required String text,
}) =>
    Container(
        width: width,
        decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.circular(radius)),
        child: MaterialButton(
          onPressed: onTap,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));

Widget defaultFormText({
  required TextEditingController control,
  required TextInputType type,
  required dynamic validator,
  Function? onSubmit,
  Function? onChanged,
  Function? onTap,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixClicked,
}) =>
    TextFormField(
      controller: control,
      keyboardType: type,
      validator: validator,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onTap: () {
        onTap!();
      },
      obscureText: isPassword,
      onChanged: (value) {
        onChanged!(value);
      },
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixClicked!();
                  },
                  icon: Icon(suffix),
                )
              : null,
          border: OutlineInputBorder()),
    );

// Widget defaultAppBar({
//   required BuildContext context,
//   String ?title,
//   List<Widget>? actions,
// })=>AppBar(
//   leading: IconButton(
//     icon: Icon(IconBroken.Arrow___Left_2),
//     onPressed: (){
//       Navigator.pop(context);
//     },
//   ),
//   title: Text(
//      title!
//   ),
//   titleSpacing: 5.0,
//   actions: actions,
// );
Widget taskbuilder(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          // SizedBox(height: 50,),
          Row(
            children: [
              CircleAvatar(
                child: Text(
                  "${model['time']}",
                  style: TextStyle(fontSize: 20),
                ),
                radius: 48,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model['title']}",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${model['date']}",
                    style: TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              // SizedBox(
              //   width: 90,
              // ),
              IconButton(
                  onPressed: () {
                    todocubit
                        .get(context)
                        .updateData(status: 'done', id: model['id']);
                  },
                  icon: Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    todocubit
                        .get(context)
                        .updateData(status: 'archive', id: model['id']);
                  },
                  icon: Icon(
                    Icons.archive,
                    color: Colors.black45,
                  )),
            ],
          )
        ]),
      ),
      onDismissed: (direction) {
        todocubit.get(context).deleteFromdatabase(id: model['id']);
      },
    );
Widget divider() => Container(
      color: Colors.grey,
      height: 1,
      width: double.infinity,
    );

Widget tasksEmpty({required List<Map> tasks}) => ConditionalBuilder(
    condition: tasks.length > 0,
    builder: (context) => ListView.separated(
        itemBuilder: (context, index) => taskbuilder(tasks[index], context),
        separatorBuilder: (context, index) => divider(),
        itemCount: tasks.length),
    fallback: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu,
                size: 100,
                color: Colors.grey,
              ),
              Text(
                'No Tasks Yet Please add Some Tasks',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));

Widget artical(aratical, context) => InkWell(
      onTap: () => navigateTo(context, webveiw(url: aratical['url'])),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                aratical['urlToImage'] != null
                        ?
                Image.network(
                  
                  "${aratical['urlToImage']}",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ):
                Image.network(
                   width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png')
                
                ,
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    child: Column(
                      children: [
                        Text(
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          "${aratical['title']}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "${aratical['publishedAt']}",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
Widget listartical(buslist, context, {required int listcount,isseach=false,}) =>
    ConditionalBuilder(
      condition: buslist.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => artical(buslist[index], context),
          separatorBuilder: (context, index) => divider(),
          itemCount: listcount),
      fallback: (context) =>isseach?Container(): Center(child: CircularProgressIndicator()),
    );
Widget buildArticleItems(article, context) => InkWell(
      onTap: () {
        navigateTo(
            context,
            WebViewScreen(
              url: article['url'],
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: article['urlToImage'] != null
                        ? DecorationImage(
                            image: NetworkImage('${article['urlToImage']}'),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png'),
                          ))),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articleBuilder(businessList, context,
        {required int itemCount, isSearch = false}) =>
    ConditionalBuilder(
      condition: businessList.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItems(businessList[index], context),
          separatorBuilder: (context, index) => dividerWidget(),
          itemCount: itemCount),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

Widget dividerWidget() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );

void navigateTo(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget), (route) => false);

Widget defaultTextButton(
        {required void Function() onTap, required String text}) =>
    TextButton(
        onPressed: () {
          onTap();
        },
        child: Text(text.toUpperCase()));

// void showToast({
//   required String text,
//   required ToastState state})=>  Fluttertoast.showToast(
// msg: text,
// toastLength: Toast.LENGTH_LONG,
// gravity: ToastGravity.BOTTOM,
// timeInSecForIosWeb: 5,
// backgroundColor: chooseToastColor(state),
// textColor: Colors.white,
// fontSize: 16.0
// );

enum ToastState { Success, Error, Warning }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.Success:
      color = Colors.green;
      break;
    case ToastState.Error:
      color = Colors.red;
      break;
    case ToastState.Warning:
      color = Colors.amber;
      break;
  }
  return color;
}

// Widget buildProductItems( model, context,{bool inSearch=true}) => Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: Container(
//     height: 120,
//     child: Row(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomStart,
//           children: [
//             Image(image: NetworkImage((model.image)!),
//               width: 120,
//               height: 120,
//             ),
//             if((model.discount) != 0&&inSearch)
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 5),
//                 color: Colors.red,
//                 child: Text('Discount',
//                   style: TextStyle(
//                       fontSize: 10,
//                       color: Colors.white
//                   ),
//                 ),
//               ),
//           ],
//         ),
        // SizedBox(
        //   width: 20,
        // ),
      //   Expanded(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text((model.name)!,
      //           maxLines: 2,
      //           overflow: TextOverflow.ellipsis,
      //           style: TextStyle(
      //             height: 1.3,
      //           ),
      //         ),
      //         Spacer(),
      //         Row(
      //           children: [
      //             Text((model.price.toString()),
      //               style: TextStyle(
      //                   fontSize: 12,
      //                   color: defaultColor
      //               ),
      //             ),
      //             SizedBox(
      //               width: 5,
      //             ),
      //             if((model.discount) != 0&&inSearch)
      //               Text(model.discount.toString(),
      //                 style: TextStyle(
      //                   fontSize: 10,
      //                   color: Colors.grey,
      //                   decoration: TextDecoration.lineThrough,
      //                 ),
      //               ),
      //             Spacer(),

      //             IconButton(
      //               onPressed: () {
      //                 ShopCubit.get(context).changeFavourites(
      //                     (model.id)!
      //                 );
      //                 // print(model.id);
      //               },
      //               icon: CircleAvatar(
      //                   backgroundColor: ShopCubit
      //                       .get(context)
      //                       .favourite[model.id]!
      //                       ? defaultColor
      //                       : Colors.grey,
      //                   radius: 15,
      //                   child: Icon(Icons.favorite_border,
      //                     color: Colors.white,
      //                     size: 14,
      //                   )
      //               ),
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ],
//     ),
//   ),
// );
