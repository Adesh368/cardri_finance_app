import 'package:flutter/material.dart';
import 'package:cardri_finance/data/country_data.dart';

class CountrySelectorOverlay extends StatelessWidget {
  const CountrySelectorOverlay({
    super.key,
    required this.selectCountry,
    //required this.selectedCountry,
    //required this.selectedCode,
  });

  final void Function(int index) selectCountry;
  //final String? selectedCountry;
  // final String? selectedCode;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.6,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Country',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1B1B1B),
                        ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/Close.png'),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search country here',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: const Color.fromARGB(255, 65, 55, 94)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: screenHeight * 0.4,
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        selectCountry(index);
                      },
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.asset(countries[index].flag),
                            const SizedBox(width: 10),
                            Text(countries[index].name),
                            const Spacer(),
                            Text(
                              countries[index].code,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: countries[index].code != '+234'
                                        ? const Color(0xffD70D4A)
                                        : const Color(0xff474256),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
