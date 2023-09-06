import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_learning_course_app/pages/welcome/block/welcome_blocks.dart';
import 'package:e_learning_course_app/pages/welcome/block/welcome_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'block/welcome_events.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state){
              return SizedBox(
                width: 375.w,
                child: Padding(
                  padding: EdgeInsets.all(24.0.w),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      PageView(
                        onPageChanged: (index){
                          state.page = index;
                          BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                        },
                        children: [
                          _page(
                            1,
                            'Learn Anywhere',
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                            'Image/path',
                          ),
                          _page(
                            2,
                            'At your pace',
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                            'Image/path',
                          ),
                          _page(
                              3,
                              'Stay connected',
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                              'Image/path',
                              buttonText: 'Start'
                          ),
                        ],
                      ),
                      Positioned(
                          bottom: 100.h,
                          child: DotsIndicator(
                            dotsCount: 3,
                            position: state.page,
                            decorator: DotsDecorator(
                              size: const Size.square(9.0),
                              activeSize: const Size(18.0, 9.0),
                              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                            ),
                          )
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ),
      ),
    );
  }

  Widget _page(
      int index,
      String title,
      String subTitle,
      String image,
      {String buttonText = 'Next'}
    ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(image),
        ),
        Text(title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(subTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        ElevatedButton(
            onPressed: (){},
            child: Text(buttonText)
        )
      ],
    );
  }
}
