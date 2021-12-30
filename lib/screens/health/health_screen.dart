import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/components/custom_divider.dart';
import 'package:new_app/components/custom_list_item.dart';
import 'package:new_app/screens/health/cubit/health_cubit.dart';
import 'package:new_app/screens/health/cubit/health_states.dart';

class HealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HealthCubit, HealthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HealthCubit cubit = HealthCubit.get(context);
        return cubit.newsModel != null
            ? ListView.separated(
            physics: BouncingScrollPhysics(),

            itemBuilder: (context, index) {
                  return BuildCustomListItem(cubit.newsModel!.articles![index]);
                },
                separatorBuilder: (context, index) {
                  return CustomDivider();
                },
                itemCount: cubit.newsModel!.articles!.length)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
