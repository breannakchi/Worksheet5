
csv_file="Global YouTube Statistics.csv"

country="United States"

categories=("Music" "Entertainment" "Gaming" "Comedy")

directory="./$country/"

mkdir -p "$country"

> ws5.txt

for category in "${categories[@]}"; do
    awk -F, -v country="$country" -v category="$category"  '$8==country && $5==category {print}' "$csv_file" > "${directory}${category}.txt"
    count=$(wc -l < "${directory}${category}.txt")
    echo "$category: $count" >> ws5.txt

done
