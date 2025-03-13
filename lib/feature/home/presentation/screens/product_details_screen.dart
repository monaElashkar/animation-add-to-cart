import 'package:bluezone_task/feature/home/data/model/product_models.dart';
import 'package:bluezone_task/feature/home/presentation/widgets/product_details_widgets/add_to_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';
import '../widgets/product_details_widgets/product_info_widget.dart';
import '../widgets/product_details_widgets/product_variants_widget.dart';

class Variant {
  int? id;
  String? name;
  String? selectedVariant;

  Variant({this.id, this.name, this.selectedVariant});

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    selectedVariant = json['selectedVariant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['selectedVariant'] = this.selectedVariant;
    return data;
  }
}

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Variant> selectedVariants = [];

  void _addToCart() {
    if (widget.product.variants != null) {
      String missingSelection = "";
      int size =
          widget.product.variants == null ? 0 : widget.product.variants!.length;
      for (int i = 0; i < size; i++) {
        if (selectedVariants.isNotEmpty) {
          String? massage;
          for (int j = 0; j < selectedVariants.length; j++) {
            if (selectedVariants[j].id == widget.product.variants![i].id) {
              massage = null;
              break;
            } else {
              massage = "${widget.product.variants![i].name} ";
            }
          }
          if (massage != null) {
            missingSelection +=
                (missingSelection.isNotEmpty ? " و " : "") + massage;
          }
        } else {
          missingSelection += (missingSelection.isNotEmpty ? " و " : "") +
              "${widget.product.variants![i].name} ";
        }
      }
      if (missingSelection.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                "يرجى اختيار $missingSelection قبل إضافة المنتج إلى السلة!"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        Provider.of<CartProvider>(context, listen: false)
          ..addToCart(widget.product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${widget.product.name} تمت إضافته إلى السلة!"),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      Provider.of<CartProvider>(context, listen: false)
        ..addToCart(widget.product);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${widget.product.name} تمت إضافته إلى السلة!"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > 600;
          return isLandscape
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: _buildLandscapeLayout())
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: _buildPortraitLayout(),
                );
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(widget.product.image,
              width: double.infinity, height: 250, fit: BoxFit.fill),
          SizedBox(height: 16),
          ProductInfoWidget(
            product: widget.product,
          ),
          widget.product.variants != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      widget.product.variants!.asMap().entries.map((entry) {
                    final int index = entry.key;
                    // final Variants variant = entry.value;

                    return ProductVariantsWidget(
                      onVariantSelected: (v) {
                        if (selectedVariants.any((item) =>
                            item.id == widget.product.variants![index].id)) {
                          selectedVariants.removeWhere((item) =>
                              item.id == widget.product.variants![index].id);
                          selectedVariants.remove(Variant(
                            id: widget.product.variants![index].id,
                            name: widget.product.variants![index].name!,
                            selectedVariant:
                                widget.product.variants![index].attributes![0],
                          ));
                          selectedVariants.add(Variant(
                            id: widget.product.variants![index].id,
                            name: widget.product.variants![index].name!,
                            selectedVariant:
                                widget.product.variants![index].attributes![0],
                          ));
                        } else {
                          selectedVariants.add(Variant(
                            id: widget.product.variants![index].id,
                            name: widget.product.variants![index].name!,
                            selectedVariant:
                                widget.product.variants![index].attributes![0],
                          ));
                        }
                      },
                      variants: widget.product.variants![index].attributes!,
                      name: widget.product.variants![index].name!,
                    );
                  }).toList(),
                )
              : SizedBox.shrink(),
          SizedBox(height: 20),
          AddToCartButtonWidget(
            onPressed: _addToCart,
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Image.asset(
            widget.product.image,
            fit: BoxFit.fill,
            height: double.infinity,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfoWidget(
                  product: widget.product,
                ),
                // ListView.builder(
                //   itemCount: widget.product.variants == null
                //       ? 0
                //       : widget.product.variants!.length,
                //   itemBuilder: (context, index) {
                //     return ProductVariantsWidget(
                //       onVariantSelected: (v) {
                //         if (selectedVariants.any((item) =>
                //             item.id == widget.product.variants![index].id!)) {
                //           selectedVariants.removeWhere((item) =>
                //               item.id == widget.product.variants![index].id!);
                //           selectedVariants.remove(Variant(
                //             id: widget.product.variants![index].id!,
                //             name: widget.product.variants![index].name!,
                //             selectedVariant:
                //                 widget.product.variants![index].attributes![0],
                //           ));
                //           selectedVariants.add(Variant(
                //             id: widget.product.variants![index].id!,
                //             name: widget.product.variants![index].name!,
                //             selectedVariant:
                //                 widget.product.variants![index].attributes![0],
                //           ));
                //         } else {
                //           selectedVariants.add(Variant(
                //             id: widget.product.variants![index].id!,
                //             name: widget.product.variants![index].name!,
                //             selectedVariant:
                //                 widget.product.variants![index].attributes![0],
                //           ));
                //         }
                //       },
                //       variants: widget.product.variants![index].attributes!,
                //       name: widget.product.variants![index].name!,
                //     );
                //   },
                // ),

                SizedBox(height: 20),
                AddToCartButtonWidget(
                  onPressed: _addToCart,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
