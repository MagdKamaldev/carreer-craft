import 'package:career_craft/core/colors.dart';
import 'package:career_craft/features/login/presentaion/views/login_tab.dart';
import 'package:career_craft/features/signup/presentation/views/signup_tab.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class EntranceBody extends StatefulWidget {
  const EntranceBody({super.key});

  @override
  State<EntranceBody> createState() => _EntranceBodyState();
}

class _EntranceBodyState extends State<EntranceBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabController.index = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: size.height * 0.1),
            child: TabBar(
              indicatorColor: secondary.shade400,
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              onTap: (value) => setState(() {
                _tabController.index = value;
              }),
              tabs: [
                Tab(
                  child: Text(
                    S.of(context).login,
                    style: theme.bodyMedium!.copyWith(
                      color: _tabController.index == 0
                          ? secondary.shade400
                          : primary.shade400,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    S.of(context).createAccount,
                    style: theme.bodyMedium!.copyWith(
                      color: _tabController.index == 1
                          ? secondary.shade400
                          : primary.shade400,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: primary.shade400,
            height: 1,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LoginTab(),
                SignUpTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
