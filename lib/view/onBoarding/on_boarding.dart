import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({ Key? key }) : super(key: key);

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var pageController =  PageController();
  int pageIndex =0;
  List<String> titles =[
    'Welcome to myShop App',
    'this Shop App help you find your items ',
    ' I Hope you Happy',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                  onPressed: (){
                      print('last');   
                  },
                  child: Text('Skip',style: GoogleFonts.raleway(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 36, 180, 113)
                  ),),
              ),
              
            ),
          ),
          Expanded(
            child:PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index){
                setState(() {
                  pageIndex=index;
                  print(pageIndex);
                });
              },
              itemBuilder: (context,index)=>Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/shop.png',height: 300,width: 300,fit: BoxFit.cover,),
                    const SizedBox(height: 10,),
                   Text('${titles[index]}',style: GoogleFonts.raleway(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 36, 180, 113)
                  ),)                     
                  ],
                ),
              ),
              itemCount: titles.length,
              
              )
            
            ),
            Expanded(child: 
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: pageController, 
                effect: const WormEffect(
                  spacing:  8.0,  
                  radius:  4.0,  
                  dotWidth:  24.0,  
                  dotHeight:  16.0,  
                  paintStyle:  PaintingStyle.stroke,  
                  strokeWidth:  1.5,  
                  dotColor:  Colors.grey,  
                  activeDotColor:   Color.fromARGB(255, 36, 180, 113)  
                ),
                count: titles.length),
                FloatingActionButton(onPressed: (){
                  if(pageIndex ==2){
                    print('last');
                  }else{
                   pageController.nextPage(duration: const Duration(milliseconds: 5000), curve: Curves.bounceInOut);

                  }
                },child:const Center(child: Icon(Icons.forward,color: Colors.white,),) ,backgroundColor:  Color.fromARGB(255, 36, 180, 113),)
            ],
            )
            )
        ],
      ),
      
    );
  }
}