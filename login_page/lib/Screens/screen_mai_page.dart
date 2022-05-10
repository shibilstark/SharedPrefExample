import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_page/Screens/screen_login_page.dart';
import 'package:login_page/obj/list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedPage extends StatefulWidget {
  LoggedPage({Key? key}) : super(key: key);

  @override
  State<LoggedPage> createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> {
  get http => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(224, 27, 27, 26),
          title: const Text(
            "My App",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  signOut(context);
                },
                icon: Icon(Icons.logout))
          ],
        ),
        backgroundColor: Color.fromARGB(239, 255, 244, 195),
        body: SafeArea(
          child: Column(
            children: [
              // Container(
              //   decoration: const BoxDecoration(
              //     color: Color.fromARGB(19, 0, 0, 0),
              //   ),
              //   // margin: EdgeInsets.only(top: 5),
              //   height: 270,
              //   child: ListView.builder(
              //     itemBuilder: (BuildContext ctx, index) {
              //       return Padding(
              //         padding: const EdgeInsets.only(
              //             top: 20, bottom: 20, left: 10, right: 10),
              //         child: ClipRRect(
              //             borderRadius: BorderRadius.circular(10),
              //             child: Image.asset(
              //               Pics[index],
              //             )),
              //       );
              //     },
              //     itemCount: Pics.length,
              //     scrollDirection: Axis.horizontal,
              //   ),
              // ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  child: const Text(
                    "Profiles",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: "Font1",
                        color: Color.fromARGB(223, 27, 26, 27),
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  )),
              Expanded(
                child: Container(
                  // margin: EdgeInsets.only(top: 5),

                  child: ListView.separated(
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration:const  BoxDecoration(
                            color: Color.fromARGB(223, 253, 248, 201)),
                        height: 100,
                        child: ListTile(
                            title: Text(
                              Names[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(jobs[index]),
                            leading: RenderImage(index)),
                      );
                    },
                    itemCount: Names.length,
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // showDialog(
  signOut(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();

    showDialog(
        context: ctx,
        builder: (ctxShowDialogue) {
          return AlertDialog(
            title: Text("Logout?"),
            content: Text("Do you want to Logout?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctxShowDialogue).pop();
                  },
                  child: Icon(Icons.close)),
              TextButton(
                  onPressed: () {
                    _sharedPrefs.clear();
                    Navigator.of(ctx).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (ctx1) => LoginPage()),
                        (route) => false);
                  },
                  child: Icon(Icons.done)),
            ],
          );
        });
  }
}

Widget RenderImage(index) {
  

    if (index%2==1) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(images[index]));
    } else{
      return Image.asset(images[index]);
    }

}
