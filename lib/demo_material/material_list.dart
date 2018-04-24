import 'package:flutter/material.dart';

///
/// 成就目标实体类
///
class Target {
  final String name; // 成就目标名称
  final String reward; // 成就奖励内容
  /// 构造函数
  const Target({
    this.name,
    this.reward,
  });
}

///
/// 目标改变回调
///
typedef void TargetChangedCallback(
  Target target, // 目标
  bool nowTarget, // 是否有新目标
);

class AchievementViewItem extends StatelessWidget {
  final Target target; // 目标
  final bool nowTarget; // 是否有新目标
  final TargetChangedCallback onTargetChanged; // 目标改变回调

  /// 构造函数
  AchievementViewItem({
    Target target,
    this.nowTarget,
    this.onTargetChanged,
  })  : target = target,
        super(

            ///
            /// 控件和元素的标识符：
            /// 将其对象的标识用作其值
            /// 用于将控件的标识绑定到用于生成该控件的对象的标识
            ///
            key: new ObjectKey(target));

  ///
  /// 获取颜色
  /// 有新目标返回灰色
  /// 否则返回主题背景色
  ///
  Color _getColor(BuildContext context) {
    return nowTarget ? Colors.black54 : Theme.of(context).primaryColor;
  }

  ///
  /// 获取 name 的文本样式
  /// 如果是新目标，则划区旧目标文字，并将文字颜色减淡
  ///
  TextStyle _getNameTextStyle(BuildContext context) {
    if (!nowTarget)
      return new TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    return new TextStyle(
      fontSize: 16.0,
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough,
    );
  }

  ///
  /// 获取 reward 的文本样式
  /// 如果是新目标，则划区旧目标文字，并将文字颜色减淡
  ///
  TextStyle _getRewardTextStyle(BuildContext context) {
    if (!nowTarget)
      return new TextStyle(
        fontSize: 13.0,
        color: Colors.black,
      );
    return new TextStyle(
      fontSize: 13.0,
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // 开始构建控件
    return new ListTile(
      onTap: () => onTargetChanged(target, !nowTarget),
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text('囧'),
      ),
      title: new Text(
        target.name,
        style: _getNameTextStyle(context),
      ),
      subtitle: new Text(
        '奖励\n' + target.reward,
        style: _getRewardTextStyle(context),
      ),
    );
  }
}

class AchievementViewList extends StatefulWidget {
  final List<Target> targets; // 目标列表

  AchievementViewList({
    this.targets,
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _AchievementListState();
}

class _AchievementListState extends State<AchievementViewList> {
  Set<Target> _achievements = new Set<Target>(); // 成就集合

  ///
  /// Target 目标
  /// nowTarget 是否为新目标
  ///
  void _achievementChanged(Target target, bool nowTarget) {
    setState(() {
      if (nowTarget)
        _achievements.add(target);
      else
        _achievements.remove(target);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: widget.targets.map(
      (Target target) {
        return new AchievementViewItem(
          target: target,
          nowTarget: _achievements.contains(target),
          onTargetChanged: _achievementChanged,
        );
      },
    ).toList());
  }
}

final List<Target> _kTargets = <Target>[
  new Target(name: '生存一百天', reward: '金钱￥2500\t最高能量+20'),
  new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
  new Target(name: '获得￥5000', reward: "获得信用卡"),
  new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
  new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
  new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
  new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
  new Target(name: '获得￥5000', reward: "获得信用卡"),
  new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
  new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
];

class AchievementViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text('神马模拟器'),
        ),
      ),
      body: new AchievementViewList(targets: _kTargets),
    );
  }
}
