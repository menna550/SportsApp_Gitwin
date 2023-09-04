// Define a list of maps that holds some sample data
List<Map<String, dynamic>> data = [
  {'name': 'Alice', 'age': 25, 'gender': 'female', 'city': 'New York'},
  {'name': 'Bob', 'age': 30, 'gender': 'male', 'city': 'Los Angeles'},
  {'name': 'Charlie', 'age': 28, 'gender': 'male', 'city': 'Chicago'},
  {'name': 'David', 'age': 32, 'gender': 'male', 'city': 'Boston'},
  {'name': 'Eve', 'age': 27, 'gender': 'female', 'city': 'San Francisco'},
];

// Define a function that takes a text argument and searches for data that matches the text
void searchForData(String text) {
  // Convert the text to lower case for case-insensitive comparison
  text = text.toLowerCase();
  // Create an empty list to store the matching data
  List<Map<String, dynamic>> matches = [];
  // Loop through each map in the data list
  for (Map<String, dynamic> map in data) {
    // Loop through each key and value pair in the map
    for (String key in map.keys) {
      // Convert the value to a string and lower case for case-insensitive comparison
      String value = map[key].toString().toLowerCase();
      // Check if the value contains the text
      if (value.contains(text)) {
        // If yes, add the map to the matches list and break the inner loop
        matches.add(map);
        break;
      }
    }
  }
  // Check if the matches list is empty or not
  if (matches.isEmpty) {
    // If empty, print a message that no data was found
    print('No data was found for "$text"');
  } else {
    // If not empty, print a message that shows how many data were found
    print('${matches.length} data were found for "$text":');
    // Loop through each map in the matches list and print its contents
    for (Map<String, dynamic> map in matches) {
      print(map);
    }
  }
}
