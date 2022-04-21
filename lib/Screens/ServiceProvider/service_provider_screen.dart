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
        image: "assets/theSchoolOfHealth.PNG",
        url: "https://www.schoolofhealth.com/",
        itemName: "The School of Health"),
    ServiceItem(
        image: "assets/liveAsYourSelf.PNG",
        url: "https://humandesign.org.uk/living-your-design-course",
        itemName: "Live as Yourself"),
    ServiceItem(
        image: "assets/sarahRaven.PNG",
        url: "https://www.sarahraven.com/",
        itemName: "Sarah Raven"),
    ServiceItem(
        image: "assets/medical.jpeg",
        url: "http://www.medical-station-project.co.uk",
        itemName: "Medical Station"),
    ServiceItem(
        image: "",
        url: "http://4medicinalpurposesonly.com/",
        itemName: "4 Medicinal Purposes Only"),
    ServiceItem(
        image: "",
        url: "http://addictedtoabuse.com",
        itemName: "Addicted to Abuse"),
    ServiceItem(
        image: "assets/beginWithTheEnd.png",
        url: "https://www.begin-with-the-end-in-mind.com/",
        itemName: "Begin with the end in mind"),
    ServiceItem(
        image: "assets/theBotanicalLife.PNG",
        url: "http://www.botanical-life.co.uk/",
        itemName: "The Botanical Life"),
    ServiceItem(
        image: "assets/botanicalLifeLogo.png",
        url: "https://www.botanicalhairlounge.co.uk/",
        itemName: "Botanical Hair Lounge UK"),
    ServiceItem(
        image: "assets/botanicalLifeLogo.png",
        url: "http://botanicalhairlounge.com/",
        itemName: "Botanical Hair Lounge"),
    ServiceItem(
        image: "",
        url: "http://childrenarenotbornnaughty.com/",
        itemName: "Children are not born naughty"),
    ServiceItem(
        image: "assets/discover4Recovery.png",
        url: "http://discovery4recovery.com/",
        itemName: "Discovery 4 Recovery"),
    ServiceItem(
        image: "",
        url: "http://hairhealthpractitioners.co.uk/",
        itemName: "Hair Health Practitioners"),
    ServiceItem(
        image: "",
        url: "https://hairlossandhairthinningsolutions.com/",
        itemName: "Hair loss and hair thinning solutions"),
    ServiceItem(
        image: "",
        url: "http://hairsciencetherapy.org/",
        itemName: "Hair science therapy"),
    ServiceItem(
        image: "", url: "http://heavenhqltd.com/", itemName: "HeavenHq Ltd"),
    ServiceItem(
        image: "assets/learnEarnAndGrowRich.jpg",
        url: "https://www.learnearnandgrowrich.com/",
        itemName: "Learn earn and grow rich"),
    ServiceItem(
        image: "",
        url: "https://www.power-of-an-hour.com/",
        itemName: "Power of an hour"),
    ServiceItem(image: "", url: "http://nospeak.org/", itemName: "No Speak"),
    ServiceItem(
        image: "", url: "http://saltandlite.org/", itemName: "Salt and Lite"),
    ServiceItem(
        image: "",
        url: "http://sellwhatyouloveandlovewhatyousell.com/",
        itemName: "Sell what you love and love what you sell"),
    ServiceItem(
        image: "",
        url: "http://standingonyourown2feet.com/",
        itemName: "Standing on your own 2 feet"),
    ServiceItem(
        image: "",
        url: "http://sweeneytoddsenterprise.com/",
        itemName: "Sweeney Todds Enterprise"),
    ServiceItem(
        image: "",
        url: "http://thehairdoctors.co.uk/",
        itemName: "The Hair Doctors"),
    ServiceItem(
        image: "",
        url: "http://swimmersworld.org/",
        itemName: "Swimmers World"),
    ServiceItem(
        image: "",
        url: "http://theyearwenearlylostchristmas.com/",
        itemName: "The year we nearly lost christmas"),
    ServiceItem(
        image: "",
        url: "http://thisisyourlife.world/",
        itemName: "This is your life"),
    ServiceItem(
        image: "",
        url: "http://whatsupwecare.com/",
        itemName: "Whats up we care"),
    ServiceItem(
        image: "assets/whereDoIGoFromHere.PNG",
        url: "http://wheredoigofromhereacademy.com/",
        itemName: "Where do I go from here academy"),
    ServiceItem(
        image: "",
        url: "http://womenwhodotoomuch.org/",
        itemName: "Women who do too much"),
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
