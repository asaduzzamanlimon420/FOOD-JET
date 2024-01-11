/*import 'package:flutter/material.dart';

class RestaurantHome extends StatefulWidget{
  const RestaurantHome({Key?key}):super(key:key);
  @override
  _RestaurantHomeState createState() =>_RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  @override
  Widget build(BuildContext context){
    var size=MediaQuery.of(context).size ;
    return Scaffold(
      appBar: PreferredSize(child: MainAppBar(size:size),preferredSize: Size.fromHeight(80),),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_jet/components/menu_card.dart';
import 'package:food_jet/components/restaruant_categories.dart';
import 'package:food_jet/components/restaurant_info.dart';
import 'package:food_jet/models/menu.dart';

import '../components/restaurant_appbar.dart';
import 'package:food_jet/models/components/restaurant_appbar.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
          slivers: [
            const RestaurantAppBar(),
            const SliverToBoxAdapter(
              child: RestaurantInfo(),
            ),
            SliverToBoxAdapter(
              child: Categories(
                onChanged:(value) {},
                selectedIndex: 0,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context,categoryIndex){
                  List<Menu> items =demoCategoryMenus[categoryIndex].items;
                  return MenuCategoryItem(
                      title: demoCategoryMenus[categoryIndex].category,
                      items:List.generate(items.length,
                              (index) => Padding(
                            padding: const EdgeInsets.only(bottom:16),
                            child: MenuCard(
                                title: items[index].title,
                                image: items[index].image ,
                                price: items[index].price),
                          ))

                  );
                },
                  childCount: demoCategoryMenus.length,
                ),
              ),
            )
          ]
      ),
    );
  }
}
