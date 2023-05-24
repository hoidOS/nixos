final: prev: {
  dwmblocks = prev.dwmblocks.overrideAttrs (old: {
    src = prev.fetchFromGitHub {
      owner = "hoidOS";
      repo = "dwmblocks";
      rev = "46af0cc59526123f37a7d8fb6a8c7c35b375d07b";
      sha256 = "sha256-6Bw4cAMbmP6ZJwoxM5kfH08DLW0QWXCnN878fLCrWb4=";
    };
  });
}
