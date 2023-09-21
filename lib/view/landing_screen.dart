import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klashalunchapp/view/home_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h,horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Expanded(
                child: Row(
                  children: [
                    Text("Welcome To your personal ",style: GoogleFonts.fuggles(fontSize: 50.sp,color: Color(0xffB2BF71),fontWeight:FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 40.h,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child:Image.asset("assets/images/logo.png",height: 400.h,width: 700.w,fit: BoxFit.fill,)),
              SizedBox(height: 40.h,),

              InkWell(onTap: ()=>{
                Navigator.of(context).pushReplacement(PageRouteBuilder(
                  pageBuilder: (context, animation,secondaryAnimation){
                    return HomeScreen();
                  },
                  transitionsBuilder: (context,animation,secondaryAnimation,child){
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(position:offsetAnimation,child: child,);
                  },
                ),)
              },
                  child: Hero(
                    tag:"enterButton",
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 300),
                      height: 46,
                      width: 151,
                      decoration: BoxDecoration(
                          border: const Border(
                            bottom: BorderSide(color: Colors.white),
                            top: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                            left: BorderSide(color: Colors.white),
                          ),
                          color: Color(0xFF696A6C),
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Center(
                          child: Text(
                            "Enter",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )),
                    ),
                  ),

              )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
