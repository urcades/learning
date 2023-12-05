use unicode_segmentation::UnicodeSegmentation;

pub fn run(input: &str) -> String {
    let reversed_string: String = input.to_string().graphemes(true).rev().collect();
    reversed_string
}