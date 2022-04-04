import 'package:flutter/material.dart';

class SubDetails {
  final String subscriptionName;
  final String price;
  final String discount;

  const SubDetails({
    required this.subscriptionName,
    required this.price,
    required this.discount,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//   bool subSelected = false;
//   void _manageStateForChildWidget(bool newValue) {
//     setState(() {
//       subSelected = newValue;
//     });
//   }

  List<SubDetails> subdetails = [
    SubDetails(subscriptionName: 'Yearly', price: '10', discount: '20'),
    SubDetails(subscriptionName: 'Monthly', price: '50', discount: '10'),
    SubDetails(subscriptionName: 'Weekly', price: '20', discount: '3'),
    SubDetails(subscriptionName: 'Half-yearly', price: '100', discount: '20'),
  ];
  String? _subscriptionSelected;

  @override
  Widget build(BuildContext context) {
    _subscriptionSelected ??= subdetails[0].subscriptionName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff05837F),
        title: const Text('Kuddle'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dog Walking subscriptions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final subscriptionSelected =
                      subdetails[index].subscriptionName;
                  final isSelected =
                      subscriptionSelected == _subscriptionSelected;
                  return SubscriptionTile(
                    detailsList: subdetails,
                    price: subdetails[index].price,
                    discount: subdetails[index].discount,
                    subscription: subdetails[index].subscriptionName,
                    isActive: isSelected,
                    notifyParent: (bool selected) {
                      setState(() {
                        _subscriptionSelected =
                            selected ? subscriptionSelected : null;
                      });
                    },
                    index: index,
                  );
                },
                itemCount: subdetails.length,
              ),
              const SizedBox(
                height: 30.0,
              ),
              //   OneTimeButton(
              //     subscriptionPack: SubscriptionPack.oneTime,
              //     isActive: subSelected,
              //     notifyParent: _manageStateForChildWidget,
              //   ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xff05837F),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Select this plan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum SubscriptionPack { weekly, monthly, quarterly, yearly, oneTime, none }

class SubscriptionTile extends StatelessWidget {
  final List<SubDetails> detailsList;
  final String price;
  final String discount;
  final String subscription;
  final ValueChanged<bool>? notifyParent;
  final bool isActive;
  final int index;

  const SubscriptionTile({
    Key? key,
    required this.detailsList,
    required this.price,
    required this.discount,
    required this.subscription,
    this.notifyParent,
    required this.isActive,
    required this.index,
  }) : super(key: key);

  void manageState() {
    notifyParent!(!isActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: manageState,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isActive ? Color(0xff05837F) : Colors.transparent),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xff05837F),
                      width: 2,
                    ),
                  ),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: isActive ? Color(0xff05837F) : Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.deepOrangeAccent,
                  ),
                  child: Text(
                    'SAVE ' + discount + '%',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
            Text(
              'Rs.' + price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subscription,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '7 days/1 time',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OneTimeButton extends StatelessWidget {
  final SubscriptionPack subscriptionPack;
  final ValueChanged<bool>? notifyParent;
  final bool isActive;

  OneTimeButton({
    Key? key,
    required this.subscriptionPack,
    this.notifyParent,
    this.isActive = false,
  }) : super(key: key);

  void manageState() {
    notifyParent!(!isActive);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: subscriptionPack == SubscriptionPack.oneTime,
      child: GestureDetector(
        onTap: manageState,
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('OR'),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: isActive ? Color(0xff05837F) : Colors.transparent),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(112, 144, 176, 0.08),
                    offset: Offset(0.0, 0.0),
                    blurRadius: 16,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Color(0xff05837F),
                        width: 2,
                      ),
                    ),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:
                            isActive ? Color(0xff05837F) : Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('One time'),
                        Text('₹200'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
