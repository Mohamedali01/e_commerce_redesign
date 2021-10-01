import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final BoxConstraints? constraints;

  const SearchWidget({this.constraints});

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    return Container(
      width: constraints!.maxWidth,
      height: SizeConfig.screenHeight * 0.065,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, cons) {
          return FittedBox(
            fit: BoxFit.fill,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                width: cons.maxWidth,
                height: cons.maxHeight,

                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    size: cons.maxHeight*0.7,
                  ),
                  title: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          height: cons.maxHeight*0.8,
                          child: VerticalDivider(
                            thickness: 1,
                            width: 20,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: cons.maxHeight,
                            child: Center(
                              child: CustomTextFormField(
                                inputBorder: InputBorder.none,
                                fontSize: defaultSize*2.4,
                                hintText: 'Search Your Product',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
