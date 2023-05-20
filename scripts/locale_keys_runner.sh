#!/bin/bash

# Script to generate Dart class from JSON file

PYTHON_SCRIPT_PATH="scripts/locale_keys_generator.py"
INPUT_PATH="assets/translations/en.json"
OUTPUT_PATH="lib/app/app_locale_keys.dart"

python3 $PYTHON_SCRIPT_PATH --input $INPUT_PATH --output $OUTPUT_PATH
