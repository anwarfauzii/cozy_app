import 'package:cozy_app/pages/error_page.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/facility_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LaunchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/thumbnail.png',
                width: MediaQuery.of(context).size.width,
                height: 358,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(height: 328),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: whitecolor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kuretakeso Hott',
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  SizedBox(height: 2),
                                  Text.rich(
                                    TextSpan(
                                      text: '\$52',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: ' / month',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Icon_star_solid.png',
                                    width: 20,
                                  ),
                                  SizedBox(width: 2),
                                  Image.asset(
                                    'assets/images/Icon_star_solid.png',
                                    width: 20,
                                  ),
                                  SizedBox(width: 2),
                                  Image.asset(
                                    'assets/images/Icon_star_solid.png',
                                    width: 20,
                                  ),
                                  SizedBox(width: 2),
                                  Image.asset(
                                    'assets/images/Icon_star_solid.png',
                                    width: 20,
                                  ),
                                  SizedBox(width: 2),
                                  Image.asset(
                                    'assets/images/Icon_star_solid.png',
                                    width: 20,
                                    color: Color(0xff989BA1),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
//NOTE: MAIN FACILITIES
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Main Facilities',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                  name: 'kitchen',
                                  imageUrl: 'assets/images/icon1.png',
                                  total: 2),
                              FacilityItem(
                                  name: 'bedroom',
                                  imageUrl: 'assets/images/icon2.png',
                                  total: 3),
                              FacilityItem(
                                  name: 'Big Lemari',
                                  imageUrl: 'assets/images/icon3.png',
                                  total: 3),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
//NOTE: PHOTOS
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Photos',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 88,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(width: edge),
                              Image.asset('assets/images/foto4.png',
                                  width: 110, height: 88, fit: BoxFit.cover),
                              SizedBox(width: 18),
                              Image.asset('assets/images/foto5.png',
                                  width: 110, height: 88, fit: BoxFit.cover),
                              SizedBox(width: 18),
                              Image.asset('assets/images/foto6.png',
                                  width: 110, height: 88, fit: BoxFit.cover),
                              SizedBox(width: edge)
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
//NOTE: LOCATION
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Location',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jln. Kappan Sukses No. 20\nPalembang',
                                style: greyTextStyle,
                              ),
                              InkWell(
                                onTap: () {
                                  LaunchUrl('https://wa.me/+6285722122963');
                                  //LaunchUrl('1234');
                                },
                                child: Image.asset('assets/images/btn_maps.png',
                                    width: 40),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: edge),
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          child: ElevatedButton(
                            onPressed: () {
                              LaunchUrl('tel:+6285722122963');
                            },
                            child: Text('Book Now',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 18,
                                )),
                            style: ElevatedButton.styleFrom(
                                primary: purplecolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17))),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/btn_back.png',
                        width: 40,
                      ),
                    ),
                    Image.asset(
                      'assets/images/btn_wishlist.png',
                      width: 40,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
