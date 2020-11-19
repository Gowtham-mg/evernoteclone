import 'package:evernote/hive_helper.dart';
import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Hive.box(HiveBoxHelper.user).values.first;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              user.profilePic == null
                  ? CircleAvatar(
                      radius: 30,
                      child: Text(user.name == null
                          ? user.email.substring(0, 1)
                          : user.name.substring(0, 1)),
                      backgroundColor: Colors.red,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        user.profilePic,
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      )),
              if (!user.isPremiumUser)
                MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/flash.svg',
                          color: Theme.of(context).primaryIconTheme.color,
                          height: Theme.of(context).appBarTheme.iconTheme.size *
                              1.05,
                          width: Theme.of(context).appBarTheme.iconTheme.size *
                              1.05,
                        ),
                        Text(
                          MetaText.upgradeAccount,
                          maxLines: 2,
                          softWrap: true,
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user.name ?? user.email.split('@')[0],
              style: Theme.of(context).primaryTextTheme.subtitle2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Icon(Icons.keyboard_arrow_up)
          ],
        ),
        Text(
          user.email,
          style: Theme.of(context).textTheme.headline6,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            user.isPremiumUser ? MetaText.premiumPlan : MetaText.basicPlan,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        )
      ],
    );
  }
}
