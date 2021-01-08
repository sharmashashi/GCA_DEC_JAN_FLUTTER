import 'package:flutter/material.dart';
import 'package:fluttergca/custom_widgets/search_bar.dart';
import 'package:fluttergca/custom_widgets/trending_card.dart';
import 'package:fluttergca/utils/custom_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          SizedBox(
            height: Get.height * .43,
            width: Get.width,
            child: Stack(
              children: [
                _appbar(),
                Positioned(bottom: 0, child: _topTrendings()),
              ],
            ),
          ),
          _category(),
          _recent(),
          SizedBox(height: Get.height * .4)
        ],
      ),
    );
  }

  Widget _recent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recent",
              style: TextStyle(
                  color: CustomColors.primaryBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          _recentCards()
        ],
      ),
    );
  }

  Widget _recentCards() {
    return Center(
      child: Wrap(
        runSpacing: 20,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        spacing: 20,
        children: [
          _recentCard(),
          _recentCard(),
          _recentCard(),
          _recentCard(),
          _recentCard(),
          _recentCard(),
          _recentCard(),
          _recentCard(),
          _recentCard(),
        ],
      ),
    );
  }

  Widget _recentCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * .4,
          height: Get.height * .35,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/dog.jpg",
                fit: BoxFit.fitHeight,
              )),
        ),
        SizedBox(
          height: 15,
        ),
        Text("Toy Story",
            style: TextStyle(
                color: CustomColors.primaryBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _category() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        _head(),
        _categoryItems(),
      ],
    );
  }

  Widget _head() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Category",
              style: TextStyle(
                color: CustomColors.primaryBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          _seeMoreBtn()
        ],
      ),
    );
  }

  Widget _seeMoreBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(50)),
      child: Text("See more"),
    );
  }

  Widget _categoryItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _eachCategoryItem(
          text: "Action",
          iconData: FontAwesomeIcons.solidHandRock,
        ),
        _eachCategoryItem(
            text: "Comedy", iconData: FontAwesomeIcons.solidLaugh),
        _eachCategoryItem(
          text: "Sci-fi",
          iconData: FontAwesomeIcons.robot,
        ),
        _eachCategoryItem(
            text: "Romance", iconData: FontAwesomeIcons.solidHeart),
      ],
    );
  }

  Widget _eachCategoryItem({String text, IconData iconData}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
          ),
          child: FaIcon(
            iconData,
            color: CustomColors.primaryBlue,
          ),
        ),
        SizedBox(height: 5),
        Text(text,
            style: TextStyle(
              color: CustomColors.primaryBlue,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }

  Widget _topTrendings() {
    return Container(
      height: Get.height * .25,
      width: Get.width,
      color: Colors.transparent,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TrendingCard(),
            TrendingCard(),
            TrendingCard(),
            TrendingCard(),
            TrendingCard(),
          ],
        ),
      ),
    );
  }

  Widget _appbar() {
    return Stack(
      children: [
        Container(
          height: Get.height * .30,
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColors.primaryBlue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        Positioned(
          right: -70,
          top: -50,
          child: Container(
            height: Get.height * .3,
            width: Get.height * .3,
            decoration: BoxDecoration(
                // borderRadius:
                //     BorderRadius.only(bottomRight: Radius.circular(20)),
                color: CustomColors.lightBlue,
                shape: BoxShape.circle),
          ),
        ),
        Positioned(
            top: 10,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    _searchBar(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Trending",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
      ],
    );
  }

  Widget _searchBar() {
    return SearchBar(
      searchBarWidth: Get.width*.8
    );
  }
}
