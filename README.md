##### Encrypt archive folder ready for upload

* Convert archive folder to tar

```
tar -czzf archive.tar.gz archive/
```

* List public keys

```
gpg --list-keys
```

* Encrypt folder

```
gpg -o archive.gpg --encrypt -r D5557B332830404939C27D578CEDDB5272262D4C /home/jim/archive.tar.gz
```
