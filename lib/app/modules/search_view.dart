import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_market_report/app/modules/stock_details/views/stock_details_home_view.dart';
import 'package:stock_market_report/app/modules/stocks_home/controllers/stocks_home_controller.dart';

import '../widgets/fade_in_animation.dart';

class SearchView extends StatelessWidget {
  final StocksHomeController _controller = Get.put(StocksHomeController());
  final TextEditingController searchController = TextEditingController();
  SearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        leading: const SizedBox(),
        backgroundColor: const Color(0xff121212),
        title: Row(
          children: [
            Flexible(
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  onChanged: (_) {
                    _controller.getSuggestions(searchController.text);
                    searchController.text == ""
                        ? _controller.isSearchControllerEmpty.value = true
                        : _controller.isSearchControllerEmpty.value = false;
                  },
                  focusNode: _controller.focusNode,
                  controller: searchController,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.yellow,
                  cursorWidth: 2,
                  cursorRadius: const Radius.circular(500),
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: const Color(0XFFEBEBEB).withOpacity(.15),
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: const Icon(
                        Icons.search_sharp,
                        color: Color(0XFF838383),
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                      bottom: 15,
                      left: 12,
                      right: 12,
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.white54,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -.2
                        // letterSpacing: 1.1,
                        ),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.white12,
                        width: 1.4,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.white54,
                        width: 1.4,
                      ),
                    ),
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            InkWell(
              borderRadius: BorderRadius.circular(6),
              splashColor: Colors.transparent,
              highlightColor: Colors.white12,
              onTap: () {
                Get.back();
              },
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -.2),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeIn(
                      duration: const Duration(milliseconds: 400),
                      delay: const Duration(milliseconds: 200),
                      child: _controller.isSearchControllerEmpty.value == true
                          ? Text(
                              'Search for the name of a Stock.',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white54,
                                height: 1.8,
                                letterSpacing: -.2,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i <
                                        _controller
                                            .filteredListOfStocks.value.length;
                                    i++)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.white12,
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () => Get.off(
                                      () => StockDetailsView(
                                        _controller
                                            .filteredListOfStocks![i].name,
                                        _controller
                                            .filteredListOfStocks![i].symbol,
                                      ),
                                      transition: Transition.fadeIn,
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        left: 8,
                                        top: 12,
                                        bottom: 12,
                                      ),
                                      width: Get.width,
                                      child: Text(
                                        _controller
                                            .filteredListOfStocks.value[i].name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
