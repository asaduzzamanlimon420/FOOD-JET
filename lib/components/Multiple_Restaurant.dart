import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comment {
  final String username;
  final String comment;

  Comment({required this.username, required this.comment});
}


class CartItem {
  final String name;
  final String image;
  final String restaurantName;
  final int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.restaurantName,
    required this.quantity,
  });

  get price => null;
}

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the CartPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: [],),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          RestaurantCard(name: 'CHILLOX', image: 'images/chillox.png', time: '25min', ratings: 120,),
          RestaurantCard(name: 'KUDOS', image: 'images/kudos.png', time: '40min', ratings: 100,),
          RestaurantCard(name: 'DOMINOS', image: 'images/Dominos.png', time: '30min', ratings: 250,),
          RestaurantCard(name: 'KFC', image: 'images/KFC.png', time: '60min', ratings: 50,),
          RestaurantCard(name: 'KACCHI VAI', image: 'images/kacchiVai.jpg', time: '1hour', ratings: 200,),

          // Add more RestaurantCard widgets as needed
        ],
      ),
    );
  }
}
class RestaurantCard extends StatelessWidget {
  final String name;
  final String image;
  final String time;
  final int ratings;

  RestaurantCard({super.key, required this.name, required this.image, required this.time, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailPage(name: name, image: image),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              image,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text('$ratings+ Ratings'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Delivery'),
                      Icon(Icons.delivery_dining),
                      SizedBox(width: 8),
                      Text(' $time'),
                      Icon(Icons.access_time),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: const Text(
                          'Take Away',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  final List<MenuItemCard> menuItems;

  MenuList({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: menuItems,
    );
  }
}

class RestaurantDetailPage extends StatelessWidget {
  final String name;
  final String image;

  RestaurantDetailPage({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    List<MenuItemCard> menuItems = [];
    if (name == 'CHILLOX') {
      menuItems = [
        const MenuItemCard(
          name: 'Pizza',
          image: 'images/pizza.jpg',
          description: 'Delicious pizza with various toppings.',
          price: 325,

        ),
        const MenuItemCard(
          name: 'Pasta',
          image: 'images/pasta.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,

        ),
        const MenuItemCard(
          name: 'Spaghetti',
          image: 'images/spaghetti.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,

        ),
      ];
    } else if (name == 'KUDOS') {
      menuItems = [
        const MenuItemCard(
          name: 'Burger',
          image: 'images/burger.jpg',
          description: 'Juicy burger with cheese and veggies.',
          price: 325,

        ),
        const MenuItemCard(
          name: 'Sandwich',
          image: 'images/sandwich.jpg',
          description: 'Fresh and tasty sandwich options.',
          price: 325,

        ),
        const MenuItemCard(
          name: 'Tomato Pasta',
          image: 'images/red_pasta.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,

        ),
      ];
    } if (name == 'DOMINOS') {
      menuItems = [
        const MenuItemCard(
          name: 'Pizza',
          image: 'images/pizza.jpg',
          description: 'Delicious pizza with various toppings.',
          price: 325,

        ),
        const MenuItemCard(
          name: 'Pasta',
          image: 'images/pasta.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,

        ),
        const MenuItemCard(
          name: 'Spaghetti',
          image: 'images/spaghetti.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,

        ),
      ];
    }
    if (name == 'KFC') {
      menuItems = [
        const MenuItemCard(
          name: 'Pizza',
          image: 'images/pizza.jpg',
          description: 'Delicious pizza with various toppings.',
          price: 325,

        ),
        const MenuItemCard(
          name: 'Pasta',
          image: 'images/pasta.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,

        ),
        const MenuItemCard(
          name: 'Spaghetti',
          image: 'images/spaghetti.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,

        ),
      ];
    }
    else if (name == 'KACCHI VAI') {
      menuItems = [
        const MenuItemCard(
          name: 'বাসমতি কাচ্চি',
          image: 'images/busmotiKacchi.jpeg',
          description: 'Juicy burger with cheese and veggies.',
          price: 325,

        ),
        const MenuItemCard(
          name: 'Sandwich',
          image: 'images/sandwich.jpg',
          description: 'Fresh and tasty sandwich options.',
          price: 325,

        ),
        const MenuItemCard(
          name: 'Tomato Pasta',
          image: 'images/red_pasta.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,

        ),
      ];
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: []),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.comment), // Comment box button
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommentPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MenuList(menuItems: menuItems),
          ),
        ],
      ),
    );

  }
}



class MenuItemCard extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final double price;


  const MenuItemCard({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.price,

  });

  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          widget.image,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Text(widget.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.description),
            Text('price: ${widget.price.toStringAsFixed(2)} TK'),
            const SizedBox(height: 22),
            Row(
              children: [
                Text('Quantity: $quantity'),
                const SizedBox(width: 2),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 2),
                ElevatedButton(
                  onPressed: () {
                    if (quantity > 0) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Filter out items with quantity 0
    List<CartItem> nonZeroQuantityItems =
    cartItems.where((item) => item.quantity > 0).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: nonZeroQuantityItems.isEmpty
          ? const Center(
        child: Text('Cart is empty.'),
      )
          : ListView.builder(
        itemCount: nonZeroQuantityItems.length,
        itemBuilder: (context, index) {
          var cartItem = nonZeroQuantityItems[index];
          return ListTile(
            leading: Image.asset(
              cartItem.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(cartItem.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price: ${cartItem.price.toStringAsFixed(2)} TK'),
                Text('Restaurant: ${cartItem.restaurantName}'),
                Text('Quantity: ${cartItem.quantity}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}


class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();
  final List<Comment> _comments = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: const Text('Leave a Comment',),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                var comment = _comments[index];
                return ListTile(
                  title: Text(comment.username),
                  subtitle: Text(comment.comment),
                );
              },
            ),
          ),
          Container(
            color: Colors.orange,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(labelText: 'Your Comment'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    String commentText = _commentController.text.trim();
                    if (commentText.isNotEmpty) {
                      setState(() {
                        _comments.add(Comment(username: 'Lamisa', comment: commentText));
                        _commentController.clear();
                      });
                    }
                  },
                  child: const Text('Comment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


