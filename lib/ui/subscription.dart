import 'package:flutter/material.dart';

class SubscriptionDetails {
  final String subscriptionName;
  final String price;
  final String discount;

  const SubscriptionDetails({
    required this.subscriptionName,
    required this.price,
    required this.discount,
  });
}

class SubscriptionSelection extends StatefulWidget {
  const SubscriptionSelection({Key? key}) : super(key: key);

  @override
  State<SubscriptionSelection> createState() => _SubscriptionSelectionState();
}

class _SubscriptionSelectionState extends State<SubscriptionSelection> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SubscriptionTile extends StatelessWidget {
  final List<SubscriptionDetails> details;
  const SubscriptionTile({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isActive = true;
    return Container(
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
                  'SAVE ',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ),
          Text(
            'price',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            ' Subscription',
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
    );
  }
}
