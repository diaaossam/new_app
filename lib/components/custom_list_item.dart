import 'package:flutter/material.dart';
import 'package:new_app/models/news_model.dart';
import 'package:new_app/screens/web_view/web_view_screen.dart';
import 'package:new_app/sharing/constants/constants.dart';
import 'package:new_app/sharing/style/size_config.dart';

class BuildCustomListItem extends StatelessWidget {
  final Articles articl;

  BuildCustomListItem(this.articl);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, WebViewScreen(articl.url??''));
      },
      child: Padding(
        padding: EdgeInsets.symmetric
          (horizontal: getProportionateScreenWidth(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.bodyHeight * 0.20,
              width: SizeConfig.screenWidth * 0.40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: articl.urlToImage != null
                        ? NetworkImage('${articl.urlToImage}')
                        : AssetImage("assets/images/error.jpg") as ImageProvider
                    //AssetImage("assets/images/error.jpg")
                    ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(15),
            ),
            Expanded(
              child: Container(
                height: SizeConfig.bodyHeight * 0.20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${articl.title}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Text(
                      '${articl.publishedAt}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
