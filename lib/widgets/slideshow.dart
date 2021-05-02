import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool indicatorUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  const Slideshow(
      {@required this.slides,
      this.indicatorUp = false,
      this.secondaryColor = Colors.grey,
      this.primaryColor = Colors.blue,
      this.primaryBullet = 12.0,
      this.secondaryBullet = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _SlideshowModel(),
        child: SafeArea(
          child: Center(
            child: Builder(builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor =
                  this.primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor =
                  this.secondaryColor;
              Provider.of<_SlideshowModel>(context).primaryBullet =
                  this.primaryBullet;
              Provider.of<_SlideshowModel>(context).secondaryBullet =
                  this.secondaryBullet;

              return _CreateSlidingStructure(
                  indicatorUp: indicatorUp, slides: slides);
            }),
          ),
        ));
  }
}

class _CreateSlidingStructure extends StatelessWidget {
  const _CreateSlidingStructure({
    Key key,
    @required this.indicatorUp,
    @required this.slides,
  }) : super(key: key);

  final bool indicatorUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.indicatorUp)
          _Dots(
            this.slides.length,
          ),
        Expanded(child: _Sliders(this.slides)),
        if (!this.indicatorUp) _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlider;

  const _Dots(this.totalSlider);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlider, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    double size = 0;
    Color color;
    if (slideshowModel.currentPage >= index - 0.5 &&
        slideshowModel.currentPage < index + 0.5) {
      size = slideshowModel.primaryBullet;
      color = slideshowModel.primaryColor;
    } else {
      size = slideshowModel.secondaryBullet;
      color = slideshowModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Sliders extends StatefulWidget {
  final List<Widget> slides;

  const _Sliders(this.slides);
  @override
  __SlidersState createState() => __SlidersState();
}

class __SlidersState extends State<_Sliders> {
  final pageViewController = new PageController();
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12.0;
  double _secondaryBullet = 12.0;
  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color secondaryColor) {
    this._secondaryColor = secondaryColor;
  }

  double get primaryBullet => this._primaryBullet;

  set primaryBullet(double primaryBullet) {
    this._primaryBullet = primaryBullet;
  }

  double get secondaryBullet => this._secondaryBullet;

  set secondaryBullet(double secondaryBullet) {
    this._secondaryBullet = secondaryBullet;
  }
}
