import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommonItemListCard extends StatelessWidget {
  final String imageUrl;
  final String foodName;
  final String restaurantName;
  final String price;
  final void Function()? onFavouriteIconPressed;
  bool isFavourite;
  CommonItemListCard({
    super.key,
    required this.imageUrl,
    required this.foodName,
    required this.restaurantName,
    required this.price,
    this.onFavouriteIconPressed,
    required this.isFavourite,
  });

  bool isFavouriteIconPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  blurRadius: 3,
                  offset: Offset(2, 2)),
            ]),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "In $restaurantName",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Price: Rs.$price",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: onFavouriteIconPressed,
              icon: Icon(
                Icons.favorite,
                color: isFavourite ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// chatgpt code
// import 'package:flutter/material.dart';

// class CommonItemListCard extends StatelessWidget {
//   final String imageUrl;
//   final String foodName;
//   final String restaurantName;
//   final String price;
//   final void Function()? onFavouriteIconPressed;
//   bool? isFavourite = false;

//   CommonItemListCard({
//     super.key,
//     required this.imageUrl,
//     required this.foodName,
//     required this.restaurantName,
//     required this.price,
//     this.onFavouriteIconPressed,
//     this.isFavourite,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Container(
//         height: 120,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.red.withOpacity(0.5),
//                   blurRadius: 3,
//                   offset: Offset(2, 2)),
//             ]),
//         padding: EdgeInsets.all(10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.network(
//                 imageUrl,
//                 height: 100,
//                 width: 120,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(top: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     foodName,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   Text(
//                     "In $restaurantName",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   Text(
//                     "Price: Rs.$price",
//                     style: TextStyle(fontSize: 20),
//                   )
//                 ],
//               ),
//             ),
//             IconButton(
//               onPressed: onFavouriteIconPressed,
//               icon: Icon(
//                 Icons.favorite,
//                 color: isFavourite! ? Colors.red : Colors.grey.withOpacity(0.5),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
