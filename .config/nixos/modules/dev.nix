{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang-tools
    clang
    python3
    gcc
    gnumake
    llvmPackages_latest.libllvm
    llvmPackages_latest.libcxx
  ];
}