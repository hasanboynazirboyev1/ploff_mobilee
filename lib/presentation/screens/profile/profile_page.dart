import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';
import 'package:ploff_mobile/presentation/widgets/show_dialog_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      if (state is RegisterHomeState) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text(
              "Профиль",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 12),
                      child: Container(
                        alignment: Alignment.center,
                        height: 90,
                        decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          title: Text(
                            state.nameController.text,
                            style: const TextStyle(
                                color: Color(0xff000000),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            state.numberController.text,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xff5F5F5F),
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset(
                              "assets/profil_icons/profil.svg"),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) {
                              return ListTile(
                                leading: SvgPicture.asset(state.svgPath[index]),
                                title: Text(
                                  state.settingsList[index],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff000000)),
                                ),
                                trailing: SvgPicture.asset(
                                    "assets/profil_icons/cloud.svg"),
                              );
                            }),
                            separatorBuilder: ((context, index) {
                              return const Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12),
                                child:  Divider(thickness: 1),
                              );
                            }),
                            itemCount: 4))
                  ],
                ),
                const Gap(100),
                
                Column(
                  children: const [
                    Padding(
                      padding:
                           EdgeInsets.only(right: 16, left: 16,),
                      child: SHowDialogWidget(),
                    ),
                     Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Center(
                        child: Text(
                          "Version 1.0.0",
                          style: TextStyle(
                              color: Color(0xff858585),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Container(),
        );
      }
    });
  }
}
