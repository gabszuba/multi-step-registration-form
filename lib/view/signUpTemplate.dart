import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupTemplate extends StatelessWidget {
  final Widget? child; // Make child optional

  const SignupTemplate({Key? key, this.child}) : super(key: key);

  //List<bool> _selectedPage = <bool> [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5ECF6),
      body: Stack(
        children: [
          _bgBar(),
          _formContainer(),
          //_pageNumber()
        ],
      ),
    );
  }

  Widget _formContainer() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffffffff),
        ),
        child: IntrinsicHeight (child: child,),
      ),
    );
  }

  
  Widget _bgBar() {
    const String assetName = 'assets/bg-bar.svg';
    return SizedBox(
      width: double.infinity,
      child: SvgPicture.asset(
        assetName,
        semanticsLabel: 'Background Bar',
        fit: BoxFit.cover,
      ),
    );
  }


  /*Widget _pageNumber(){
    return Positioned (
      top: 15.0,
      child:
          ToggleButtons(
            children: [
              Text('1'),
              Text('2'),
              Text('3')
            ],
            isSelected: _selectedPage,
            color: Colors.white,
            selectedColor: Color.fromARGB(255, 2, 41, 90),
            fillColor: Color.fromARGB(255, 190, 226, 250),
            borderRadius: BorderRadius.circular(30.0),
            borderColor: Colors.white,
            selectedBorderColor: Color.fromARGB(255, 190, 226, 250),
            onPressed: () {}
          ),
      ),
  }*/
}
