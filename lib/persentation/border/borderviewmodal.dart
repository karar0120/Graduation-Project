import 'dart:async';

import 'package:advanced/domain/modal.dart';
import 'package:advanced/persentation/base/viewmodal.dart';
import 'package:advanced/persentation/resource/Stringmanger.dart';
import 'package:advanced/persentation/resource/imageManger.dart';

class Borderviewmodal extends BaseViewModel with Borderviewmodaloutput ,Borderviewmodalinput{
  final StreamController _streamController=StreamController<SlideViewObject>();
  int _currentindex = 0;
  late final List<SliderObject>_list;
  @override
  void dispose() {
   _streamController.close();
  }

  @override
  void start() {
    _list=_Getobject();
    _postviewdata();
  }

  @override
  void TheoterWigth(int index) {
    _currentindex=index;
    _postviewdata();
  }

  @override
  int gotoNext() {
    int _gotoNext = _currentindex++;
    if (_gotoNext >=_list.length) {
      _currentindex = 0;
    }
    //_postviewdata();
    return _currentindex;
  }

  @override
  int gotoPervoues() {
    int _gotopervoues = _currentindex--;
    if (_gotopervoues == -1) {
      _currentindex = _list.length - 1;
    }
    //_postviewdata();
    return _currentindex;
  }


  @override
  // TODO: implement inputbordeviewmodal
  Sink get inputbordeviewmodal => _streamController.sink;

  @override
  // TODO: implement outputborderviewmodal
  Stream<SlideViewObject> get outputborderviewmodal => _streamController.stream.map((sliderviewmodal) =>sliderviewmodal);

  List<SliderObject> _Getobject() =>
      [

        SliderObject(
            StringManger.onBoardingTitle_1,
            StringManger.onBoardingSubTitle1,
            StringImage.onboarding_logo1),

        SliderObject(
            StringManger.onBoardingTitle_2,
            StringManger.onBoardingSubTitle2,
            StringImage.onboarding_logo2),

        SliderObject(
            StringManger.onBoardingTitle_3,
            StringManger.onBoardingSubTitle3,
            StringImage.onboarding_logo3),

        SliderObject(
            StringManger.onBoardingTitle_4,
            StringManger.onBoardingSubTitle4,
            StringImage.onboarding_logo4),
      ];
  _postviewdata() {
    inputbordeviewmodal.add(SlideViewObject(_list[_currentindex],_list.length , _currentindex));
  }

}




// ignore: non_constant_identifier_names
abstract class Borderviewmodalinput{
  void gotoNext();

  void gotoPervoues();

  void TheoterWigth(int index);
  Sink get inputbordeviewmodal;
}


abstract class Borderviewmodaloutput{
   Stream<SlideViewObject>get outputborderviewmodal;
}


class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

