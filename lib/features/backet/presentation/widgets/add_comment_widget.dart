import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';

class AddCommentWidget extends StatelessWidget {
  const AddCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Комментарий',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Gap(10),
            SizedBox(
              height: 44,
              child: TextFormField(
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Напишите комментарий к заказу",
                  hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff858585),
                      fontWeight: FontWeight.w400),
                  fillColor: const Color(0xffF5F5F5),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
