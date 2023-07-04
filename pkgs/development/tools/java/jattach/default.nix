{ lib, stdenv, fetchFromGitHub, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "jattach";
  version = "2.1";

  src = fetchFromGitHub {
    owner = "jattach";
    repo = "jattach";
    rev = "v${version}";
    sha256 = "sha256-JGP/keacJ0ghTe1CqDg/YJbL+GbJe9RKTTnj9W9XmMM=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall
    install -D build/jattach "$out/bin/jattach"
    runHook postInstall
  '';

  meta = with lib; {
    description = "The utility to send commands to a JVM process via Dynamic Attach mechanism";
    homepage    = "https://github.com/jattach/jattach";
    license     = licenses.asl20;
    maintainers = with maintainers; [ newzubakhin ];
    platforms   = platforms.all;
  };
}

