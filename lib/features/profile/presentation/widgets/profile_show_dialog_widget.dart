import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/features/main_home/presentation/main_bloc/main_bloc.dart';
import 'package:ploff_mobile/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../register/presentation/bloc/register_bloc.dart';
// import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';

class SHowDialogWidget extends StatelessWidget {
  const SHowDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();
    final mainBloc = context.read<MainBloc>();
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: ((context) {
                  return AlertDialog(
                    content: SizedBox(
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                              "Вы хотите выйти из своей учетной записи?"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width:
                                      MediaQuery.of(context).size.width * .27,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xffF5F5F5)),
                                  child: Text(
                                    "отмена",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  
                                  profileBloc.add(ExitProfileEvent());
                                  mainBloc.add(ThrowfirstPageEvent());
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .27,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xffFFCC00)),
                                  child: const Text(
                                    "выход",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }));
          },
          child: Container(
            alignment: Alignment.center,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffffffff),
            ),
            child: const Text(
              "Выйти",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffF2271C),
                  fontWeight: FontWeight.w600),
            ),
          ),
        );
      },
    );
  }
}
