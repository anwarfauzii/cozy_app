import 'package:cozy_app/models/city.dart';
import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/models/tips.dart';
import 'package:cozy_app/providers/space_provider.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/bottom_navbar_item.dart';
import 'package:cozy_app/widgets/city_card.dart';
import 'package:cozy_app/widgets/space_card.dart';
import 'package:cozy_app/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
        backgroundColor: whitecolor,
        body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
//NOTE: Explore Now
              SizedBox(height: edge),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Explore Now',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Mencari Kosan yang cozy',
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 30),
//NOTE: Popular Cities
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Popular Cities',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 24),
                    CityCard(City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/images/city1.png')),
                    SizedBox(width: 20),
                    CityCard(
                      City(
                          id: 2,
                          name: 'Bandung',
                          imageUrl: 'assets/images/city2.png',
                          isPopular: true),
                    ),
                    SizedBox(width: 20),
                    CityCard(City(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'assets/images/city3.png')),
                    SizedBox(width: 24),
                  ],
                ),
              ),
              SizedBox(height: 30),
//NOTE: Recomended Space
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Recomended Space',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: FutureBuilder(
                  future: spaceProvider.getRecomendedSpace(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;
                      return Column(
                        children: data.map((item) => SpaceCard(item)).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
//NOTE: Tips & Guidance
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Tips & Guidance',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: Column(
                  children: [
                    TipsCard(Tips(
                        id: 1,
                        imageUrl: 'assets/images/cityguide.png',
                        name: 'City Guidelines',
                        update: '20 Apr')),
                    SizedBox(
                      height: 20,
                    ),
                    TipsCard(Tips(
                        id: 2,
                        imageUrl: 'assets/images/jakartafairship.png',
                        name: 'Jakarta Fairship',
                        update: '11 Des'))
                  ],
                ),
              ),
              SizedBox(height: 60 + edge),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 65,
          width: MediaQuery.of(context).size.width - (2 * edge),
          margin: EdgeInsets.symmetric(horizontal: edge),
          decoration: BoxDecoration(
              color: Color(0xffF6F7F8),
              borderRadius: BorderRadius.circular(23)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavbarItem(
                imageUrl: 'assets/images/home.png',
                isActive: true,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/mail.png',
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/card.png',
                isActive: false,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/love.png',
                isActive: false,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
