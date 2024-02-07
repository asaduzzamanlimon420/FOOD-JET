import 'package:flutter/material.dart';
import 'package:food_jet/constants/values.dart';
import 'package:food_jet/main.dart';
import 'package:food_jet/model/cart_model.dart';
import 'package:food_jet/model/food_model.dart';
import 'package:food_jet/widgets/cart_bottom_sheet.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatefulWidget {
  final Food food;
  const FoodCard(this.food, {super.key});

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> with SingleTickerProviderStateMixin {
  Food get food => widget.food;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: roundedRectangle12,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               // buildImage(),
                buildTitle(),
                buildRating(),
                buildPriceInfo(),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(12)),
                ),
                child: Text(food.shop.name),
              ),
            )
          ],
        ),
      ),
    );
  }

  /*Widget buildImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2.5,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.network(
          '$BASE_URL/uploads/${food.images[0]}',
          fit: BoxFit.cover,
          loadingBuilder: (context, Widget child, ImageChunkEvent? progress) {
            if (progress == null) return child;
            final double? value = progress.expectedTotalBytes != null
                ? (progress.cumulativeBytesLoaded / progress.expectedTotalBytes)
                : null;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: CircularProgressIndicator(value: value),
              ),
            );
          },
        ),
      ),
    );
  }*/





  Widget buildTitle() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            food.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: titleStyle,
          ),
          Text(
            food.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: infoStyle,
          ),
        ],
      ),
    );
  }

  Widget buildRating() {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RatingBar.builder(
            initialRating: 5.0,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 14,
            unratedColor: Colors.black,
            itemPadding: const EdgeInsets.only(right: 4.0),
            ignoreGestures: true,
            itemBuilder: (context, _) => Icon(Icons.star, color: mainColor),
            onRatingUpdate: (rating) {},
          ),
          Text('(${food.rating})'),
        ],
      ),
    );
  }

  Widget buildPriceInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '\$ ${food.price}',
            style: titleStyle,
          ),
          Card(
            margin: const EdgeInsets.only(right: 0),
            shape: roundedRectangle4,
            color: mainColor,
            child: InkWell(
              onTap: addItemToCard,
              splashColor: Colors.white70,
              customBorder: roundedRectangle4,
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }

  addItemToCard() {
    bool isAddSuccess = Provider.of<MyCart>(context).addItem(CartItem(food: food, quantity: 1));

    if (isAddSuccess) {
      final snackBar = SnackBar(
        content: Text('${food.name} added to cart'),
        action: SnackBarAction(
          label: 'view',
          onPressed: showCart,
        ),
        duration: const Duration(milliseconds: 1500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = const SnackBar(
        content: Text('You can\'t order from multiple shop at the same time'),
        duration: Duration(milliseconds: 1500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  showCart() {
    showModalBottomSheet(
      shape: roundedRectangle40,
      context: context,
      builder: (context) => CartBottomSheet(),
    );
  }
}