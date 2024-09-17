
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/moduels/web_veiw/web_veiw.dart';

Widget BuildBusinessArticle(article, context) => InkWell(
  onTap: ()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        Web_Veiw(article['url']),),);
  },
  child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 130.0,
              height: 130.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:  DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                height: 130.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
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

Widget BuildItem(list,{isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  fallback: (context) => isSearch ? Container() : const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemCount:list.length ,
    itemBuilder:(context, index) => BuildBusinessArticle(list[index],context),
    separatorBuilder: (BuildContext context, int index) => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    ) ,

  ),);

