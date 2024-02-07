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
  final double price; // Add this line

  CartItem({
    required this.name,
    required this.image,
    required this.restaurantName,
    required this.quantity,
    required this.price,
  });
}



class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
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
        ],
      ),
      body: ListView(
        children: [
          RestaurantCard(name: 'CHILLOX', image: 'images/chillox.png', time: '25min', ratings: 120),
          RestaurantCard(name: 'KUDOS', image: 'images/kudos.png', time: '40min', ratings: 100),
          RestaurantCard(name: 'DOMINOS', image: 'images/Dominos.png', time: '30min', ratings: 250),
          RestaurantCard(name: 'KFC', image: 'images/KFC.png', time: '60min', ratings: 50),
          RestaurantCard(name: 'KACCHI VAI', image: 'images/kacchiVai.jpg', time: '1hour', ratings: 200),
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

  RestaurantCard({
    Key? key,
    required this.name,
    required this.image,
    required this.time,
    required this.ratings,
  }) : super(key: key);

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

  MenuList({required this.menuItems, required Null Function(MenuItemCard menuItem) onAddToCart});

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
        MenuItemCard(
          name: 'Pizza',
          image: 'images/pizza.jpg',
          description: 'Delicious pizza with various toppings.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),

        MenuItemCard(
          name: 'Pasta',
          image: 'images/pasta.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },

        ),
        MenuItemCard(
          name: 'Spaghetti',
          image: 'images/spaghetti.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        // Add more MenuItemCard instances as needed
      ];
    } else if (name == 'KUDOS') {
      menuItems = [
        MenuItemCard(
          name: 'Burger',
          image: 'images/burger.jpg',
          description: 'Juicy burger with cheese and veggies.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        MenuItemCard(
          name: 'Sandwich',
          image: 'images/sandwich.jpg',
          description: 'Fresh and tasty sandwich options.',
          price: 325,
        ),
        MenuItemCard(
          name: 'Tomato Pasta',
          image: 'images/red_pasta.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        // Add more MenuItemCard instances as needed
      ];
    } else if (name == 'DOMINOS') {
      menuItems = [
        MenuItemCard(
          name: 'Pizza',
          image: 'images/pizza.jpg',
          description: 'Delicious pizza with various toppings.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        MenuItemCard(
          name: 'Pasta',
          image: 'images/pasta.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        MenuItemCard(
          name: 'Spaghetti',
          image: 'images/spaghetti.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        // Add more MenuItemCard instances as needed
      ];
    } else if (name == 'KFC') {
      menuItems = [
        MenuItemCard(
          name: 'Pizza',
          image: 'images/pizza.jpg',
          description: 'Delicious pizza with various toppings.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        MenuItemCard(
          name: 'Pasta',
          image: 'images/pasta.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        MenuItemCard(
          name: 'Spaghetti',
          image: 'images/spaghetti.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        // Add more MenuItemCard instances as needed
      ];
    } else if (name == 'KACCHI VAI') {
      menuItems = [
        MenuItemCard(
          name: 'বাসমতি কাচ্চি',
          image: 'images/busmotiKacchi.jpeg',
          description: 'Juicy burger with cheese and veggies.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        MenuItemCard(
          name: 'Sandwich',
          image: 'images/sandwich.jpg',
          description: 'Fresh and tasty sandwich options.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        MenuItemCard(
          name: 'Tomato Pasta',
          image: 'images/red_pasta.jpg',
          description: 'Classic pasta with your choice of sauce.',
          price: 325,
          onAddToCart: () {
            // Add the functionality you want when the "Add to Cart" button is pressed
            print('Added to Cart!');
          },
        ),
        // Add more MenuItemCard instances as needed
      ];
    }



    // Initialize cartItems list
    List<CartItem> cartItems = [];

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
                  builder: (context) => CartPage(cartItems: cartItems),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.comment),
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
            child: MenuList(
              menuItems: menuItems,
              onAddToCart: (MenuItemCard menuItem) {
                // Add the menu item to the cart
                cartItems.add(
                  CartItem(
                    name: menuItem.name,
                    image: menuItem.image,
                    restaurantName: name,
                    price: menuItem.price,
                    quantity: menuItem.quantity,
                  ),
                );
                // Update the cart page with the new cart items
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: cartItems),
                  ),
                );
              },
            ),
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
  final Function? onAddToCart; // Change this line
  int quantity = 0;

  MenuItemCard({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    this.onAddToCart,
  });


  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
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
                Text('Quantity: ${widget.quantity}'),
                const SizedBox(width: 2),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.quantity++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 2),
                ElevatedButton(
                  onPressed: () {
                    if (widget.quantity > 0) {
                      setState(() {
                        widget.quantity--;
                      });
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            if (widget.onAddToCart != null)
              ElevatedButton(
                onPressed: () {
                  widget.onAddToCart!(widget.name, widget.price, widget.quantity); // Change this line
                },
                child: const Text('Add to Cart'),
              ),
          ],
        ),
      ),
    );
  }
}



class CartPage extends StatefulWidget {
  final List<CartItem>? cartItems;

  CartPage({this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<CartItem> nonZeroQuantityItems =
        widget.cartItems?.where((item) => item.quantity > 0).toList() ?? [];

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
        title: const Text('Leave a Comment'),
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
