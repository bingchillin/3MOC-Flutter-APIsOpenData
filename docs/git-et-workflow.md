Pour pouvoir ouvrir le module android dans android studio, il
faut recreer le projet

```
flutter create --platforms=android --org=com.esgistudentskmi .
```

Android studio a besoin d'un fichier `.iml` pour detecter
les modules android et permettre de les ouvrir dans studio,
pour signer l'app notamment et avoir le toolset gradle
et l'autocompletion et les refactorings activés. Ce fichier
est dans un .gitignore donc un git clone ne permet pas de
travailler correctement sur le projet.

En plus le nom du projet doit etre compatible
avec un nom de module dart donc il faut renommer le dossier, ici
ca aurait du etre `apis_open_data`.

Apràs un `git clone`, il faut donc renommer le dossier parent
depuis << 3MOC-Flutter-APIsOpenData >> vers << apis_open_data >>
