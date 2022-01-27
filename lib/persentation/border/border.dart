
import 'package:advanced/domain/modal.dart';
import 'package:advanced/persentation/login/login.dart';
import 'package:advanced/persentation/register/register.dart';
import 'package:advanced/persentation/resource/Color.dart';
import 'package:advanced/persentation/resource/Stringmanger.dart';
import 'package:advanced/persentation/resource/imageManger.dart';
import 'package:advanced/persentation/resource/route_manger.dart';
import 'package:advanced/persentation/resource/valuemanger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'borderviewmodal.dart';

class border extends StatefulWidget {
  @override
  _borderState createState() => _borderState();
}

class _borderState extends State<border> {

  PageController _pageController = PageController(initialPage: 0);
  Borderviewmodal _borderviewmodal=Borderviewmodal();

  _bain(){
    _borderviewmodal.start();
  }
  int currentindex = 0;

  @override
  void initState() {
   _bain();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SlideViewObject>(
        stream: _borderviewmodal.outputborderviewmodal,
        builder: (context,snapshots)=>
    _getcontant(snapshots.data));
  }

  Widget _getcontant(SlideViewObject? slideViewObject){
    if (slideViewObject==null){
      return Container();
    }
    else{
      return Scaffold(
        backgroundColor: ColorManger.wight,
        appBar: AppBar(
          backgroundColor: ColorManger.wight,
          elevation: SizeApp.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
              statusBarColor: ColorManger.wight
          ),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: slideViewObject.numOfSlides,
            onPageChanged: (index) {

              _borderviewmodal.TheoterWigth(index);
            },
            itemBuilder: (context, index) {
              return onBordingScrean(slideViewObject.sliderObject);
            }),
        bottomSheet: Container(
          color: ColorManger.wight,
          height: SizeApp.s110,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context,routeManger.loginRoute);
                  },
                  child:Text(StringManger.skip,
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.end,),
                ),
              ),
              _indecator(slideViewObject),
            ],
          ),
        ),
      );
    }
  }
  Widget _indecator(SlideViewObject? slideViewObject) {
    return Container(
      color: ColorManger.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(paddingApp.p20),
            child: InkWell(
              onTap: () {
                _pageController.animateToPage(_borderviewmodal.gotoPervoues(),
                    duration: Duration(milliseconds: Durationconst.s300),
                    curve: Curves.bounceInOut);
              },
              child: SizedBox(
                width: SizeApp.s20,
                height: SizeApp.s20,
                child: SvgPicture.asset(StringImage.left_arrow_ic),
              ),
            ),
          ),
          Row(
            children: [
              for(int i = 0; i <slideViewObject!.numOfSlides; i++)
                Padding(padding: const EdgeInsets.all(paddingApp.p8),
                  child: _TheoterWigth(i,slideViewObject.currentIndex),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(paddingApp.p20),
            child: InkWell(
              onTap: () {
                _pageController.animateToPage(_borderviewmodal.gotoNext(),
                    duration: Duration(milliseconds:Durationconst.s300 ),
                    curve: Curves.bounceInOut);
              },
              child: SizedBox(
                width: SizeApp.s20,
                height: SizeApp.s20,
                child: SvgPicture.asset(StringImage.right_arrow_ic),
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget _TheoterWigth(int index,int _currentindex) {
    if (index ==_currentindex ) {
      return SvgPicture.asset(StringImage.hollow_cirlce_ic);
    }
    else {
      return SvgPicture.asset(StringImage.solid_circle_ic);
    }
  }
  @override
  void dispose() {
    _borderviewmodal.dispose();
    super.dispose();
  }
}
class onBordingScrean extends StatelessWidget {
  SliderObject _sliderObject;
  onBordingScrean(this._sliderObject,{ Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
              height:SizeApp.s40),
          Padding(
            padding: const EdgeInsets.all(paddingApp.p8),
            child: Text(_sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(paddingApp.p8),
            child: Text(_sliderObject.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const SizedBox(
            height:SizeApp.s60,
          ),
          SvgPicture.asset(_sliderObject.image),
        ],
      );
  }
}


