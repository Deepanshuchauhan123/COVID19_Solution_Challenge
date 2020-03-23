import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
 
class CarouselDemo extends StatefulWidget {
  CarouselDemo() : super();
 
  final String title = "Carousel Demo";
 
  @override
  CarouselDemoState createState() => CarouselDemoState();
}
 
class CarouselDemoState extends State<CarouselDemo> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
   'https://navbharattimes.indiatimes.com/feeds/photo.cms?photoid=73515884',
   'https://www.bcpharmacists.org/sites/default/files/2019coronavirusposterphsa.PNG',
   'https://www.health.gov.au/sites/default/files/images/publications/2020/03/coronavirus-covid-19-stop-the-spread_0.png',
   'https://backpanel.kemlu.go.id/PublishingImages/Korona%202%20.jpg',
   'https://images-na.ssl-images-amazon.com/images/I/81t0BuNsKFL._AC_SY741_.jpg',
   'https://www.tameside.gov.uk/getmedia/74774340-548a-4f33-9eda-ca8dc8103812/hand-hygiene-poster?width=450&height=636',
   'https://www.newcrosshealthcare.com/sites/default/files/styles/max_650_wide/public/inline-images/CV300%20%281%29.jpg?itok=W3p_bQQS'
  ];
 
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        color: Colors.blueAccent,
      height: MediaQuery.of(context).size.height,
      width:  MediaQuery.of(context).size.height,
        child: Column(
             
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            carouselSlider = CarouselSlider(
              height: 400.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.redAccent : Colors.green,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 20.0,
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: goToPrevious,
                  child: Text("<"),
                
                ),
                OutlineButton(
                  onPressed: goToNext,
                  child: Text(">"),
                  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
 
  goToPrevious() {
    carouselSlider.previousPage(
    
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
 
  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}