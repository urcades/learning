mod reverse_string;
mod gigasecond_from;

fn main() {
    // Reverse String
    println!("{}", reverse_string::run("uüu"));
    println!("{}", reverse_string::run("I love you."));
    // Gigasecond
    println!("{}", gigasecond_from::run("DATE GOES HERE"));
}
