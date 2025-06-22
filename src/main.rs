#![no_std]
#![no_main]

use log::info;
use uefi::prelude::*;

#[entry]
fn main() -> Status {
    uefi::helpers::init().unwrap();
    info!("Hello World!");
    boot::stall(10_000_000);
    Status::SUCCESS
}
