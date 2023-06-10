import 'package:flutter/material.dart';
import 'package:math/configs/AppSize.dart';
import 'package:math/models/question_model.dart';

import '../configs/AppColor.dart';
import '../configs/AppString.dart';

class VariantsView extends StatelessWidget {
  const VariantsView(
      {Key? key,
        required this.question,
        required this.onAnswerATap,
        required this.onAnswerBTap,
        required this.onAnswerCTap,
        required this.onAnswerDTap})
      : super(key: key);

  final QuestionModel question;
  final VoidCallback onAnswerATap;
  final VoidCallback onAnswerBTap;
  final VoidCallback onAnswerCTap;
  final VoidCallback onAnswerDTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.width(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 1,),
              FittedBox(
                child: GestureDetector(
                  onTap: onAnswerATap,
                  child: Container(
                    width: AppSize.width(context) / 3,
                    height: AppSize.width(context) / 3,
                    decoration: const BoxDecoration (
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/polygon1.png',
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        question.answerA,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppSize
                              .theme(context)
                              .headlineMedium!
                              .fontSize,
                          fontWeight: FontWeight.w400,
                            color: AppColor.primary,
                            fontFamily: AppString.fontRegular
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2,),
              FittedBox(
                child: GestureDetector(
                  onTap: onAnswerBTap,
                  child: Container(
                    width: AppSize.width(context) / 3,
                    height: AppSize.width(context) / 3,
                    decoration: const BoxDecoration (
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/images/polygon2.png',
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        question.answerB,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppSize
                              .theme(context)
                              .headlineMedium!
                              .fontSize,
                          fontWeight: FontWeight.w400,
                            color: AppColor.primary,
                            fontFamily: AppString.fontRegular
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 3,),
            ],
          ),
          SizedBox(
            width: AppSize.width(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //AppSize.SpaceWidth(AppSize.width(context)~/6),
                const Spacer(flex: 3,),
                FittedBox(
                  child: GestureDetector(
                    onTap: onAnswerCTap,
                    child: Container(
                      width: AppSize.width(context) / 3,
                      height: AppSize.width(context) / 3,
                      decoration: const BoxDecoration (
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            'assets/images/polygon3.png',
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          question.answerC,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppSize
                                .theme(context)
                                .headlineMedium!
                                .fontSize,
                            fontWeight: FontWeight.w400,
                              color: AppColor.primary,
                              fontFamily: AppString.fontRegular
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 2,),
                FittedBox(
                  child: GestureDetector(
                    onTap: onAnswerDTap,
                    child: Container(
                      width: AppSize.width(context) / 3,
                      height: AppSize.width(context) / 3,
                      decoration: const BoxDecoration (
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            'assets/images/polygon4.png',
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          question.answerD,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppSize
                                .theme(context)
                                .headlineMedium!
                                .fontSize,
                            fontWeight: FontWeight.w400,
                              color: AppColor.primary,
                              fontFamily: AppString.fontRegular
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1,),
              ],
            ),
          ),
        ],
      ),
    );
  }
  }