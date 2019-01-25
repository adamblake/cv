# Teaching History
$for(teaching)$
## $teaching.type$

### $teaching.location$

$if(teaching.dates)$$teaching.dates$  $endif$
$if(teaching.details)$$teaching.details$$endif$

$for(teaching.items)$  
$teaching.items.item$  
$teaching.items.dates$  
$if(teaching.items.details)$
$teaching.items.details$  
$endif$

$endfor$

$endfor$
