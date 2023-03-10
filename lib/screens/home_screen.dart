import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_shared/bloc/resep_bloc.dart';
import 'package:state_shared/helper/shared_preferences.dart';
import 'package:state_shared/model/resep_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String? name;
  Future getUsername() async {
    String name = await getName();
    return name;
  }

  @override
  void initState() {
    // TODO: implement initState
    // getUsername();
    super.initState();
    context.read<ResepBloc>().add(ResepEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffFDFBF6),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xff331609), width: 3))),
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo_bantuin.png',
                    height: 30,
                  ),
                  Column(
                    children: [
                      FutureBuilder(
                          future: getUsername(),
                          builder: (context, snapshot) {
                            return Text(
                              'Halo, ${snapshot.data}',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff331609)),
                            );
                          }),
                      Text(
                        'Pontianak',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Color(0xffAFAEAC)),
                      ),
                    ],
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo_bantuin.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            BlocBuilder<ResepBloc, ResepState>(builder: ((context, state) {
              if (state is LoadingResepState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (state is ResepState && state.resep != null) {
                  Resep resep = state.resep!;
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return Text('${resep.data![index].resep}');
                      }),
                      itemCount: resep.data!.length,
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Kosong'),
                  );
                }
              }
            }))
          ],
        ),
      ),
    ));
  }
}
