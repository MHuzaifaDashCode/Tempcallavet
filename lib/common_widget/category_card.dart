import 'package:flutter/material.dart';
import 'package:tempcallavet/constants.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.img,
    required this.title,
    required this.press,
  }) : super(key: key);
  
  final String img, title;
  final VoidCallback press;





  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(img),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
 
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
