for f in *.txt; do
  mv -- "$f" "${f%.txt}.$(date +%Y%m%d)"
done

