import 'package:flutter/material.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/myself_form_widgets/myself_form.dart';
import 'package:oven/widgets/requests_page_widgets/request_new_branch/other_person_widgets/other_person_link_generator_button.dart';

class RequestContainer extends StatefulWidget {
  const RequestContainer({super.key});
  @override
  State<RequestContainer> createState() => _RequestContainerState();
}

class _RequestContainerState extends State<RequestContainer> {
  UserSelected? userSelected;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
            child: Row(
              children: [
                Text(
                  "Create New Branch",
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(fontSize: 17),
                ),
              ],
            ),
          ),
          Container(height: 2, color: Theme.of(context).colorScheme.primary),
          if (userSelected == null)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Choose whether you want to enter the new branch data or other person :",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          if (userSelected == null) SizedBox(height: 50),
          if (userSelected == null)
            Column(
              spacing: 10,
              children: [
                SizedBox(
                  width: 200,
                  height: 40,
                  child: FormSubmitButtom(
                    onPressed: () {
                      setState(() {
                        userSelected = UserSelected.myself;
                      });
                    },
                    textChild: Text(
                      "Myself",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: FormSubmitButtom(
                    onPressed: () {
                      setState(() {
                        userSelected = UserSelected.otherPerson;
                      });
                    },
                    textChild: Text(
                      "Other person",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          if (userSelected == UserSelected.myself) MyselfForm(),
          if (userSelected == UserSelected.otherPerson)
            OtherPersonLinkGeneratorButton(),
        ],
      ),
    );
  }
}

enum UserSelected { myself, otherPerson }
