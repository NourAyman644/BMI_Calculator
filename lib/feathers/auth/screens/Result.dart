import 'package:bmi_calculator/core/utils/AppColors.dart';
import 'package:bmi_calculator/core/utils/AppStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class result extends StatelessWidget {
  final double BMI;
   result({required this.BMI});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 55,),
            Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                },
                  icon: const Icon(
                    CupertinoIcons.back, size: 36, color: AppColors.text,),),
                const SizedBox(width: 15,),
                Text(AppStrings.title2, style: GoogleFonts.roboto(
                  color: AppColors.text,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                )
                  ,
                )
              ],
            ),
            const SizedBox(height: 60,),
            Container(
              height: 500,
              width: 383,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: AppColors.back2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // if(BMI<18.5)
                  //   Text('Under Wight',
                  //     style: GoogleFonts.roboto(
                  //       color: AppColors.text2,
                  //       fontSize: 35,
                  //       fontWeight: FontWeight.w700,
                  //     ),
                  // ),
                  // else if(BMI<18.5&& BMI>24.9)
                  //   Text('Normal Wight',
                  //  style: GoogleFonts.roboto(
                  //  color: AppColors.text2,
                  //   fontSize: 35,
                  //     fontWeight: FontWeight.w700,
                  //     ),






                    Center(
                      child: Text('${BMI}',style: GoogleFonts.roboto(
                        color: AppColors.text,
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
