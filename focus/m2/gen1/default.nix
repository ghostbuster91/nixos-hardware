{
  imports = [
    ../../../common/cpu/intel
    ../../../common/pc/laptop
    ../../../common/pc/laptop/acpi_call.nix
    ../../../common/pc/laptop/ssd
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [
    "tpm_tis.interrupts=0" # Upstream bug: https://bugzilla.kernel.org/show_bug.cgi?id=204121
    # without this, kacpid worker thread consumes 100% cpu on kernels 5.15.111 and up
  ];
  boot.blacklistedKernelModules = [ "i2c_nvidia_gpu" ];

}
