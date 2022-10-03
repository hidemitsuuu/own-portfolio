import 'package:flutter/material.dart';
import 'package:own_portfolio/gen/assets.gen.dart';
import 'package:own_portfolio/view/home/sub/title_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          const TitleView(title: 'プロフィール'),
          _profileView(),
        ],
      ),
    );
  }

  Widget _profileView() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: _mainProfileView(),
          ),
        ),
        Expanded(
          child: _subProfileView(),
        ),
      ],
    );
  }

  Widget _mainProfileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blueGrey,
              width: 1,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(.5),
                offset: const Offset(3, 3),
                blurRadius: 3,
              ),
            ],
          ),
          child: ClipOval(
            child: _dummyData.icon.image(),
          ),
        ),
        ..._dummyData.mainProfiles.map((e) => _textArea(e.title, e.content)),
      ],
    );
  }

  Widget _subProfileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._dummyData.subProfiles.map((e) => _textArea(e.title, e.content))
      ],
    );
  }

  Widget _textArea(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(title),
          ),
          Expanded(
            flex: 5,
            child: Text(content),
          ),
        ],
      ),
    );
  }
}

final _dummyData = _DummyData(
  icon: Assets.images.githubIcon,
  mainProfiles: [
    _DummyProfilesData(title: '氏名', content: '鈴木 太郎'),
    _DummyProfilesData(title: '生年月日', content: '1993年 9月 17日'),
  ],
  subProfiles: [
    _DummyProfilesData(title: '所属', content: 'Hoge株式会社'),
    _DummyProfilesData(
        title: '資格', content: 'Solutions Architect アソシエイト\nSecurity スペシャリティ'),
    _DummyProfilesData(
        title: '自己紹介',
        content:
            'あいうえおかきくけこ、さしすせそなにぬねの。\nたちつてとなにぬねの\nはひふへほ、まみむめもやゆよ、らりるれろわをん。'),
  ],
);

class _DummyData {
  _DummyData({
    required this.icon,
    required this.mainProfiles,
    required this.subProfiles,
  });
  AssetGenImage icon;
  List<_DummyProfilesData> mainProfiles;
  List<_DummyProfilesData> subProfiles;
}

class _DummyProfilesData {
  _DummyProfilesData({
    required this.title,
    required this.content,
  });
  String title;
  String content;
}
