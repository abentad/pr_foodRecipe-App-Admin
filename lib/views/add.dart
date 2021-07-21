import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  var currentPageValue = 0;
  late TextEditingController _ingredientAmountController = TextEditingController(text: "1");

  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _pageController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          // physics: NeverScrollableScrollPhysics(),
          children: [
            buildAddFoodPage(
                context: context,
                size: size,
                imageContainerOntap: () {},
                continueButtonOnPressed: () {
                  _pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                }),
            buildAddIngredientsPage(
              size: size,
              continueButtonOnPressed: () {
                _pageController.animateToPage(2, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
              },
            ),
            Container(
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddFoodPage({required BuildContext context, required Size size, required Function() imageContainerOntap, required Function() continueButtonOnPressed}) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        height: size.height * 0.95,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04),
            Text("Add Food info", style: TextStyle(fontSize: 18.0, color: Colors.grey)),
            SizedBox(height: size.height * 0.04),
            InkWell(
              onTap: imageContainerOntap,
              child: Container(
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(color: Colors.black38, offset: Offset(2, 7), blurRadius: 20.0),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text("Image"),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.1),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black38, offset: Offset(2, 7), blurRadius: 20.0),
                ],
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter Food name",
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                ),
              ),
            ),
            Spacer(),
            MaterialButton(
              onPressed: continueButtonOnPressed,
              color: Theme.of(context).primaryColor,
              height: 50.0,
              minWidth: double.infinity,
              child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 18.0)),
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }

  Widget buildAddIngredientsPage({required Size size, required Function() continueButtonOnPressed}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: size.height * 0.95,
      decoration: BoxDecoration(),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.04),
          Text("Add Ingredients", style: TextStyle(fontSize: 18.0, color: Colors.grey)),
          SizedBox(height: size.height * 0.04),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: IconButton(
                  onPressed: () {
                    int num = int.parse(_ingredientAmountController.text);
                    if (num > 1) num--;
                    _ingredientAmountController.text = num.toString();
                    setState(() {});
                  },
                  icon: Icon(Icons.low_priority_rounded),
                ),
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _ingredientAmountController,
                  maxLength: 2,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                  onPressed: () {
                    int num = int.parse(_ingredientAmountController.text);
                    num++;
                    _ingredientAmountController.text = num.toString();
                    setState(() {});
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Expanded(
            child: ListView.builder(
              itemCount: int.parse(_ingredientAmountController.text),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Ingredient name",
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          MaterialButton(
            onPressed: continueButtonOnPressed,
            color: Theme.of(context).primaryColor,
            height: 50.0,
            minWidth: double.infinity,
            child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 18.0)),
          ),
          SizedBox(height: size.height * 0.02),
        ],
      ),
    );
  }
}
