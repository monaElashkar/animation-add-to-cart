import 'package:bluezone_task/feature/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/route/app_routes.dart';
import '../../data/model/product_models.dart';
import '../provider/home_provider.dart';
import '../widgets/home_widgets/add_to_cart_animation.dart';
import '../widgets/home_widgets/product_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // We can detect the location of the cart by this  GlobalKey<CartIconKey>
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  int _cartQuantityItems = 0;
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false)..GetProductsList();
    Provider.of<HomeProvider>(context, listen: false)..getCart();
    _cartQuantityItems =
        Provider.of<HomeProvider>(context, listen: false).items.length;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<HomeProvider>(context);
    return AddToCartAnimation(
      // To send the library the location of the Cart icon
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        // You can run the animation by addToCartAnimationMethod, just pass trough the the global key of  the image as parameter
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("سلة التسوق"),
          centerTitle: false,
          actions: [
            const SizedBox(width: 16),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routers.cartScreen);
              },
              child: AddToCartIcon(
                qtdeBadge: cart.items.length.toString(),
                key: cartKey,
                icon: const Icon(Icons.shopping_cart),
                badgeOptions: const BadgeOptions(
                  active: true,
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: ListView.builder(
          itemCount: cart.products.length,
          itemBuilder: (context, index) => ProductListItem(
            onTap: () {
              Navigator.pushNamed(context, Routers.productDetailsScreen,
                  arguments: cart.products[index]);
            },
            onClick: (GlobalKey widgetKey, Product product) async {
              await runAddToCartAnimation(widgetKey);
              await cartKey.currentState!
                  .runCartAnimation((++_cartQuantityItems).toString());
              cart.addToCart(CartModel(quantity: 1, product: product));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("تمت إضافة ${product.name} إلى السلة!")),
              );
            },
            product: cart.products[index],
          ),
        ),
      ),
    );
  }
}
