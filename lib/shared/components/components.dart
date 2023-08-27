import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpeerCase = true,
  double radius = 30.0,
  @required Function()? function,
  @required String text = '',
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpeerCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );

Widget defaultTextFormField({
  @required TextEditingController? controller,
  @required TextInputType? inputType,
  @required String? text,
  @required IconData? prefix,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  void Function()? ontap,
  @required String? Function(String?)? validate,
  bool isobscure = false,
  IconData? suffix,
  Function()? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
          labelText: text,
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(onPressed: suffixPressed, icon: Icon(suffix)),
          border: OutlineInputBorder()),
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      obscureText: isobscure ? true : isobscure,
      onTap: ontap,
    );


Widget buildArticleItem(article, context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
                Text(
                  "${article['publishedAt']}",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget articleBuilder(list, context) {
  return BuildCondition(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: ((context, index) => Divider()),
        itemCount: list.length),
    fallback: (context) => Center(
      child: CircularProgressIndicator(),
    ),
  );
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
