<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Flutter Animated Reaction

Flutter Animated Reaction is an animated reaction overlay(Example: Facebook, LinkedIn) which can be customized using your own reaction icons(images/gifs). Wherever your reaction button is on the screen, this package helps you to pop up an animated reaction overlay at the right location on the screen with your preferred reactions icon.

[![](https://visitcount.itsvg.in/api?id=Ajoy-1704001&label=Views%20Count&color=4&icon=5&pretty=true)](https://visitcount.itsvg.in)

## Demo

![animated](https://github.com/Ajoy-1704001/flutter_animated_reaction/assets/57573642/da427168-90be-40b7-a640-c91d2ddad6c8)

## Features

* Customized reaction icon i.e. images, gifs can be added in the list
* Cool animation to display the reaction overlay
* Dragging any reaction icon generates nice animation
* In built facebook reaction icons
* Reaction sound feature

## Getting started
```dart
import 'package:flutter_animated_reaction/flutter_animated_reaction.dart';
```
## Usage

For better understanding, you can see example application.

```dart
AnimatedFlutterReaction().showOverlay(context: context,
                                      key: key,
                                      onReaction: (val){
                                         print(val);
                                      });
```
### Parameters
Parameter  | Description
------------- | -------------
Key  | Global Key used in the reaction button . It is used to find the renderBox and measure it's position.
reactions  | List of all reaction icons which you want to show in the overlay.(Image/Gifs path)
onReaction(int) | It is triggered when any of the reaction is tapped
backgroundColor | It describes overlay background color
overlaySize | It specifies overlay width
iconSize| It can set the size of reaction icons. Default size is (45,45)

## How to Contribute

1. Fork it
2. Create your feature branch (git checkout -b new-feature)
3. Commit your changes (git commit -m 'Add some feature')
4. Push to the branch (git push origin new-feature)
5. Create new Pull Request
