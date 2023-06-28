import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/theme.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            _headerUser(context),
            const SizedBox(
              height: 30,
            ),
            ProfileMenu(),
          ],
        ),
      ),
    );
  }
}

Widget _headerUser(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://cojo.ru/wp-content/uploads/2022/12/eonovaia-maska-sudnaia-noch-4.webp'),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hodame',
                  style: MyTextTheme().smallTitle,
                ),
                Text(
                  'Verified Profile',
                  style: MyTextTheme().smallTextGray,
                )
              ],
            ),
          ],
        ),
        InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Ink(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.surface),
              child: Text(
                '3 orders',
                style: MyTextTheme().smallTextGray,
              ),
            ))
      ],
    ),
  );
}

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  final darkModeBox = Hive.box('darkMode');

  late bool _isDarkMode = false;

  final List<String> menuOptions = [
    'Account Information',
    'Password',
    'Orders',
    'Wishlist',
    'Settrings'
  ];
  final List<IconData> menuIcons = [
    Icons.manage_accounts_outlined,
    Icons.lock_outline_rounded,
    Icons.local_mall_outlined,
    Icons.favorite_outline_rounded,
    Icons.settings_outlined
  ];

  @override
  void initState() {
    super.initState();

    darkModeBox.put('isDarkMode', false);
    setState(() {
      _isDarkMode = darkModeBox.get('isDarkMode');
      print(darkModeBox.get('isDarkMode'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              onTap: () {},
              leading: Icon(menuIcons[index]),
              title: Text(
                menuOptions[index],
                style: MyTextTheme().defaultText,
              ),
            );
          },
          itemCount: menuOptions.length,
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30),
          value: _isDarkMode,
          onChanged: (value) {
            darkModeBox.put('isDarkMode', value);
            print(darkModeBox.get('isDarkMode'));
            setState(() {
              _isDarkMode = value;
            });
          },
          secondary: Icon(_isDarkMode
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined),
          title: Text('Dark mode'),
        ),
      ],
    );
  }
}
