import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_higher_lower/widgets/QuestionWidget.dart';
import 'package:flutter_higher_lower/widgets/image_widget.dart';
import 'package:flutter_higher_lower/widgets/input_widget.dart';
import 'package:flutter_higher_lower/widgets/option_widget.dart';

import '../constants/styles.dart';
import '../model/model.dart';
import '../widgets/center_widget.dart';
import '../widgets/result_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late double height;
  late bool goNext;
  late double scaleValue;
  late List<HLModel> inputList;
  late HLModel question;
  late HLModel answer;
  late int inputIndex;
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
    goNext = false;
    scaleValue = 1.0;
    inputIndex = 1;

    inputList = List<HLModel>.generate(
        optionImages.length,
        (index) => HLModel(
            question: options[index],
            image: optionImages[index],
            searches: Random().nextInt(50000)));

    question = inputList[0];
    answer = inputList[inputIndex];
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
                        ? CustomImage(image: answer.image, height: height)
                        : CustomImage(image: question.image, height: height),
                    _mainLayout(index)
                  ],
                ),
              );
            },
            itemCount: 100,
          ),
          CenterIcon(scaleValue: scaleValue, change: goNext),
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
            ? OptionWidget(
                goNext: goNext,
                answer: answer,
                question: question,
                inputLayout: _buttonLayout(index),
              )
            : Question(
                question: question.question,
                searches: question.searches,
              ),
      ],
    );
  }

  Widget _buttonLayout(index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          InputWidget(
            validateInput: () {
              _validateInput(index);
            },
            title: 'Higher',
          ),
          InputWidget(
            validateInput: () {
              _validateInput(index);
            },
            title: 'Lower',
          ),
        ],
      ),
    );
  }

 
  _validateInput(index) {
    //UI change for correct/incorrect answer
    setState(() {
      //Logic part
      goNext = true;
    });
    //Scaling to 0
    Future.delayed(const Duration(seconds: timeBetweenTransitions), () {
      setState(() {
        scaleValue = 0.0;
      });
    });
    //Next Image
    Future.delayed(const Duration(seconds: timeBetweenTransitions + 1), () {
      _scrollController.animateTo(
        index * (height / 2),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn,
      );
      setState(() {
        goNext = false;
        inputIndex = inputIndex + 1;
        question = answer;
        answer = inputList[inputIndex];
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
