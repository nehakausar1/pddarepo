// import 'package:flutter/material.dart';

// class RoundButton extends StatelessWidget {
//   final String title;
//   final VoidCallback onTap;
//   final bool loading;

//   const RoundButton(
//       {Key? key,
//       required this.title,
//       required this.onTap,
//       this.loading = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         // width: 150,
//         height: 40,
//         decoration: BoxDecoration(
//             color: Colors.green, borderRadius: BorderRadius.circular(10)),
//         child: Center(
//           child: loading  ?  CircularProgressIndicator(
//                   strokeWidth: 3,
//                   color: Colors.white,
//                 )
//               : Text(
//                   title,
//                   style: TextStyle(color: Colors.white, fontSize: 17),
//                 ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final IconData? iconData; // New property for the icon

  const RoundButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.loading = false,
    this.iconData, // Initialize the iconData property
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Row(
                  // Add a row to display the icon and text horizontally
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (iconData != null)
                      Icon(
                        iconData,
                        color: Colors.white,
                        size: 24, // Adjust the size of the icon as needed
                      ),
                    SizedBox(
                        width: 8), // Add some spacing between icon and text
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
