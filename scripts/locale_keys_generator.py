import json
import argparse
import os

def generate_dart_class(json_data, class_name="LocaleKey"):
    output = f"class {class_name} {{\n"
    
    for key in json_data.keys():
        output += f"  static const String {key.upper()} = '{key}';\n"
    
    output += "}"
    return output

def main():
    parser = argparse.ArgumentParser(description='Generate Dart class from JSON file')
    parser.add_argument('--input', type=str, help='Path to the input JSON file', required=True)
    parser.add_argument('--output', type=str, help='Path to the output Dart file', required=True)

    args = parser.parse_args()
    
    with open(args.input, 'r') as file:
        json_data = json.load(file)

    dart_class = generate_dart_class(json_data)

    with open(args.output, 'w') as file:
        file.write(dart_class)

    print(f"File {args.output} has been created successfully.")

if __name__ == "__main__":
    main()
