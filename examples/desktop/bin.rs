extern crate lr35902;

use lr35902::gameboy::{Gameboy, RenderMode::Desktop};

fn main() {
    let mut gb = Gameboy::new();
    match gb.load_rom("./sample-rom.gb") {
        Ok(..) => {
            gb.render(Desktop);
        }
        Err(err) => {
            println!("{:?}", err);
        }
    }
}
