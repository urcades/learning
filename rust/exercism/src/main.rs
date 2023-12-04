use unicode_segmentation::UnicodeSegmentation;

fn main() {
    
    fn reverse(input: &str) -> String {
        let reversed_string: String = input.to_string().graphemes(true).rev().collect();
        reversed_string
    }
    
    println!("{}", reverse("uüu"));
    println!("{}", reverse("I love you."));
}
