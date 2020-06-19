import 'package:flutter/material.dart';

class AnimatedInput extends StatelessWidget {
  final AnimationController animationController;

  final Animation<Color> containerColorAnim;
  final Animation<double> containerOpacityAnim;
  final Animation<double> containerBorderRadiusAnim;
  final Animation<double> containerSizeAnim;

  AnimatedInput({this.animationController})
      : containerOpacityAnim = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            curve: Interval(0.7, 0.9),
            parent: animationController,
          ),
        ),
        containerSizeAnim = Tween(
          begin: 60.0,
          end: 230.0,
        ).animate(
          CurvedAnimation(
            curve: Interval(0.2, 0.3),
            parent: animationController,
          ),
        ),
        containerBorderRadiusAnim = Tween(
          begin: 0.0,
          end: 30.0,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(0.25, 0.4),
          ),
        ),
        containerColorAnim = ColorTween(
          begin: Colors.white.withOpacity(0),
          end: Colors.black12,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(0.0, 0.25),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _animate,
      animation: animationController,
    );
  }

  Widget _animate(BuildContext context, child) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: containerColorAnim.value,
        borderRadius: BorderRadius.all(
          Radius.circular(
            containerBorderRadiusAnim.value,
          ),
        ),
      ),
      margin: EdgeInsets.all(5),
      width: containerSizeAnim.value,
      child: Opacity(
        opacity: containerOpacityAnim.value,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(Icons.search),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 160,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Search...",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// padding: EdgeInsets.only(
//   left: 20,
// ),
// height: 50,
// decoration: BoxDecoration(
//   color: Color.fromRGBO(0, 0, 0, 0.1),
//   borderRadius: BorderRadius.all(
//     Radius.circular(128),
//   ),
// ),
// child: Row(
//   children: <Widget>[
//     Icon(Icons.search),
//     Container(
//       width: 260,
//       padding: EdgeInsets.only(left: 10),
//       child: TextFormField(
//         style: TextStyle(
//           color: Theme.of(context).primaryColor,
//           fontSize: 16,
//         ),
//         keyboardType: TextInputType.text,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           labelText: "Search...",
//           contentPadding: EdgeInsets.all(0),
//           isDense: true,
//           labelStyle: TextStyle(
//             color: Theme.of(context).primaryColor,
//             fontSize: 12,
//             fontWeight: FontWeight.w300,
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
