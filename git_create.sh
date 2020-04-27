git init
git add .
git commit -m "First commit"
echo "# webapp" >> README.md
git add README.md
git remote add origin https://github.com/mmartofel/gpdb-parquet.git
git push -u origin master
git remote -v
git push -u origin master
