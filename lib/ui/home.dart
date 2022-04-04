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
  bool subSelected = false;

  @override
  Widget build(BuildContext context) {
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
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: //subList.map((e) => e).toList(),
                      [
                    SubscriptionSelector(
                      subscriptionPack: SubscriptionPack.monthly,
                      subscriptionName: 'Monthly',
                      price: '₹220',
                      discount: '21%',
                      selected: subSelected,
                    ),
                    SubscriptionSelector(
                      subscriptionPack: SubscriptionPack.monthly,
                      subscriptionName: 'Monthly',
                      price: '₹220',
                      discount: '21%',
                      selected: subSelected,
                    ),
                    SubscriptionSelector(
                      subscriptionPack: SubscriptionPack.monthly,
                      subscriptionName: 'Monthly',
                      price: '₹220',
                      discount: '21%',
                      selected: subSelected,
                    ),
                    SubscriptionSelector(
                      subscriptionPack: SubscriptionPack.monthly,
                      subscriptionName: 'Monthly',
                      price: '₹220',
                      discount: '21%',
                      selected: subSelected,
                    ),
                  ]),
              const SizedBox(
                height: 30.0,
              ),
              const OneTimeButton(
                subscriptionPack: SubscriptionPack.oneTime,
              ),
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

class SubscriptionSelector extends StatefulWidget {
  final SubscriptionPack subscriptionPack;
  final String subscriptionName;
  final String price;
  final String discount;
  final bool selected;
  //final ValueChanged<bool>? onSelected;

  const SubscriptionSelector({
    Key? key,
    required this.subscriptionPack,
    required this.subscriptionName,
    required this.price,
    required this.discount,
    required this.selected,
    //this.onSelected,
  }) : super(key: key);

  @override
  State<SubscriptionSelector> createState() => _SubscriptionSelectorState();
}

class _SubscriptionSelectorState extends State<SubscriptionSelector> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selected = !_selected;
        setState(() {});
        //widget.onSelected;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: _selected ? Color(0xff05837F) : Colors.transparent),
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
                      color: _selected ? Color(0xff05837F) : Colors.transparent,
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
                    'SAVE ' + widget.discount,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
            Text(
              widget.price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${widget.subscriptionName} Subscription',
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

class OneTimeButton extends StatefulWidget {
  final SubscriptionPack subscriptionPack;
  const OneTimeButton({
    Key? key,
    required this.subscriptionPack,
  }) : super(key: key);

  @override
  State<OneTimeButton> createState() => _OneTimeButtonState();
}

class _OneTimeButtonState extends State<OneTimeButton> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.subscriptionPack == SubscriptionPack.oneTime,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
        },
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
                    color: _selected ? Color(0xff05837F) : Colors.transparent),
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
                            _selected ? Color(0xff05837F) : Colors.transparent,
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
