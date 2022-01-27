import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_higher_lower/ui/ImageWidget.dart';
import 'package:flutter_higher_lower/ui/QuestionWidget.dart';

import 'CenterWidget.dart';
import 'CustomStyles.dart';
import 'ResultWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late bool change;
  late bool disappear;
  late double height;
  late AnimationController animationController;
  late double scaleValue;
  late Animation valueAnimation;
  late int timeBetweenTransitions;

  late String question;
  late String questionImage;
  late String optionImage;
  late String option;
  late String searches;
  late int result;
  late int inputIndex;
  late int randomIndex;
  List<String> options = [
    'Amazon',
    'Flipkart',
    'Uber',
    'Ola',
    'Redmi',
    'Emma Watson',
    'Facebook',
    'SEO',
    'Taxi',
    'PewDiePie',
    'B99',
    'Friends',
  ];

  List<String> optionImages = [
    'http://media.corporate-ir.net/media_files/IROL/17/176060/Oct18/Amazon%20logo.PNG',
    'https://image.cnbcfm.com/api/v1/image/106909380-1626086056746-gettyimages-1233327882-PGONCHAR_W6761.jpeg?v=1626086849',
    'https://i.insider.com/5d6e96162e22af1e87005ad9?width=1136&format=jpeg',
    'https://media-exp1.licdn.com/dms/image/C561BAQFx6697JNdh_Q/company-background_10000/0/1584506982323?e=2159024400&v=beta&t=qcmE-2my5aUjKgs2RUd4D814h_KIPBLm-BlHSRK1HCs',
    'https://trak.in/wp-content/uploads/2018/06/Xiaomi-Company-1280x720.jpg',
    'https://static.wixstatic.com/media/ea883b_9f64e50b22fe47c4af0f50ed65e6729f~mv2.jpg/v1/fill/w_1000,h_750,al_c,q_90,usm_0.66_1.00_0.01/ea883b_9f64e50b22fe47c4af0f50ed65e6729f~mv2.jpg',
    'https://images.indianexpress.com/2021/10/2021-10-25T110020Z_1637749082_RC2ZGQ9D62ZD_RTRMADP_3_FACEBOOK-DOCUMENTS-GLOBAL.jpg',
    'https://www.thebalancesmb.com/thmb/3tO0sKMbIm2FFg7Vc6dnuGwgVV4=/4952x2991/filters:fill(auto,1)/seo-search-engine-optimization-concept-644911062-5ae3efdd04d1cf003cf95b58.jpg',
    'https://media.istockphoto.com/photos/taxi-picture-id519870714?k=20&m=519870714&s=612x612&w=0&h=vpuJQ1Uq72ebwJAXQXLPtGYDo1R0dlO_oxhgqlY9ZcQ=',
    'https://i.insider.com/5ca1d6ccc6cc50118c102b34?width=700',
    'https://cinedope.com/wp-content/uploads/2021/02/Brooklyn-Nine-Nine-1-1.jpg',
    'https://cdn.wionews.com/sites/default/files/styles/story_page/public/2018/12/04/76764-new-37.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    change = false;
    scaleValue = 1.0;
    timeBetweenTransitions = 1;
    inputIndex = 1;
    question = 'FedEx';
    searches = "7,48,000";
    questionImage =
        'https://newsroom.fedex.com/wp-content/uploads/2021/07/FedEx_Pic-1.jpg';
    result = Random().nextInt(500000);
    randomIndex = Random().nextInt(options.length);
    option = options[randomIndex];
    optionImage = optionImages[randomIndex];

    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: timeBetweenTransitions));
    valueAnimation = IntTween(begin: 0, end: 50).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    height = MediaQuery.of(context).size.height - padding.top - padding.bottom;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black26,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ListView.builder(
            controller: _scrollController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SizedBox(
                height: height / 2,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    (index == inputIndex)
                        ? CustomImage(image: optionImage, height: height)
                        : CustomImage(image: questionImage, height: height),
                    _mainLayout(index)
                  ],
                ),
              );
            },
            itemCount: 100,
          ),
          CenterIcon(scaleValue: scaleValue, change: change),
        ],
      ),
    ));
  }

  Widget _mainLayout(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        (index == inputIndex)
            ? _optionLayout(index)
            : Question(
                question: question,
                searches: searches,
              ),
      ],
    );
  }

  Widget _optionLayout(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            '"$option"',
            style: primaryTitle,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'has',
            style: description,
          ),
        ),
        change ? Result(result: result) : _buttonLayout(index),
        Text(
          'searches than $question',
          style: description,
        )
      ],
    );
  }

  Widget _buttonLayout(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          _inputButton(index, 'Higher'),
          _inputButton(index, 'Lower'),
        ],
      ),
    );
  }

  Widget _inputButton(int index, String title) {
    return SizedBox(
      width: 250.0,
      child: ElevatedButton(
        onPressed: () {
          _validateInput(index);
        },
        child: Text(title),
        style: ElevatedButton.styleFrom(
            shape: buttonShape,
            minimumSize: const Size(0.0, 40.0),
            primary: (title == 'Higher') ? Colors.green : Colors.red),
      ),
    );
  }

  _validateInput(int index) {
    //UI change for correct/incorrect answer
    setState(() {
      //Logic part
      disappear = true;
      change = true;
    });
    //Scaling to 0
    Future.delayed(Duration(seconds: timeBetweenTransitions), () {
      setState(() {
        scaleValue = 0.0;
      });
    });
    //Next Image
    Future.delayed(Duration(seconds: timeBetweenTransitions + 1), () {
      _scrollController.animateTo(
        index * (height / 2),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn,
      );
      setState(() {
        disappear = false;
        change = false;
        inputIndex = inputIndex + 1;
        question = option;
        searches = result.toString();
        questionImage = optionImage;

        result = Random().nextInt(500000);
        randomIndex = Random().nextInt(options.length);
        option = options[randomIndex];
        optionImage = optionImages[randomIndex];
      });
      //Scaling back to 1
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          scaleValue = 1.0;
        });
      });
    });
  }
}
