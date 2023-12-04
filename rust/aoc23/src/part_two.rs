use std::{fs::File, io::Read, collections::HashMap};

pub fn run() {
    // Open the file and read its contents into a string.
    let mut aoc23_file = File::open("input.txt").unwrap();
    let mut contents = String::new();
    aoc23_file.read_to_string(&mut contents).unwrap();

    // Create a map to convert English words for numbers into digits.
    let number_map = create_number_map();
    let mut sum = 0;

    for line in contents.lines() {
        // Process each line by converting each word to a digit if possible.
        let digits: String = line.split_whitespace()
            .filter_map(|word| {
                // Convert characters that are digits or find the corresponding number for words.
                word.chars().filter(|c| c.is_digit(10)).collect::<String>().parse::<u32>().ok()
                    .or_else(|| number_map.get(word).cloned())
            })
            .map(|num| num.to_string())
            .collect();

        // Handle the transformation based on the length of the digit string.
        let number = match digits.len() {
            0 => 0, // If there are no digits, contribute 0 to the sum.
            1 => digits.repeat(2).parse::<i32>().unwrap(), // Duplicate the digit if there's only one.
            _ => {
                // If there are two or more digits, concatenate the first and last digit.
                let first_char = digits.chars().next().unwrap().to_string();
                let last_char = digits.chars().last().unwrap().to_string();
                format!("{}{}", first_char, last_char).parse::<i32>().unwrap()
            },
        };
        sum += number; // Add the transformed number to the sum.
    }

    // Print the total sum of all the transformed lines.
    println!("Sum: {}", sum);
}

// Function to create a mapping of English number words to their corresponding digits.
fn create_number_map() -> HashMap<String, u32> {
    let mut map = HashMap::new();
    map.insert("one".to_string(), 1);
    map.insert("two".to_string(), 2);
    map.insert("three".to_string(), 3);
    map.insert("four".to_string(), 4);
    map.insert("five".to_string(), 5);
    map.insert("six".to_string(), 6);
    map.insert("seven".to_string(), 7);
    map.insert("eight".to_string(), 8);
    map.insert("nine".to_string(), 9);
    map
}