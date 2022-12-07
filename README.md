##### Encrypt archive folder ready for upload

* From home/user/ convert archive/ folder to tar

```bash
tar -czzf archive.tar.gz archive/
```

* List public keys

```bash
gpg --list-keys
```

* Encrypt folder

```bash
gpg -o archive.gpg --encrypt -r D5557B332830404939C27D578CEDDB5272262D4C /home/jim/archive.tar.gz
```

* Move archive.gpg to encryted_archive/

```bash
mv archive.gpg encrypted_archive/
```

* Remove archive.tar.gz

```bash
rm archive.tar.gz
```

* All together

```bash
tar -czzf archive.tar.gz archive/
gpg -o archive.gpg --encrypt -r D5557B332830404939C27D578CEDDB5272262D4C /home/jim/archive.tar.gz
mv archive.gpg encrypted_archive/
rm archive.tar.gz
```

* Navigate /home/user/encrypted_archive

```bash
cd /home/jim/encrypted_archive
```

* Add new commit to branch

```bash
git add .
git commit -m "update"
```

* Push commit to github

```bash
git push origin master
```
