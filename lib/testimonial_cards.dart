import 'package:flutter/material.dart';
import 'package:portfolio/testimonial.dart';

class TestimonialCards extends StatelessWidget {
  final List<Testimonial> testimonials;
  const TestimonialCards({super.key, required this.testimonials});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: testimonials.length,
          itemBuilder:(context,index){
              return Container(
                width: 300,

                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Image.asset("assets/quotest.png"),
                    Text(
                      '“${testimonials[index].quote}”',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Spacer(),
                    Text(
                      testimonials[index].author,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    Text(
                      testimonials[index].location,
                      style: TextStyle(color: Colors.grey,fontSize: 9),
                    ),

                  ],
                ),
                
              );
          }
          ),
    );
  }
}
