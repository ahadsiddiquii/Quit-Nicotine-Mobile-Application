import 'package:flutter/material.dart';
import 'package:nicotine/Screens/ServiceProvider/service_card.dart';
import 'package:sizer/sizer.dart';

import '../../models/ServiceItem.dart';
import '../Components/backButton.dart';

class ServiceProvider extends StatefulWidget {
  const ServiceProvider({Key? key}) : super(key: key);

  @override
  State<ServiceProvider> createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  List<ServiceItem> serviceItem = [
    ServiceItem(
        image:
            "https://www.botanicalhairlounge.co.uk/wp-content/uploads/2022/03/BOTANICAL-LIFE-LOGO-1-WITH-POL-WHITE.png",
        url: "https://www.botanicalhairlounge.co.uk/",
        itemName: "Botanical Hair Lounge"),
    ServiceItem(
        image: "assets/medical.jpeg",
        url: "http://www.medical-station-project.co.uk",
        itemName: "Medical Station"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: backButton(context),
        backgroundColor: Colors.white,
        title: Text(
          "Service Provider",
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.white,
        child: ListView.builder(
            itemCount: serviceItem.length,
            itemBuilder: (BuildContext context, int index) {
              return ServiceCard(
                  serviceItem: serviceItem[index],
                  isAsset: (index == 0) ? false : true);
            }),
      ),
    );
  }
}
