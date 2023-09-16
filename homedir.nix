{
  environment.etc.fablab = {
    source = ./home;
  };
  system.activationScripts.script.text = ''
    if [[ $(who | grep fablab) > 0 ]]; then exit 0; fi
    cp -r /etc/fablab/ /home
    chown -R fablab:users /home/fablab
    chmod -R u+w /home/fablab
  '';
}
