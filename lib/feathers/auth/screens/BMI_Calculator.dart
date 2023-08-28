import 'dart:math';

import 'package:bmi_calculator/core/utils/AppStrings.dart';
import 'package:bmi_calculator/feathers/auth/screens/Result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/AppColors.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool ismale = true;
  double hight = 30;
  int wieght = 20;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        toolbarHeight: 65,
        title: Center(
          child: Text(
            AppStrings.title,
            style: GoogleFonts.roboto(
              color: AppColors.text,
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: AppColors.back,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //SizedBox(height: 20,),
                GestureDetector(
                  child: Container(
                    height: 159,
                    width: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: ismale ? AppColors.back2 : Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.female_outlined,
                          size: 65,
                          color: AppColors.text,
                        ),
                        Text(
                          AppStrings.f,
                          style: GoogleFonts.roboto(
                            color: AppColors.text,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ismale = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 159,
                    width: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: ismale ? Colors.grey : AppColors.back2,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.male_outlined,
                          size: 65,
                          color: AppColors.text,
                        ),
                        Text(
                          AppStrings.m,
                          style: GoogleFonts.roboto(
                            color: AppColors.text,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ismale = true;
                    });
                  },
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 40,
          // ),
          Container(
            height: 160,
            width: 330,
            decoration: const BoxDecoration(
              color: AppColors.back2,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppStrings.h,
                    style: GoogleFonts.roboto(
                      color: AppColors.text,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Slider(
                      value: hight,
                      max: 200,
                      min: 0,
                      label: hight.toStringAsFixed(0),
                      divisions: 20,
                      onChanged: (value) {
                        setState(() {
                          hight = value;
                        });
                      }),
                ],
              ),
            ),
          ),
          // const SizedBox(
          //   height: 38,
          // ),

          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 159,
                  width: 136,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: AppColors.back2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          AppStrings.w,
                          style: GoogleFonts.roboto(
                            color: AppColors.text,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text('${wieght}',
                            style: GoogleFonts.roboto(
                              color: AppColors.text,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            )),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  wieght -= 1;
                                });
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: AppColors.text,
                                size: 35,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  wieght += 1;
                                });
                              },
                              icon: const Icon(
                                Icons.add_circle_rounded,
                                color: AppColors.text,
                                size: 35,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 159,
                  width: 136,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: AppColors.back2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          AppStrings.age,
                          style: GoogleFonts.roboto(
                            color: AppColors.text,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text('${age}',
                            style: GoogleFonts.roboto(
                              color: AppColors.text,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            )),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: AppColors.text,
                                size: 35,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                              icon: const Icon(
                                Icons.add_circle_rounded,
                                color: AppColors.text,
                                size: 35,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  double BMI = wieght / pow(hight / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return result(BMI:  double.parse(BMI.toString().split('.')[1]));
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bnt,
                ),
                child: Text(
                  AppStrings.cal,
                  style: GoogleFonts.roboto(
                    color: AppColors.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
