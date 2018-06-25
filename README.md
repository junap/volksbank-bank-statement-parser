# volksbank-bank-statement-parser

A bash script that takes the source CSV of a Berliner Volksbank statement and generates a different CSV file of the transactions. Currently uses the CSV format for importing into YNAB.

## Notes

First do a regex find '\n' and replace with '§§'

Script requires executable permissions `chmod +x convert_current.sh`

Usage: `./convert_current.sh bank.csv > ynab.csv`
