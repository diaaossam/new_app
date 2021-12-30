import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/components/custom_divider.dart';
import 'package:new_app/components/custom_list_item.dart';
import 'package:new_app/components/custom_outline_border.dart';
import 'package:new_app/screens/search/cubit/search_cubit.dart';
import 'package:new_app/screens/search/cubit/search_states.dart';
import 'package:new_app/sharing/style/size_config.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SearchCubit cubit = SearchCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10.0)),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (String value) {
                    if (value != null) cubit.getSearchData(searchText: value);
                  },
                  decoration: InputDecoration(
                    border: buildCustomOutLineBorder(),
                    suffixIcon: Icon(Icons.search),
                    hintText: ('type to search ...'),
                  ),
                ),
                Expanded(
                  child: cubit.newsModel != null
                      ? ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BuildCustomListItem(
                                cubit.newsModel!.articles![index]);
                          },
                          separatorBuilder: (context, index) {
                            return CustomDivider();
                          },
                          itemCount: cubit.newsModel!.articles!.length)
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
