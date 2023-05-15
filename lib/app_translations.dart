import 'package:get/get.dart';

class AppTranslations extends Translations {
  static const appDisplayName = 'Test app';

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'date_of_birth_form_title': 'Date of birth:',
      'date_of_birth_form_placeholder_hint': 'Insert your date of birth',
      'time_of_birth_form_title': 'Time of birth:',
      'time_of_birth_form_placeholder_hint': 'Insert your time of birth',
      'place_of_birth_form_title': 'Place of birth:',
      'place_of_birth_form_placeholder_hint': 'Insert the name of the city and country you were born',
      'user_data_generation_form_validation_warning': 'Please make sure you filled all fields properly.',
      'user_data_generation_form_submit_button': 'Submit',
    },
  };
}
