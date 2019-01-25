# Honors and Awards
$for(awards)$
## $awards.location$

$for(awards.items)$
$awards.items.dates$  
$awards.items.item$  
$if(awards.items.value)$
$awards.items.value$
$endif$

$endfor$

$endfor$
