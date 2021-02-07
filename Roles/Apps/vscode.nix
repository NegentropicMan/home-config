{ pkgs ? import <nixpkgs> {}, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
  ];

  programs.vscode = {
   enable = true;
    package = pkgs.vscode;

    userSettings = {
      "[nix]"."editor.tabSize" = 2;
      "workbench.colorTheme" = "PaperColor Redux";
      "telemetry.enableTelemetry" = false;
      "telemetry.enableCrashReporter" = false;
      "editor.fontFamily" = "Fira Code";
      "editor.fontLigatures" = true;
    };

    extensions = (with pkgs.vscode-extensions; [
      bbenoist.Nix
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
      name = "remote-ssh-edit";
      publisher = "ms-vscode-remote";
      version = "0.47.2";
      sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
      {
      name = "papercolor-vscode-redux";
      publisher = "mrworkman";
      version = "0.9.0";
      sha256 = "0k23agvwdpcm66rni6qzhza7s9jbrmyfg945cbqhdwl4kxjhwp1k";
      }
    ];
  };
}
