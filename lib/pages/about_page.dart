import 'package:flutter/material.dart';
import 'package:oven/widgets/about_page_widgets/about_page_section_data.dart';
import 'package:oven/widgets/about_page_widgets/about_page_section_header.dart';
import 'package:oven/widgets/about_page_widgets/contact_us_data_section.dart';
import 'package:oven/widgets/about_page_widgets/social_media_icons.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutPageSectionHeader(headerText: "WHO WE ARE"),
                AboutPageSectionData(
                  sectionData:
                      "For years, Oven has been at the heart of dessert creation for restaurants, cafés, and bakeries that care about quality. Known for our consistency, craftsmanship, and attention to detail, we’ve built a brand that chefs and business owners trust. Every recipe we create is designed to inspire — blending tradition with innovation to deliver desserts that taste as good as they look. With Oven, quality isn’t just a promise; it’s our signature.",
                ),
                AboutPageSectionHeader(headerText: "WHAT WE DO"),
                AboutPageSectionData(
                  sectionData:
                      "At Oven, we’ve built our reputation as one of Egypt’s trusted food production partners — crafting everything from fine desserts and freshly baked pastries to hearty sandwiches and complete hospital meals. Our state-of-the-art facilities and dedicated team ensure that every product meets the highest standards of quality, safety, and taste. Whether it’s supplying cafés, restaurants, hotels, or healthcare centers, we take pride in delivering freshness, consistency, and flavor right to your door. With Oven, every bite is made with care and delivered with reliability.",
                ),
                AboutPageSectionHeader(headerText: "Contact us"),
                ContactUsDataSection(),
                AboutPageSectionHeader(headerText: "Social Media"),
                SocialMediaIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
