import 'package:flutter/material.dart';
import 'package:flutter_higher_lower/ui/MiddleIcon.dart';

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
  late double width;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    change = false;
    disappear = false;
    animationController = AnimationController(
        vsync: this,  duration: Duration(seconds: 7));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    var padding = MediaQuery.of(context).padding;
    height = MediaQuery.of(context).size.height - padding.top - padding.bottom;

    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          _mainList(),
          AnimatedContainer(
            duration: Duration(seconds: 5),
            curve: Curves.fastOutSlowIn,
            child: change ? _checkIcon() : _middleIcon(),
          ),
        ],
      ),
    ));
  }

  Widget _middleIcon() {
    return CircleAvatar(
      maxRadius: 30.0,
      backgroundColor: Colors.white,
      child: Text(
        'VS',
        style: TextStyle(
            color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _checkIcon() {
    return CircleAvatar(
      maxRadius: 30.0,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }

  _moveDown(int index) {
    setState(() {
      change = true;
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        disappear = true;
        change = false;
      });
      _scrollController.animateTo(
        index * (height / 2),
        duration: Duration(milliseconds: 1500),
        curve: Curves.fastOutSlowIn,
      );
    });
    setState(() {
      disappear = false;
    });
  }

  Widget _mainList() {
    return ListView.builder(
      controller: _scrollController,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox(
          height: height / 2,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: width,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1599420186946-7b6fb4e297f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _moveDown(index);
                      },
                      child: Text('Higher')),
                  ElevatedButton(
                      onPressed: () {
                        _moveDown(index);
                      },
                      child: Text('Lower')),
                ],
              )
            ],
          ),
        );
      },
      itemCount: 10,
    );
  }
}
