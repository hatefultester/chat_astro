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
      'user_data_generation_loading' : 'We are processing your data, please be patient',
    },
    'cs_CZ': {
      'date_of_birth_form_title': 'Datum narození:',
      'date_of_birth_form_placeholder_hint': 'Zadejte své datum narození',
      'time_of_birth_form_title': 'Čas narození:',
      'time_of_birth_form_placeholder_hint': 'Zadejte svůj čas narození',
      'place_of_birth_form_title': 'Místo narození:',
      'place_of_birth_form_placeholder_hint': 'Zadejte název města a země, kde jste se narodil',
      'user_data_generation_form_validation_warning': 'Ujistěte se, že jste všechna pole vyplnili správně.',
      'user_data_generation_form_submit_button': 'Odeslat',
      'user_data_generation_loading' : 'Zpracováváme vaše údaje, buďte prosím trpělivý',
    },
    'es_ES': {
      'date_of_birth_form_title': 'Fecha de nacimiento:',
      'date_of_birth_form_placeholder_hint': 'Inserte su fecha de nacimiento',
      'time_of_birth_form_title': 'Hora de nacimiento:',
      'time_of_birth_form_placeholder_hint': 'Inserte su hora de nacimiento',
      'place_of_birth_form_title': 'Lugar de nacimiento:',
      'place_of_birth_form_placeholder_hint': 'Ingrese el nombre de la ciudad y el país donde nació',
      'user_data_generation_form_validation_warning': 'Por favor, asegúrese de haber llenado todos los campos correctamente.',
      'user_data_generation_form_submit_button': 'Enviar',
      'user_data_generation_loading' : 'Estamos procesando sus datos, por favor sea paciente',
    },
  };
}
