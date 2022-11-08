import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeuBox extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final Color? color;
  const NeuBox({Key? key, required this.child, this.padding, this.margin, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        padding: padding ?? EdgeInsets.zero,
        margin: margin ?? EdgeInsets.zero,
        style: NeumorphicStyle(
          //shadowLightColor: Colors.orange,
            shadowDarkColor: Colors.orange,
            // shadowDarkColorEmboss: Colors.orange,
            shape: NeumorphicShape.concave,
            boxShape:
            NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 4,
            lightSource: LightSource.topLeft,
            color: color??Colors.white),
        child: child
    );
  }
}

const apiKey="72dd6b8e4762414c997e61949e47d969";