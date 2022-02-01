import 'package:flutter/material.dart';
import 'package:morphos_assignment/app/modules/home/models/product_model.dart';
import 'dart:math';
Random random = new Random();
class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
   
  }) : super(key: key);

  final Product product;
  

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(-1, 1),
                blurRadius: 10,
                spreadRadius: 1,
                color: Colors.grey.shade400)
          ],
          borderRadius:
              BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.start,
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  product.imageLink ??
                      "https://content.optimumnutrition.com/i/on/on-on-C101179_Image_01?locale=en-us,en-gb,*&layer0=PDP_003",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.05,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start,
              mainAxisSize:
                  MainAxisSize.max,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.name}',
                  maxLines: 3,
                  overflow:
                      TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${product.priceSign} ${double.parse(product.price??'0')+1+random.nextInt(10)}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1,
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal,
                  child: Row(
                    children:
                        product.tagList!
                            .map(
                              (tag) => Text(
                                '#$tag  ',
                                style: Theme.of(
                                        context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color:
                                          Colors.blueGrey,
                                    ),
                              ),
                            )
                            .toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal,
                  child: Row(
                      children: product
                          .productColors!
                          .map(
                              (productColor) {
                   
                    return Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: Color(
                            int.parse(
                              '0XFF${productColor.hexValue!.substring(1)}',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    );
                  }).toList()),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
