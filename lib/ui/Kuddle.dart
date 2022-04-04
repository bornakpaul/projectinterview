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

class KuddlePage extends StatefulWidget {
  const KuddlePage({Key? key}) : super(key: key);

  @override
  State<KuddlePage> createState() => _KuddlePageState();
}

class _KuddlePageState extends State<KuddlePage> {
  @override
  Widget build(BuildContext context) {
    List<SubDetails> subdetails = [
      SubDetails(subscriptionName: 'Yearly', price: '20', discount: '40'),
      SubDetails(subscriptionName: 'Yearly', price: '20', discount: '40'),
      SubDetails(subscriptionName: 'Yearly', price: '20', discount: '40'),
      SubDetails(subscriptionName: 'Yearly', price: '20', discount: '40'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuddle'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SubscriptionSelection(
          details: subdetails.map((e) => e).toList(),
          selected: 0,
        ),
      ),
    );
  }
}

class SubscriptionSelection extends StatefulWidget {
  final int selected;
  final List<SubDetails> details;
  const SubscriptionSelection({
    Key? key,
    required this.selected,
    required this.details,
  }) : super(key: key);

  @override
  State<SubscriptionSelection> createState() => _SubscriptionSelectionState();
}

class _SubscriptionSelectionState extends State<SubscriptionSelection> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    if (widget.selected != null &&
        widget.selected >= 0 &&
        widget.selected < widget.details.length) {
      this.selectedIndex = widget.selected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: subBuilder,
        itemCount: widget.details.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget subBuilder(context, currentIndex) {
    SubDetails subDetails = widget.details[currentIndex];
    bool isActive = this.selectedIndex == currentIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = currentIndex;
        });
      },
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
                    'SAVE ' + subDetails.discount,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
            Text(
              subDetails.price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subDetails.subscriptionName + ' Subscription',
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
