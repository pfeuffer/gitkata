if [ -d ../external_doc ]; then
    echo "please delete the directory ../external_doc before running this"
    exit -1
fi
mkdir sources
mkdir documentation
mkdir libraries
mkdir resources
touch sources/a
touch sources/lot
touch sources/of
touch sources/source
touch libraries/lib
touch resources/resource
echo "A very fine" > documentation/doc1.txt
echo "documentation," >> documentation/doc1.txt
echo "that just has" >> documentation/doc1.txt
echo "not been finished," >> documentation/doc1.txt
echo "yet." >> documentation/doc1.txt
git add .
git commit -m "start of development"
echo "Some more" > documentation/doc2.txt
echo "of this fine" >> documentation/doc2.txt
echo "documentation." >> documentation/doc2.txt
git add .
git commit -m "more development"
git tag -fa external_doc -m "We took the documentation folder from this commit and gave it away"
mkdir ../external_doc
if [ ! -d ../external_doc ]; then
    echo "could not create directory ../external_doc"
    exit -1
fi
(
    cp documentation/* ../external_doc
    cd ../external_doc
    git init
	git config --local user.name "external user"
	git add .
	git commit -m "initial version of documentation"
	sed -i 's/not been finished/been finished/g' doc1.txt
	git add doc1.txt
	git commit -m "finished doc1"
	sed -i 's/of this fine/of this completed/g' doc2.txt
	git add doc2.txt
	git commit -m "finished doc2"
)
echo "And there is" >> documentation/doc2.txt
echo "more to come." >> documentation/doc2.txt
git add .
git commit -m "extended doc2"
