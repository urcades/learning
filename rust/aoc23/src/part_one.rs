use std::{fs::File, io::Read};

pub fn run() {

    let mut aoc23_file = File::open("input.txt").unwrap();
    let mut contents: String = String::from("");
    aoc23_file.read_to_string(&mut contents).unwrap();

    let modified_contents: Vec<String> = contents
        .lines()
        .map(|line| line.chars().filter(|c| c.is_digit(10)).collect())
        .collect();

    let mut sum = 0;

    // for line in modified_contents {
    //     match line.len() {
    //         0 => println!(""),
    //         1 => {
    //             let first_char = line.chars().next().unwrap().to_string();
    //             println!("{}", first_char.repeat(2));
    //         },
    //         _ => {
    //             let first_char = line.chars().next().unwrap().to_string();
    //             let last_char = line.chars().last().unwrap().to_string();
    //             println!("{}{}", first_char, last_char);
    //         },
    //     }

    for line in modified_contents {
        let number = match line.len() {
            0 => 0,
            1 => {
                let first_char = line.chars().next().unwrap().to_string();
                first_char.repeat(2).parse::<i32>().unwrap()
            },
            _ => {
                let first_char = line.chars().next().unwrap().to_string();
                let last_char = line.chars().last().unwrap().to_string();
                format!("{}{}", first_char, last_char).parse::<i32>().unwrap()
            },
        };
        sum += number;
    }

    println!("Sum: {}", sum);
}