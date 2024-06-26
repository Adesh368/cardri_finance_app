import 'package:cardri_finance/reusable_custom_widget/help_bottom_bar.dart';
import 'package:flutter/material.dart';

class BvnVerifictionScreen extends StatefulWidget {
  const BvnVerifictionScreen({super.key});

  @override
  State<BvnVerifictionScreen> createState() => _BvnVerifictionScreenState();
}

class _BvnVerifictionScreenState extends State<BvnVerifictionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F2FB),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    
                    width: 32,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Verification',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff1B1B1B),
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Select the type of ID to validate',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color(0xff474256),
                      ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 88,
                    decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/nin.png'),
                        const SizedBox(width: 20),
                        Text(
                            style: Theme.of(context).textTheme.bodySmall!,
                            'National Identity Number (NIN)')
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 88,
                    decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/bvn.png'),
                        const SizedBox(width: 20),
                        Text(
                            style: Theme.of(context).textTheme.bodySmall!,
                            'Bank Verification Number (BVN)')
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 64,
                  decoration: BoxDecoration(
                      color: const Color(0xffEFD1DC),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/info.png'),
                      const SizedBox(width: 10),
                      Text(
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 10),
                          'You can proceed with either one now, but you will be \nrequired to provide the other for subsequent upgrade.')
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const HelpBottomBar(),
        ]),
      ),
    );
  }
}
