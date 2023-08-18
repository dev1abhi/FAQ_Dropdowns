import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'faq_constants.dart';

void main() {
  runApp( MaterialApp(
    home:TabBarExample(),
  ));
}


class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> {

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredDataList = yourDataList;

  void _filterData(String searchText) {
    setState(() {
      _filteredDataList = yourDataList.where((data) {
        return data['title']!.toLowerCase().contains(searchText.toLowerCase()) ||
            data['content']!.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:  Text('FAQS',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 30,

          ),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(

                // icon: Icon(Icons.cloud_outlined),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.feedback_outlined),
                    SizedBox(width:10.0),
                    Text('FeedBack',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
             ),
             ),
              ],
                  ),
                      ),
              Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.help),
                      SizedBox(width:10.0),
                      Text('FAQs',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.trending_up_rounded),
                    SizedBox(width:10.0),
                    Text('Whats New',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),

            Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterData,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search FAQs',
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                    ),
                  ),
                ),
              ),

              Center(
                child: Text(
                  'About Cryptic Hunt',
                  style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: _filteredDataList.length,
                  itemBuilder: (context, index) {
                    final data = _filteredDataList[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: DropDownItem(
                        title: data['title']!,
                        content: data['content']!,
                      ),
                    );
                  },
                ),
              ),
            ],
            ),


            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownItem extends StatelessWidget {
  final String title;
  final String content;

  const DropDownItem({Key? key, required this.title, required this.content})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4EA),
        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
      ),
      child: GFAccordion(
        expandedTitleBackgroundColor: const Color(0xFFFFF4EA),
        collapsedTitleBackgroundColor: const Color(0xFFFFF4EA),
        contentBackgroundColor: const Color(0xFFFFF4EA),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        titlePadding: const EdgeInsets.symmetric(vertical: 1),
        titleChild: Text(title,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: const Color(0xFF000000))),
        collapsedIcon: const Icon(Icons.arrow_drop_down),
        expandedIcon: const Icon(Icons.arrow_drop_up),
        contentChild: Text(content,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: const Color(0xFF000000))),
      ),
    );
  }
}





