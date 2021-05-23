import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        children: [
          NavDrawerHeader(),
          // border
          NavDrawerItems(),
        ],
      ),
    );
  }
}

class NavDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.transparent,
              ),
              Text('안녕하세요'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              1 == 1
                  ? InkWell(
                      child: Text('로그인'),
                      onTap: () {
                        Navigator.of(context).popAndPushNamed('/login');
                      },
                    )
                  : InkWell(
                      child: Text('로그아웃'),
                      onTap: () {}, // logout
                    ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text('마이페이지'),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              InkWell(
                child: Text('회원가입'),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/register');
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class NavDrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavDrawerItem(title: "키보드", subtitles: []),
          NavDrawerItem(title: "게시판", subtitles: []),
          NavDrawerItem(title: "게임", subtitles: []),
          NavDrawerItem(title: "마이페이지", subtitles: []),
        ],
      ),
    );
  }
}

class NavDrawerItem extends StatelessWidget {
  final String title;
  final List<NavDrawerSubItem> subtitles;
  NavDrawerItem({required this.title, required this.subtitles});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Icon(Icons.keyboard),
          Padding(padding: EdgeInsets.all(10)),
          Text(title),
        ],
      ),
    );
  }
}

class NavDrawerSubItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
