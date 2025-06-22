target = x86_64-unknown-uefi

build: cargo

cargo:
	cargo build

clean:
	rm -r target

create-bootimg:
	rm -r bootimg
	mkdir -p bootimg/EFI/BOOT
	cp target/$(target)/debug/bootx64.efi bootimg/EFI/BOOT 

qemu:
	rm -f qemu.log
	qemu-system-x86_64 -enable-kvm --bios /usr/share/ovmf/OVMF.fd -drive format=raw,file=fat:rw:bootimg >qemu.log 2>&1

run: build create-bootimg qemu
