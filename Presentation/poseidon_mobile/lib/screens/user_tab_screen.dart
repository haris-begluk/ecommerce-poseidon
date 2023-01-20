import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openapi/constants.dart';
import 'package:openapi/providers/user.dart';
import 'package:openapi/screens/orders_screen.dart';
import 'package:openapi/utils/screen_utils.dart';
import 'package:openapi/widgets/credit_card_form.dart';
import 'package:openapi/widgets/image_container.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/user-details';

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<User>(context);
    return Container(
      height: MQuery.height * 2.0,
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(4.0),
          ),
          ImageContainer(imageUrl: 'https://picsum.photos/200'),
          SizedBox(
            height: getProportionateScreenHeight(8.0),
          ),
          Text(
            '${userProvider.userDetails.firstName} ${userProvider.userDetails.lastName}',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            '${userProvider.userDetails.email}',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: kTextColorAccent,
                ),
          ),
          Divider(
            height: getProportionateScreenHeight(32.0),
          ),
          ProfileCard(
            keyName: 'orders',
            image: 'assets/images/ui/cart_nav.png',
            color: kAccentPurple,
            title: 'Orders',
            tapHandler: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderScreen()),
              );
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(8.0),
          ),
          ProfileCard(
            keyName: 'profile',
            image: 'assets/images/ui/profile_user.png',
            color: kAccentGreen,
            title: 'My profile',
            tapHandler: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(8.0),
          ),
          ProfileCard(
            keyName: 'address',
            image: 'assets/images/ui/map_user.png',
            color: kAccentTosca,
            title: 'My Address',
            tapHandler: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(8.0),
          ),
          ProfileCard(
            keyName: 'credit-card',
            image: 'assets/images/ui/creditcard.png',
            color: kAccentYellow,
            title: 'Credit card',
            tapHandler: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(8.0),
          ),
          ProfileCard(
            keyName: 'notification',
            image: 'assets/images/ui/noti_user.png',
            color: kAccentYellow,
            title: 'Notification',
            tapHandler: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(8.0),
          ),
          ProfileCard(
            keyName: 'help-center',
            image: 'assets/images/ui/check_user.png',
            color: kAccentPurple,
            title: 'Help',
            tapHandler: () {},
          ),
          SizedBox(
            height: getProportionateScreenHeight(8.0),
          ),
          ElevatedButton(
            child: Text('Logout'),
            onPressed: () => {userProvider.auth.logout()},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                kPrimaryGreen,
              ),
              foregroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              elevation: MaterialStateProperty.all(
                0,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              textStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Text(
            'ver 1.00',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: kTextColorAccent,
                ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(8.0),
          )
        ],
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  final String? image;
  final String title;
  final String keyName;
  final Function()? tapHandler;
  final Color color;
  final bool expandable;

  const ProfileCard(
      {Key? key,
      required this.keyName,
      this.image,
      required this.title,
      required this.tapHandler,
      required this.color,
      this.expandable = true})
      : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  Map<String, Widget> userWidgets = {
    'orders': OrdersProfile(),
    'profile': UserProfile(),
    'address': UserAddress(),
    'credit-card': CreditCardForm(),
    'notification': Text('Not available'),
    'help-center': Text(
        'If you face an issue please contact support poseidon@support.com'),
    'logout': Text('Profile'),
  };
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tapHandler,
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(4.0),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: kShadowColor.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                widget.image != null
                    ? Container(
                        padding: EdgeInsets.all(
                          getProportionateScreenWidth(8.0),
                        ),
                        decoration: ShapeDecoration(
                          color: widget.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(4.0),
                            ),
                          ),
                        ),
                        child: Image.asset(widget.image!))
                    : SizedBox(width: 10),
                SizedBox(
                  width: getProportionateScreenWidth(20.0),
                ),
                Expanded(
                  child: Text(widget.title,
                      style: Theme.of(context).textTheme.headline6),
                ),
                InkWell(
                  child: RotatedBox(
                    quarterTurns: _expanded ? 3 : 0,
                    child: Icon(Icons.chevron_right),
                  ),
                  onTap: () => setState(() => {
                        if (widget.expandable) {_expanded = !_expanded}
                      }),
                ),
              ],
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 200),
              child: ConstrainedBox(
                  constraints: _expanded && widget.expandable
                      ? BoxConstraints()
                      : BoxConstraints(maxHeight: 0),
                  child: userWidgets[widget.keyName]),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(16.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16.0),
          ),
          child: Column(
            children: [
              Text(''),
            ],
          ),
        ),
      ],
    );
  }
}

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<User>(context);

    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(16.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16.0),
          ),
          child: Column(
            children: [
              InputFormCard(
                title: 'Full name',
                value:
                    '${userProvider.userDetails.firstName} ${userProvider.userDetails.lastName}',
              ),
              InputFormCard(
                title: 'Birthdate',
                value:
                    '${DateFormat('yyyy-MM-dd').format(userProvider.userDetails.sysCreatedAt!)}',
              ),
              InputFormCard(
                title: 'Gender',
                value: 'Not available',
              ),
              InputFormCard(
                title: 'Email',
                value: '${userProvider.userDetails.email}',
              ),
              InputFormCard(
                title: 'Phone number',
                value: '${userProvider.userDetails.phoneNumber}',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UserAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<User>(context);

    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(16.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16.0),
          ),
          child: Column(
            children: [
              InputFormCard(
                title: 'Contact Name',
                value:
                    '${userProvider.userDetails.address?.firstName} ${userProvider.userDetails.address?.lastName}',
              ),
              InputFormCard(
                title: 'Contact Phone',
                value: '${userProvider.userDetails.address?.phoneNumber}',
              ),
              InputFormCard(
                title: 'Address',
                value: '${userProvider.userDetails.address?.address1}',
              ),
              InputFormCard(
                title: 'Country',
                value: '${userProvider.userDetails.address?.county}',
              ),
              InputFormCard(
                title: 'City',
                value: '${userProvider.userDetails.address?.city}',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InputFormCard extends StatelessWidget {
  const InputFormCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: kTextColorAccent,
              fontSize: getProportionateScreenWidth(13),
            ),
          ),
        ),
        Flexible(
          child: TextFormField(
            initialValue: value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: getProportionateScreenWidth(13),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
