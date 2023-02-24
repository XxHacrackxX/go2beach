import 'package:flutter/material.dart';
import 'package:go2beach/Pages/welcome_page.dart';
import 'package:go2beach/Pages/widgets/altro.dart';
import 'package:go2beach/Pages/widgets/prenotazioni.dart';
import 'package:go2beach/app.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 55, right: 20, top: 50, bottom: 50),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Text(
                  "BENTORNATO, Nome Cognome",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Ink.image(
                        image: NetworkImage(
                            "https://scontent-fco2-1.xx.fbcdn.net/v/t39.30808-6/330579137_565243368659554_7562562589408494825_n.png?_nc_cat=103&ccb=1-7&_nc_sid=e3f864&_nc_ohc=Is6PihPSsIEAX9-lep2&_nc_ht=scontent-fco2-1.xx&oh=00_AfBtvPgcz_HJos4wb5DzR-rTaRjC5MKY3xXejJcqp0y0Ug&oe=63FC4CB4"),
                        height: 150,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Prenota",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Ink.image(
                        image: NetworkImage(
                            "https://scontent-fco2-1.xx.fbcdn.net/v/t39.30808-6/326055203_502022251994288_896415117840245242_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=e3f864&_nc_ohc=mzrGS0keIjcAX_Hyd0Y&_nc_ht=scontent-fco2-1.xx&oh=00_AfB8vc5BS9HoTNFdX0kfkXMyN-nZsTFSDfB3LzxYXQ74PQ&oe=63FD7D19"),
                        height: 150,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Prenota",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Ink.image(
                        image: NetworkImage(
                            "https://scontent-fco2-1.xx.fbcdn.net/v/t31.18172-8/27709703_2008063602764952_8705598066956287630_o.jpg?_nc_cat=103&ccb=1-7&_nc_sid=e3f864&_nc_ohc=0QX1hEkXoP0AX91fjZk&_nc_ht=scontent-fco2-1.xx&oh=00_AfBJ_RoaRSnO0sfjiA5sGuiJgDYnnhkjiuzXOEkujUyaVA&oe=641F1517"),
                        height: 150,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Prenota",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Ink.image(
                        image: NetworkImage(
                            "https://scontent-fco2-1.xx.fbcdn.net/v/t1.6435-9/192331046_4019291364853079_7857054923546642601_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=e3f864&_nc_ohc=-OxQ3VuObLgAX-PAF4m&_nc_oc=AQmhPYq7ToYA2WWkKXHI3KUm6wS-12jCbbBWQTTL1zXZP4TUbZqxX9BIh7jk3Mbapzc&tn=kf5h-3b--Mrn-CT3&_nc_ht=scontent-fco2-1.xx&oh=00_AfCGC9ypIu8RaYogSFcq61HY61kEl661bEO8Ihf6N27UgA&oe=641F2952"),
                        height: 150,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Prenota",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Material(
                color: Colors.blue,
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Ink.image(
                        image: NetworkImage(
                            "https://scontent-fco2-1.xx.fbcdn.net/v/t1.6435-9/31543871_2099994430257220_7578342082939453440_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=e3f864&_nc_ohc=oVaqaROtCt8AX-_-OS8&_nc_ht=scontent-fco2-1.xx&oh=00_AfBS4Z03ZnBElwmSA3P9Z99eUKVVbXVESi5Me02liDiZ4w&oe=641F273F"),
                        height: 150,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Prenota",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
