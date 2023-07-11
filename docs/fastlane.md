Pour autoriser fastlane a deployer sur google play store , il faut suivre ces etapes

https://docs.fastlane.tools/actions/supply/

Il faut un compte google cloud qui sera mandataire de service et inviter ce compte sur l'espace playstore du developpeur.

Il faut egalement upload manuellement le projet une fois https://github.com/fastlane/fastlane/issues/14686

Le play store n'autorise pas d'upload un bundle avec un nom de package com.example comme crée par defaut par
flutter. Il faut utiliser la commande `flutter create --org com.yourdomain appname` : https://stackoverflow.com/a/51550358
